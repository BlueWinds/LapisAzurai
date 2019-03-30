import $ from 'jquery'
import people, {aliases} from '../../content/people/_.coffee'

$.extend Person, {
  quote: (ignore, name, text)->
    unless people[name] then name = aliases[name]
    "<q class=#{name}>#{text}</q>"

  drawOverview: ->
    $('#overview .people').empty()
    Person.updateOverview()

  updateOverview: ->
    p = $('#overview .people')
    for person of g.people
      oldDiv = p.find("[person=#{person}]")
      newDiv = $(Person.draw(person))
      if oldDiv.length
        # If the svg is already present, replacing it would cause an annoying flicker for the player. Instead we take the messier route of updating everything around it.
        oldDiv.find('.picks').replaceWith(newDiv.find('.picks'))
        oldDiv.find('.description').replaceWith(newDiv.find('.description'))

        # Redraw the skill box, if there is one
        skill = $(".skill[p=#{person}]").attr('skill')
        if skill
          $("[skill=#{skill}]").replaceWith(Person.drawSkill(person, skill))
      else
        newDiv.find('object').on 'load', Person.activateSVG
        newDiv.mouseenter ->
          newDivPerson = @attributes.person.value
          p.find(".skill[p!=#{newDivPerson}]").remove()
          p.find(".person[person!=#{newDivPerson}] object").each ->
            $(@contentDocument).find('.active').removeClass('active')
        p.append(newDiv)
    return

  draw: (person)->
    xp = g.people[person].xp
    level = Person.level(xp)
    needed = Person.xpNeeded(level + 1)
    skillPoints = Person.skillPoints(person)

    s = if skillPoints is 1 then '' else 's'

    return """<div person="#{person}" class="person">
      <img src="game/content/#{people[person].img}.png">
      <div>
        <div class="name">#{people[person].name}</div>
        <div class="description">#{needed - xp}xp needed for next skill</div>
      </div>
      <div class="picks #{if skillPoints > 0 then 'active' else ''}">#{skillPoints} skill#{s} available</div>
      <object data="game/content/#{people[person].svg}"></object>
    </div>"""

  activateSVG: ->
    svg = @contentDocument
    personElement = $(@).parent()
    person = personElement.attr('person')
    p = $('#overview .people')
    # 1 = aura
    # 2 = fill
    # 3 = outline

    $('g circle:nth-child(2)', svg).css('display', 'none')
    for skill of g.people[person].skills
      console.log skill
      $("##{skill} circle:nth-child(2)", svg).css('display', 'initial')

    $('g', svg).on 'click', ->
      p.find('object').each ->
        $(@contentDocument).find('.active').removeClass('active')
      $(@).addClass('active')

      p.find(".skill[p=#{person}]").remove()
      personElement.after(Person.drawSkill(person, @id))

    $('g', svg).hover ->
      p.find(".skill.mouse-over[p=#{person}]").remove()
      skill = $(Person.drawSkill(person, @id)).addClass('mouse-over')
      personElement.after(skill)
    , ->
      if p.find(".skill[p=#{person}]").length > 1
        p.find(".skill.mouse-over[p=#{person}]").remove()

  drawSkill: (person, skill)->
    data = people[person].skills[skill]
    selected = g.people[person].skills[skill]

    selectButton = if selected
      ''
    else if Person.unmetRequirements(person, skill)
      "<button disabled>Requires #{Person.unmetRequirements(person, skill)}</button>"
    else if Person.skillPoints(person) <= 0
      '<button disabled>No skills available</button>'
    else
      "<button onclick='Person.clickSkill(\"#{person}\", \"#{skill}\")'>Select skill</button>"

    """<div class="skill" skill=#{skill} p="#{person}">
      <div class="name">#{data.name or skill}</div>
      #{selectButton}
      <p>#{data.description}</p>
    </div>"""

  clickSkill: (person, skill)->
    g.people[person].skills[skill] = true
    Place.showOverview()

    # Mark the skill as selected
    svg = $("[person=#{person}] object")[0].contentDocument
    $("##{skill} circle:nth-child(2)", svg).css('display', 'initial')

    # Redraw the skill box
    $("[skill=#{skill}").replaceWith(Person.drawSkill(person, skill))

    # Update available skill count
    newDiv = $(Person.draw(person))
    $("[person=#{person}] .picks").replaceWith(newDiv.find('.picks'))
}
