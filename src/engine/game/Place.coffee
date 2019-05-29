import Game from 'game/Game'
import {delayEvent, travelEvent} from 'game/Story'
import {choice, clamp} from 'game/util'

import * as content from 'content'
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

Place = {
  travel: {}

  repairEffects: ->
    e =
      damage: -Math.min(6 * (if g.reputation[g.map.from] > 0 then 1 else 0.5), g.damage)
      reputation: {}
    e.reputation[g.map.from] = -Math.min(1, g.reputation[g.map.from])
    return repairEffectsSkill(e)

  location: (map)->
    # A path
    if map.to
      path = Place.svgElement([map.from, map.to])
      len = Place.distanceAlongPath(path.id, map.distance or 0)
      return path.getPointAtLength(len)

    # A port
    circle = document.getElementById(map.from).children[1]
    return {x: circle.cx.baseVal.value, y: circle.cy.baseVal.value}

  distanceAlongPath: (place, distance)->
    element = document.getElementById(place)
    return if distance >= 0 then distance else element.getTotalLength() + distance

  travelDays: (from, to)-> # Returns days between two locations, including indirect routes
    unless from and to then return 0
    sumLength = (sum, e)->
      # Should be an error, but here for now so I can be lazy about drawing paths on the map.
      # TODO: remove the return
      unless e then return
      sum + Math.ceil(e.getTotalLength() / Game.travelPxPerDay(e.attributes.travel.value))
    return Place.travelSteps(from, to).map(Place.svgElement).reduce(sumLength, 0)

  travelSteps: (from, to)->
    if from is to then return []

    steps = []
    location = from
    loop
      if typeof Place[location].paths[to] is 'number'
        steps.push [location, to]
        break

      nextStop = Place[location].paths[to]
      steps.push [location, nextStop]
      location = nextStop
    return steps

  svgElement: ([from, to] = [g.map.from, g.map.to])->
    string = if Place.direction(from, to) is 1 then (from + '_' + to) else (to + '_' + from)
    return document.getElementById(string)

  travelEvent: (map)->
    path = Place.svgElement([map.from, map.to])
    type = path.attributes.travel.value
    dir = Place.direction(map.from, map.to)

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
      event.image = Place[map.to].img
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

  direction: (from, to)->
    unless typeof Place[from].paths[to] is 'number'
      throw new Error('No direct path from ' + from + ' to ' + to)
    return Place[from].paths[to]
}

export default Place
