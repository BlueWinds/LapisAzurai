###
Formatting guide:

|| places/VailiaDay
  Starts a new section, with an optional image. Each section requires a click to advance.

  Each line of text starts a new paragraph. Blank lines are ignored.

|| N/angry
  `N This is a quote colored according to Person.N.quoteColor. (Person.N === Person.Natalie). Similarly, J = James, etc.`

  Any section with a <button>button element</button> won't "click through" - your code is responsible for calling Story.changeSection(1, true) when you're ready to carry on (probably in an onclick handler).

  Sections are automatically divided into pages as the player advances between them, fitting as many as possible on the screen at once.
###

$.extend Story, {
  draw: (place, story)->
    [skill, person] = Story.skillNeeded(story)
    need = if skill
      """<div class="need">#{person} needs #{Person[person].skills[skill].label}</div>"""
    else if g.reputation[place] < Story.reputationNeeded(story)
      """<div class="need">Need #{Math.ceil(Story.reputationNeeded(story) - g.reputation[place])} more rep</div>"""
    else ""

    onclick = if g.location is place and not need
      'onclick=\'Story.apply("' + place + '", "' + story + '");Story.display("' + story + '");Place.drawMap();\''
    else ''

    return """<td class="story #{if onclick then 'active' else '' }" #{onclick}>
      <span class="label">#{Story[story].label}</span><span class="cost">#{Story.reputationNeeded(story)} rep</span></div>
      <div class="participants">#{Object.keys(Story[story].experience).wordJoin()}</div>
      #{need}
    </td>"""

  display: (story, goto = true)->
    elements = Story.render(story)
    $('#content').empty().css({display: 'block'}).animate({opacity: 1}, 300).append(elements)
    if goto
      if g.scroll is -1 then g.scroll = 0
      Story.forwardSection(elements.first(), 1)

  drawHistory: ->
    unless g.history.Intro?
      return Story.display('Intro')

    if g.scroll >= 0
      inverted = {}
      for event, day of g.history then inverted[day] = event
      day = g.day
      loop
        if inverted[day]
          Story.display(inverted[day])
          break
        day -= 1

    for i in [0 ... g.scroll]
      Story.changeSection(0, true)
    return

  render: (story)->
    text = Story[story].text()
    sections = $('<div></div>')

    lastSection = $('<section></section>')
    for line in text.split("\n").filter(Boolean)
      line = line.trim().replace(/`(\w*) (.+?)`/g, Person.quote)
      unless line then continue

      if line.match /^\|\|/
        lastSection.append '<hr>'
        lastSection = $('<section></section>')
        addSectionImage(lastSection, line)
        sections.append(lastSection)
      else
        lastSection.append('<p>' + line + '</p>')
        if line.match /<button.*<\/button>/
          lastSection.addClass 'noClickThrough'

    return sections.children()

  changeSection: (direction, force = false)->
    if g.scroll is 0 and direction < 0 and $('section.active').length is 1 then return
    currentElement = $('section.active').last()
    if currentElement.hasClass('noClickThrough') and direction >= 0 and not force then return
    targetElement = elementInDirection(currentElement, direction)

    # We're moving into a section. Stop any previous animations.
    $('section').stop()

    g.scroll = Math.max(0, g.scroll + direction)
    if direction >= 0
      Story.forwardSection(targetElement)
    else
      Story.backSection(currentElement, targetElement)

  forwardSection: (to)->
    unless to.length then return Story.enterMap()

    to.addClass('active').css('opacity', 0)
    $('section.active').animate {opacity: 1}, 300
    $('#content').scrollTo(to, 300, {over: 1}).focus()

  backSection: (from, to)->
    unless to.length then return
    if $('#content').css('display') is 'none' then return Story.exitMap()

    from.animate {opacity: 0}, 300, ->
      from.removeClass('active')
      $('section.active').animate {opacity: 1}, 300
    $('#content').scrollTo(to, 300, {over: 1}).focus()

  enterMap: ->
    g.scroll = -1
    $('#content').stop().animate {opacity: 0}, 300, ->
      # Make sure the user didn't cancel and go back to the previous page before hiding the #content + deactivating sections.
      if $('#content').css('opacity') is '0'
        $('#content').css {display: 'none'}

  exitMap: ->
    g.scroll = $('#content').children().length - 1
    $('#content').stop().css({display: 'block'}).animate {opacity: 1}, 300
    $('section.active').animate {opacity: 1}, 300

  guiSetup: ->
    $('#content').on 'click', 'img', (e)->
      Game.showOverlay(e.target.src)
      return false
    $('#content').on 'click', ->
      Story.changeSection(1)

    $(window).keydown(keyPress)
    $('#back').on 'click', ->
      Story.changeSection(-1)
}

addSectionImage = (element, line)->
  img = line.match(/ (.+)\/(.+)$/)

  if img
    # It might be an aliased person's name
    name = Person.alias[img[1]] or img[1]
    src = if Person[name]
      "game/content/people/#{name}/#{img[2]}.png"
    else
      "game/content/#{img[1]}/#{img[2]}.jpg"

    element.append( "<img src='#{src}'>")

elementInDirection = (element, direction)->
  return if direction < 0 and element.length then element.prev()
  else if direction < 0 then $('section').last()
  else element.next()

keyPress = (e)->
  # Right
  if e.keyCode is 39
    Story.changeSection(1)
  # Left
  else if e.keyCode is 37
    Story.changeSection(-1)
