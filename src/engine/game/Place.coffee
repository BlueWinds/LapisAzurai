import Game from 'game/Game'
import {delayEvent, travelEvent} from 'game/Story'
import {choice, clamp} from 'game/util'

import * as content from 'content'
import * as places from 'content/places'
import * as travelData from 'content/travel'
import {repairEffectsSkill} from 'content/people/skillEffects'

samplePlaceData =
  name: 'Mt. Julia'
  paths:
    Vailia: -1 # -1: The path is ThereHere (it needs to be animated "in reverse")
    Alkenia: 1 # 1: The path goes HereThere (it is animated "forward")
    Tomenoi: 'Vailia' # A string: The path from here to Tomenoi goes to Vailia next
  goods:
    Vailia: [
      'Fish'
      'Silver'
      'Lumber'
    ]
  jobChance: 0.3

export repairEffects = ->
  e =
    damage: -Math.min(6 * (if g.reputation[g.map.from] > 0 then 1 else 0.5), g.damage)
    reputation: {}
  e.reputation[g.map.from] = -Math.min(1, g.reputation[g.map.from])
  return repairEffectsSkill(e)

export currentCordinates = (map)->
  # A path
  if map.to
    path = pathSvg([map.from, map.to])
    len = distanceAlongPath(path.id, map.distance or 0)
    return path.getPointAtLength(len)

  # A port
  circle = document.getElementById(map.from).children[1]
  return {x: circle.cx.baseVal.value, y: circle.cy.baseVal.value}

distanceAlongPath: (place, distance)->
  element = document.getElementById(place)
  return if distance >= 0 then distance else element.getTotalLength() + distance

export travelDays = (from, to)-> # Returns days between two locations, including indirect routes
  unless from and to then return 0
  sumLength = (sum, e)->
    # Should be an error, but here for now so I can be lazy about drawing paths on the map.
    # TODO: remove the return
    unless e then return
    sum + Math.ceil(e.getTotalLength() / Game.travelPxPerDay(e.attributes.travel.value))
  return travelSteps(from, to).map(pathSvg).reduce(sumLength, 0)

export travelSteps = (from, to)->
  if from is to then return []

  steps = []
  location = from
  loop
    if typeof places[location].paths[to] is 'number'
      steps.push [location, to]
      break

    nextStop = places[location].paths[to]
    steps.push [location, nextStop]
    location = nextStop
  return steps

export pathSvg = ([from, to] = [g.map.from, g.map.to])->
  string = if direction(from, to) is 1 then (from + '_' + to) else (to + '_' + from)
  # For the dev tools, we don't compile the map svg into the html, as is done for the main game
  return document.getElementById(string) or document.getElementById('map').contentDocument.getElementById(string)

export dailyTravel = (map)->
  path = pathSvg([map.from, map.to])
  type = path.attributes.travel.value
  dir = direction(map.from, map.to)

  pxPerDay = Game.travelPxPerDay(type) * dir
  to = clamp(map.distance + pxPerDay, 0, path.getTotalLength())

  event = {
    image: choice(travelData[type].normalImages)
    path: path
    start: map.distance
    direction: dir
    pxTravel: to - map.distance
    story: unless map.delay then travelEvent(map.from, map.to, travel)
  }

  if to is 0 or to is path.getTotalLength()
    event.image = places[map.to].img
  # No storms the day you arrive in port
  else if map.delay or travelData[type].delayOccurs(map.from, map.to, map.distance)
    duration = map.delay or travelData[type].delayDuration(map.from, map.to, map.distance)

    event.image = choice(travelData[type].delayImages)
    event.delay = Math.max(0, duration - 1) # Subtract one day because this event already took up one of them
    event.effects = {damage: travelData[type].delayDailyDamage(map.from, map.to, map.distance)}

    # If this is the first day of a delay, trigger an event
    unless map.delay
      event.story = delayEvent(map.from, map.to, type)

  return event

export direction = (from, to)->
  unless typeof places[from].paths[to] is 'number'
    throw new Error('No direct path from ' + from + ' to ' + to)
  return places[from].paths[to]
