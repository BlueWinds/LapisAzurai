$.extend Person, {
  quote: (ignore, name, text)->
    unless Person[name] then name = Person.alias[name]
    "<q class=#{name}>#{text}</q>"

  updateOverview: ->
    p = $('#overview .people')
    for person of g.people when not p.find("[person=#{person}]").length
      personDiv = $(Person.draw(person))
      personDiv.find('object').on 'load', Person.activateSVG
      p.append(personDiv)
    return

  draw: (person)->
    xp = g.people[person].xp
    level = Person.level(xp)
    needed = Person.xpNeeded(level + 1)
    skillPoints = Person.skillPoints(person)

    s = if skillPoints is 1 then '' else 's'

    return """<div person="#{person}" class="person">
      <img src="game/content/#{Person[person].img}.png">
      <div>
        <div class="name">#{Person[person].name}</div>
        <div class="description">Level #{level} (#{needed - xp}xp more for level #{level + 1})</div>
      </div>
      <div class="picks #{if skillPoints > 0 then 'active' else ''}">#{skillPoints} skill#{s} available</div>
      <object data="game/content/#{Person[person].svg}"></object>
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
    data = Person[person].skills[skill]
    selected = g.people[person].skills[skill]

    selectButton = if selected
      '<button disabled>Already selected</button>'
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

    # Mark the skill as selected
    svg = $("[person=#{person}] object")[0].contentDocument
    $("##{skill} circle:nth-child(2)", svg).css('display', 'initial')

    # Redraw the skill box
    $("[skill=#{skill}").replaceWith(Person.drawSkill(person, skill))

    # Update available skill count
    newPicks = $(Person.draw(person)).find('.picks')
    $("[person=#{person}] .picks").replaceWith(newPicks)
}
