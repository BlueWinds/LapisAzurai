import $ from 'jquery'

import Cargo from 'game/Cargo'
import Person from 'game/Person'
import {gameIsOver} from 'game/Story'

queue = []

help = (selector, text)->
  unless g.showHelp then return
  if $('.help').length
    queue.push([selector, text])
    return

  element = $("""<div class='help'>
    <p>#{text}</p>
  </div>""")

  target = $(selector).first()
  target.parent().append(element)

  targetPos = target.offset()
  unless targetPos
    console.error selector, ' not found to point help towards'
    return
  targetPos.left += target.outerWidth() / 2 - element.outerWidth() / 2

  bottom = target[0].getBoundingClientRect().bottom
  if bottom + element.height() + 10 <= $(window).height()
    # There's space beneath the targeted element
    element.addClass('bottom')
    targetPos.top += target.outerHeight() + 10
  else
    # No space, put it up top.
    element.addClass('top')
    targetPos.top -= $(element).outerHeight() + 10

  element.offset(targetPos)
  element.css('opacity', 0).animate({opacity: 1}, 200)
  element.click ->
    element.animate {opacity: 0}, 200, ->
      element.remove()
      next = queue.shift()
      if next then help(next[0], next[1])
    return false

clearHelp = ->
  queue = []
  $('.help').remove()

haventSailedYet = -> g.map.from is 'Vailia' and not g.map.to and not g.history.MtJuliaArrive

mapHelp = ->
  if gameIsOver() then return
  if g.history.MtJuliaArrive then return

  setTimeout ->
    unless g.history.Ch1?
      help('header', "This is the world map, showing all the places you've discovered so far. Select Vailia to learn more about the port city.")
      return

    if haventSailedYet()
      unless g.cargo.length
        help('header', "Before you set sail you'll need to find some cargo. This isn't normally required, but it's always a good idea.")
        return

      help('header', 'An orange number next to a location means a required event is available there, while black numbers shows an optional one.')
      help('header', "The number of days remaining is absolute - it's usually best to advance the story as soon as possible, so you can see the next steps.")
  , 100

export enterMapHelp = ->
  clearHelp()
  mapHelp()

export showOverviewHelp = (place, duration)->
  clearHelp()

  setTimeout ->
    if g.map.from is 'MtJulia' and g.history.MtJuliaArrive is g.day - 1 and place is 'MtJulia'
      help('.cargoSearch', "The chance of finding work is halved if you don't have any reputation to spend.")
      help('.cargoSearch', 'Chances accumulate though - her odds will grow better the longer she keeps searching until she finds something.')
      return

    if skillHelp() then return

    if g.day is 0
      help('.place .name', 'On the left side you can see information about the location, while the right side has information about your characters. Clicking the image returns to the world map.')

      help('.place .description', 'Natalie has a separate reputation at each port. You spend reputation to view events, repair damage after a storm and search the city for jobs.')
      return

    if firstVailiaHelp(place) then return

    if place is 'Vailia'
      if g.day is g.history.FirstStormSick2
        help('.repair', "The Lapis Azurai is damaged, and sailing is slowed until it's repaired. Calling in the necessary favors and purchasing supplies costs reputation as well as time.")
  , 100

skillHelp = ->
  if noSkillSelected()
    if Person.skillPoints('Natalie') is 1
      skillText('Natalie')
      return true
    else if Person.skillPoints('James') is 1
      skillText('James')
      return true

skillText = (person)->
  help('[person="' + person + '"] .description', "#{person} has enough experience to gain a new skill. Characters each have their specialty - James focuses on sailing and storms, while Natalie deals with cargo and reputation.")

firstVailiaHelp = (place)->
  unless haventSailedYet() then return false
  if not g.cargo.length and place is 'Vailia'
    if not g.availableCargo.length
      help('.place .cargoSearch', "Natalie has contacts, but she doesn't have any cargo yet. She'll have to make new friends, speak with her old ones, and search the city for goods that need to be moved from Vailia to elsewhere.")

      help('.place .cargoSearch .cost', "The chance of finding a job varies by port. Vailia's a busy city, so it'll be easy to find cargo here. With a chance above 100% she's guaranteed to find at least one job.")
      return true

    c = g.availableCargo[0]
    help('.cargo.accept', "Right now, someone in Vailia is willing to pay Natalie to deliver #{c.name} to Mount Julia. The job will disappear if she doesn't accept it in #{Cargo.acceptTimeRemaining(c)} days.")

    help('.cargo.accept .cost', "If she delivers the cargo before it expires, she'll gain #{c.reputation[0]} reputation at the origin and #{c.reputation[1]} at the destination. ")

    help('header .cargo', "Natalie's ship can carry up to three loads at a time. Even if a job expires, you'll need to deliver the cargo to free up space.")
    return true

  if place is 'MtJulia' and g.cargo.length
    help('.place .travel', 'It takes 9 days to travel from Vailia to Mt. Julia. Click the ship icon to set sail.')

    help('[story="MtJuliaArrive"]', "You won't be able to catch every event on a given playthrough, so don't worry if you miss some with grey borders.")
    help('[story="MtJuliaArrive"]', 'Missing an orange event means game over though, so pay attention to those!')
    return true

noSkillSelected = -> Object.keys(g.people.Natalie.skills).length is 0 and Object.keys(g.people.James.skills).length is 0

export hideOverviewHelp = ->
  clearHelp()
  setTimeout ->
    if $('#content').css('display') is 'none'
      mapHelp()
  , 0

export displayStoryHelp = -> clearHelp()
