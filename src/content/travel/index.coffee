import 'content/travel/CabinDay.jpg'
import 'content/travel/CabinNight.jpg'
import 'content/travel/CabinStorm.jpg'
import 'content/travel/DeckDay.jpg'
import 'content/travel/DeckFog.jpg'
import 'content/travel/DeckNight.jpg'
import 'content/travel/DeckStorm.jpg'
import 'content/travel/SailingDay.jpg'
import 'content/travel/SailingNight.jpg'
import 'content/travel/SailingStorm.jpg'
import 'content/travel/SilverFire.jpg'

import {eventIntervalSkill, stormDamageSkill, stormDurationSkill, stormIntervalSkill} from 'content/people/skillEffects'

export Sail = {
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
    min = 50 + eventIntervalSkill()
    cycle = 50
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
