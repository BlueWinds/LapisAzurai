import $ from 'jquery'
import 'jquery.scrollto'

import Game from 'game/Game'
import Person from 'game/Person'
import {applyStory, expirationDate, gameIsOver, reputationNeeded, storyEffects, unmetNeed} from 'game/Story'
import {drawMap, travel} from 'gui/map'
import {quote} from 'gui/person'
import {hideOverview} from 'gui/place'

import * as content from 'content'
import people, {aliases} from 'content/people'
import {displayStoryHelp, enterMapHelp} from 'content/help'

###
Formatting guide:

|| places/VailiaDay
  Starts a new section, with an optional image. Each section requires a click to advance.

  Each line of text starts a new paragraph. Blank lines are ignored.

|| N/angry
  `N This is a quote colored according to Person.N.quoteColor. (Person.N === Person.Natalie). Similarly, J = James, etc.`

  Any section with a <button>button element</button> won't "click through" - your code is responsible for calling changeSection(1, true) when you're ready to carry on (probably in an onclick handler).

  Sections are automatically divided into pages as the player advances between them, fitting as many as possible on the screen at once.

|||| travel/SailingStorm
  Starts a full-screen section. While active, the image will be used as a background rather than floating inline, and the text will be at the top of the screen. All other sections will be hidden.

||-
  This section cannot be clicked through by the player. As with a <button> tag, yourcode is responsible for calling changeSection(1 true) when you're ready to carry on. Or don't, if this is a game-over screen.
###

export drawStory = (place, story)->
  need = unmetNeed(place, story)

  onclick = if g.map.from is place and not need
    'onclick=\'displayWithOverlay("' + place + '", "' + story + '");\''
  else ''

  rep = reputationNeeded(story)
  days = expirationDate(story) - g.day
  expires = if days is 0
    'Expires today'
  else if days is 1
    'Expires tomorrow'
  else
    "#{days} days"

  required = if content[story].required then 'required' else ''
  active = if onclick then 'active' else ''
  _class = ['story', required, active, content[story]._class].join(' ')

  return """<td class="#{_class}" #{onclick} story="#{story}">
    <div>
      <span class="label">#{content[story].label}</span>
      <span class="cost">#{if rep then -rep + ' rep' else ''}</span>
      <span class="expires">#{expires}</span>
      <span class="success">✓</span>
    </div>
    <div class="participants">#{Game.drawEffects(storyEffects(story))}</div>
    #{need}
  </td>"""

window.displayWithOverlay = (place, story)->
  Game.passDay()
  applyStory(place, story)

  $('.story[story="' + story + '"] .success')
    .animate({opacity: 1}, 500)
    .animate {opacity: 0}, 1500
  Game.showPassDayOverlay g.day, Game.drawEffects(storyEffects(story)), (removeOverlay)->
    removeOverlay()
    displayStory(story)

export displayStory = (story, speed = 500)->
  elements = render(story)
  $('#content').css({display: 'block'}).stop().animate {opacity: 1}, speed, ->
    drawMap()
    hideOverview(speed)

  $('#stories').empty().append(elements)
  if g.scroll is -1 then g.scroll = 0
  forwardSection(elements.first(), 1)

  displayStoryHelp(story, speed)

window.continueWith = (e, story)->
  applyStory(null, story)
  $('#stories button').attr('disabled', true)
  e.stopPropagation()
  setTimeout (->
    elements = render(story)
    $('#stories').append(elements)
    changeSection(1, true)
  ), 200

export drawHistory = ->
  unless g.history.Intro?
    return displayStory('Intro')

  end = gameIsOver()
  if end
    displayStory(end.required)
    g.history[end.required] = g.day
    return

  if g.scroll >= 0
    inverted = {}
    for event, day of g.history then inverted[day] = event
    day = g.day
    loop
      if inverted[day]
        displayStory(inverted[day])
        break
      day -= 1

  for i in [0 ... g.scroll]
    changeSection(1, true)
  return

export render = (story)->
  text = content[story].text()
  sections = $('<div></div>')

  lastSection = $('<section></section>')
  for line in text.split('\n').filter(Boolean)
    line = line.trim().replace(/`(\w*) (.+?)`/g, quote)
    unless line then continue

    if line.match /^\|\|/
      lastSection.append '<hr>'
      lastSection = $('<section></section>')
      addSectionImage(lastSection, line)
      sections.append(lastSection)
      if line.match /^\|\|\|\|/
        lastSection.addClass('full-screen')
      if line.match /^\|\|-/
        lastSection.addClass 'noClickThrough'
    else
      lastSection.append('<p>' + line + '</p>')
      if line.match /<button.*<\/button>/
        lastSection.addClass 'noClickThrough'

  return sections.children()

export changeSection = (direction, force = false)->
  if g.scroll is 0 and direction < 0 and $('section.active').length is 1 then return
  currentElement = $('section.active').last()

  if currentElement.hasClass('noClickThrough') and direction >= 0 and not force then return
  targetElement = elementInDirection(currentElement, direction)

  # We're moving into a section. Stop any previous animations.
  $('section').stop()

  g.scroll = Math.max(0, g.scroll + direction)
  if direction >= 0
    forwardSection(targetElement)
  else
    backSection(currentElement, targetElement)

export forwardSection = (to)->
  unless to.length then return enterMap()

  to.addClass('active').css('opacity', 0)
  $('section.active').animate {opacity: 1}, 500
  $('#stories').stop().scrollTo(to, 300, {over: 1}).focus()

backSection = (from, to)->
  unless to.length then return
  if $('#content').css('display') is 'none' then return exitMap()

  from.animate {opacity: 0}, 500, ->
    from.removeClass('active')
    $('section.active').animate {opacity: 1}, 500
  $('#stories').stop().scrollTo(to, 300, {over: 1}).focus()

enterMap = ->
  g.scroll = -1
  $('#content').stop().animate {opacity: 0}, 500, ->
    # Make sure the user didn't cancel and go back to the previous page before hiding the #content + deactivating sections.
    if $('#content').css('opacity') is '0'
      $('#content').css {display: 'none'}

  if g.map.to then travel()
  enterMapHelp()

exitMap = ->
  g.scroll = $('#stories').children().length - 1
  $('#content').stop().css({display: 'block'}).animate {opacity: 1}, 500
  $('section.active').animate {opacity: 1}, 500

export storyGuiSetup = ->
  $('#stories').on 'click', 'img', (e)->
    Game.showOverlay("<img src='#{e.target.src}'>")
    return false
  $('#stories').on 'click', (e)->
    if ($(e.target).closest('input, label').length) then return
    changeSection(1)

  $(window).keydown(keyPress)
  $('#back').on 'click', ->
    changeSection(-1)

addSectionImage = (element, line)->
  img = line.match(/ (.+)\/(.+)$/)

  if img
    # It might be an aliased person's name
    name = aliases[img[1]] or img[1]
    src = if people[name]
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
    changeSection(1)
  # Left
  else if e.keyCode is 37
    changeSection(-1)
