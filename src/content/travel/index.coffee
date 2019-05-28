import Story from 'game/Story'

import {eventIntervalSkill, stormDamageSkill, stormDurationSkill, stormIntervalSkill} from 'content/people/skillEffects'
import * as sailStories from 'content/travel/sailStories'
import * as sailDelayStories from 'content/travel/sailDelayStories'

export Sail = {
  stories: Object.keys(sailStories)
  delayStories: Object.keys(sailDelayStories)
  normalImages: [
    'travel/CabinDay.jpg'
    'travel/CabinNight.jpg'
    'travel/DeckDay.jpg'
    'travel/DeckNight.jpg'
    'travel/DeckFog.jpg'
    'travel/SailingDay.jpg'
    'travel/SailingNight.jpg'
  ]
  delayImages: [
    'travel/DeckStorm.jpg',
    'travel/SailingStorm.jpg'
  ]

  travelStoryOccurs: ->
    min = 70 + eventIntervalSkill()
    cycle = 100
    return g.lastTravelEvent + Math.random() * cycle + min < g.day

  delayOccurs: (from, to, distance)->
    # If we're past the intro, storms are random.
    if g.history.FirstStormSick then return randomStormOccurs()

    # Always trigger a storm on the trip back to Vailia when we're almost in port
    if g.history.MtJuliaArrive and not g.history.FirstStorm and distance < 75 then return true

    # No storms until we've had the intro event about Natalie's magic
    return false

  delayDailyDamage: (from, to, distance)->
    damage = Math.max(0, 5 * (Math.random() + 0.5) + stormDamageSkill())
    # Damage has been prevented, probably by one of the delay events
    if g.preventNextDamage
      if g.preventNextDamage > damage
        g.preventNextDamage -= damage
        damage = 0
      else
        damage -= g.preventNextDamage
        g.preventNextDamage = 0
    return damage

  delayDuration: -> Math.max(1, 4 * (Math.random() + 0.5) + stormDurationSkill())
}

randomStormOccurs = ->
  min = 70 + stormIntervalSkill()
  cycle = 100
  return g.lastStorm + Math.random() * cycle + min < g.day
