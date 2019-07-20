import $ from 'jquery'
import people, {aliases} from 'content/people'

import Person from 'game/Person'
import {showOverview} from 'gui/place'

export quote = (ignore, name, text)->
  unless people[name] then name = aliases[name]
  "<q class=#{name}>#{text}</q>"

export drawOverview = ->
  $('#overview .people').empty()
  updateOverview()

export updateOverview = ->
  p = $('#overview .people')
  for person of g.people
    oldDiv = p.find("[person=#{person}]")
    newDiv = $(draw(person))
    # If the svg is already present, replacing it would cause an annoying flicker for the player. Instead we take the messier route of updating everything around it.
    if oldDiv.length
      oldDiv.find('.picks').replaceWith(newDiv.find('.picks'))
      oldDiv.find('.description').replaceWith(newDiv.find('.description'))

      # Redraw the skill box, if there is one
      skill = $(".skill[p=#{person}]").attr('skill')
      if skill
        $("[skill=#{skill}]").replaceWith(drawSkill(person, skill))
    else
      activateSVG(newDiv.find('svg'))
      newDiv.mouseenter ->
        newDivPerson = @attributes.person.value
        p.find(".skill[p!=#{newDivPerson}]").remove()
        p.find(".person[person!=#{newDivPerson}] svg").each ->
          $(@contentDocument).find('.active').removeClass('active')
      p.append(newDiv)
  return

draw = (person)->
  xp = g.people[person].xp
  level = Person.level(xp)
  needed = Person.xpNeeded(level + 1)
  skillPoints = Person.skillPoints(person)

  s = if skillPoints is 1 then '' else 's'

  return """<div person="#{person}" class="person">
    <img src="#{people[person].img}">
    <div>
      <div class="name">#{people[person].name}</div>
      <div class="description">#{needed - xp}xp needed for next skill</div>
    </div>
    <div class="picks #{if skillPoints > 0 then 'active' else ''}">#{skillPoints} skill#{s} available</div>
    #{people[person].svg}
  </div>"""

activateSVG = (svg)->
  personElement = $(svg).parent()
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
    personElement.after(drawSkill(person, @id))

  $('g', svg).hover ->
    p.find(".skill.mouse-over[p=#{person}]").remove()
    skill = $(drawSkill(person, @id)).addClass('mouse-over')
    personElement.after(skill)
  , ->
    if p.find(".skill[p=#{person}]").length > 1
      p.find(".skill.mouse-over[p=#{person}]").remove()

drawSkill = (person, skill)->
  data = people[person].skills[skill]
  selected = g.people[person].skills[skill]

  selectButton = if selected
    ''
  else if Person.unmetRequirements(person, skill)
    "<button disabled>Requires #{Person.unmetRequirements(person, skill)}</button>"
  else if Person.skillPoints(person) <= 0
    '<button disabled>No skills available</button>'
  else
    "<button onclick='clickSkill(\"#{person}\", \"#{skill}\")'>Select skill</button>"

  """<div class="skill" skill=#{skill} p="#{person}">
    <div class="name">#{data.name or skill}</div>
    #{selectButton}
    <p>#{data.description}</p>
  </div>"""

window.clickSkill = (person, skill)->
  g.people[person].skills[skill] = true
  showOverview()

  # Mark the skill as selected
  svg = $("[person=#{person}] object")[0].contentDocument
  $("##{skill} circle:nth-child(2)", svg).css('display', 'initial')

  # Redraw the skill box
  $("[skill=#{skill}").replaceWith(drawSkill(person, skill))

  # Update available skill count
  newDiv = $(draw(person))
  $("[person=#{person}] .picks").replaceWith(newDiv.find('.picks'))
