###
Formatting guide:

  Each line of text starts a new paragraph on that page and requires a click to move through.
  -- Lines starting with -- create a new page, clearing the previous text. You don't need to -- the first text in an event.

  Blank lines are ignored.
  >> Require a click to advance, but append text to the last paragraph, rather than starting a new one.

  || bg=places/VailiaDay left=Natalie/angry speed=slow
  The above line sets the background, characters and transition speed that will be associated with the next block of text.
  Characters and speeds persist until the next || tag.
  Backgrounds persist until a new one is set (you can use "|| bg=none" to set a blank black background).

  Valid positions are left, right, farLeft, farRight. Valid speeds are slow and verySlow (the default is a fast transition).

  || left=N/angry left=J/angry
  You can put multiple people in the same location, they'll just be drawn on top of each other (leftmost on the bottom)
  `N This is a quote colored according to Person.N.quoteColor. (Person.N === Person.Natalie). Similarly, J = James, etc.` Stays on the same page.

  !! Start a page of full-screen text.

  Any paragraph with a <button>button element</button> won't "click through" - your code is responsible for calling Page.changePage(1, true) when you're ready to carry on (probably in an onclick handler).
###

$.extend Page, {
  draw: (place, page)->
    [skill, person] = Page.skillNeeded(page)
    need = if skill
      """<div class="need">#{person} needs #{Person[person].skills[skill].label}</div>"""
    else if g.reputation[place] < Page.reputationNeeded()
      " " # Evaluates to true to disable the page, but doesn't show a need line.
    else false

    onclick = if g.location is place and not need
      'onclick="Page.apply("' + page + '");Page.display("' + page + '");Place.drawMap();"'
    else ''

    return """<div class="page #{if onclick then 'active' else '' }">
      <div>#{Page[page].label} - #{Page.reputationNeeded()} reputation</div>
      <div class="participants">#{Object.keys(Page[page].experience or {}).join(', ')}</div>
      #{need}
    </div>"""

  display: (page, goto = true)->
    elements = Page.render(page)
    $('#content').append(elements)
    elements.css {display: 'none'}
    if goto
      Page.forwardPage(elements.first(), 1)

  drawHistory: ->
    unless g.history.Intro
      return Page.display('Intro')
    inverted = {}
    for event, day of g.history then inverted[day] = event

    for day in [g.day - 30 ... g.day] when inverted[day]
      Page.display(inverted[day], false)
    Page.setNav()

  render: (page)->
    text = Page[page].text()
    pages = $('<div></div>')

    lastPage = $('<page></page>')
    lastBg = false
    for line in text.split("\n").filter(Boolean)
      line = line.trim().replace(/`(\w+) (.+?)`/g, Person.quote)
      unless line then continue

      if line.match /^\|\|/
        speed = line.match(/speed=(\w+)/)
        if speed then lastPage.attr('speed', speed[1])

        t = lastPage.children('text').clone()
        lastPage = $('<page></page>').append(t)
        lastBg = addPageAttrs(lastPage, line, lastBg)
        continue

      if line.match /^!!/
        lastPage = $('<page><text class="full"></text></page>')
        line = line.replace('!!', '')
      else
        lastPage = lastPage.clone().removeAttr('speed')

      if line.match /^-- /
        lastPage.children('text').empty().removeClass('full')
        line = line.replace('-- ', '')

      if line.match /^>> /
        line = line.replace('>>', '')
        lastPage.find('p').last().append(line)
      else
        lastPage.children('text').append('<p>' + line + '</p>')

      pages.append(lastPage)

    return pages.children()

  changePage: (direction = 1, force = false)->
    currentElement = $('page.active')
    if currentElement.hasClass('noClickThrough') and direction > 0 and not force then return
    targetElement = elementInDirection(currentElement, direction)

    if targetElement.length
      # We're moving into a page. Stop any previous animations.
      $('page').removeClass('active').stop().css({display: 'none'})
      currentElement.css({display: 'block', opacity: 1})

      if direction > 0
        speed = if currentElement.attr('speed') is 'slow' then speed = 1500
        else if currentElement.attr('speed') is 'verySlow' then speed = 4000
        else 500

        Page.forwardPage(targetElement, speed)
      else
        Page.backPage(targetElement, 500)
    else
      # Moving back to the main map
      currentElement.animate {opacity: 0}, 500, ->
        $('#content page').not('.active').css {display: 'none'}

  forwardPage: (to, speed)->
    to.addClass('active').css({display: 'block', opacity: 0})

    to.animate {opacity: 1}, speed, ->
      if to.hasClass('active')
        $('page').not('.active').css {display: 'none'}

  backPage: (to, speed)->
    to.addClass('active').css({display: 'block', opacity: 1})
    to.next().animate {opacity: 0}, speed, ->
      if to.next().hasClass('active')
        $('page').not('.active').css {display: 'none'}

  guiSetup: ->
    $('#content').on 'click', (e)->
      page = $(e.currentTarget)

      if e.clientX >= page.offset().left + page.width() - 19 and
          e.clientY <= page.offset().top + 29
        Page.changePage(-1)
      else
        Page.changePage(1)

    $(window).keydown(keyPress)
}


addPageAttrs = (element, line, lastBg)->
  for image in (line.match(/((?:far)?(?:Left|Right|Center)=\w+\/\w+)/ig) or [])
    [_, position, name, expression] = image.match(/(.+)=(.+)\/(.+)/)
    element.prepend Person.drawImage(position, name, expression)

  bg = line.match(/bg=([\w\/]+)/) or lastBg
  if bg is 'none' then bg = false
  if bg
    element.css('background-image', 'url("game/content/' + bg[1] + '.jpg")')
  return bg

elementInDirection = (element, direction)->
  return if direction < 0 and element.length then element.prev()
  else if direction < 0 then $('page').last()
  else element.next()

keyPress = (e)->
  # Right, down
  if e.keyCode in [39, 40]
    Page.changePage(1)
  # Left, up
  else if e.keyCode in [37, 38]
    Page.changePage(-1)
