import Game from 'game/Game'
import Cargo from 'game/Cargo'
import Person from 'game/Person'
import Place from 'game/Place'
import {choice, randomRound} from 'game/util'

import people from 'content/people'

has = (name, skill, second)->
  # Not all skills have a 'second', so this gets called with eg. Mage2, and we need to bail early
  unless people[name].skills[skill] then return 0

  doubledBy = people[name].skills[skill].doubledBy
  multiplier = if g?.people.Asara?.skills[doubledBy] then 2 else 1

  value = (g?.people[name]?.skills[skill] or 0) * multiplier
  unless second then value += has(name, skill + '2', true)
  return value

export cargoCreateSkill = (cargo)->
  cargo.reputation[0] += has('Natalie', 'Gregarious')
  cargo.reputation[1] += has('Natalie', 'Overdeliver')
  return cargo

export cargoDeliverSkill = (effects) ->
  if Math.random() < has('Natalie', 'Grounded') * 0.25
    g.availableCargo.push Cargo.create(g.map.from)

  # Select 0 or 1 expired cargoes...
  if randomRound(has('Kat', 'Devilish') / 4)
    undelivered = g.cargo.filter((c) -> Cargo.deliveryTimeRemaining(c) < 0)
    discard = choice(undelivered)
    # ... and remove it from the ship.
    g.cargo = g.cargo.filter (c)-> c not in discard

  return effects

export maxCargoSkill = -> has('James', 'Journeyman') + has('James', 'Master')
export cargoSearchChanceSkill = -> has('Natalie', 'WellInformed') * 0.1
export clickSearchSkill = -> g.reputation[g.map.from] += randomRound(has('Natalie', 'SilverTongue') * 0.5)
export acceptTimeRemainingSkill = -> has('James', 'Organized') * 5
export deliveryTimeRemainingSkill = -> has('James', 'Trustworthy') * 5

export repairEffectsSkill = (e)->
  e.damage *= (1 + 0.25 * has('James', 'Reliable'))
  e.damage = Math.max(e.damage, -g.damage)
  if has('James', 'Apprentice') and e.reputation[g.map.from]
    e.reputation[g.map.from] = -randomRound(0.5)
  return e

export sailSpeedSkill = -> (1 + has('James', 'Navigator') / 10)
export eventIntervalSkill = -> -has('Kat', 'SixthSense') * 5
export stormIntervalSkill = -> has('James', 'WeatherEye') * 5
export stormDurationSkill = -> -has('James', 'Stoic') * 0.5
export stormDamageSkill = (from, to, distance)-> -has('Natalie', 'Mage') - has('Natalie', 'Adept')

export storyExpirationSkill = -> has('Kat', 'NeverTooLate') * 3
export storyReputationNeededSkill = -> -2 * has('Kat', 'HowNotToLose')
export storyEffectsSkill = (story, e)->
  if story.xp
    for i in [0 ... has('Kat', 'Bright')]
      person = choice(Object.keys(e.xp))
      e.xp[person] += 1

    nonParticipants = ['Natalie', 'James', 'Kat', 'Asara'].filter((p)-> not e.xp[p])
    if nonParticipants
      for i in [0 ... has('Kat', 'Generous')]
        person = choice(nonParticipants, story)
        e.xp[person] or= 0
        e.xp[person] += 1

  if story.label is 'Arrival' and has('Natalie', 'WinningSmile')
    place = story.where.split('|')[0]

    e.reputation or= {}
    e.reputation[place] or= 0
    e.reputation[place] += 5 * has('Natalie', 'WinningSmile')

  return e

export xpNeededSkill = ->
  xp = -has('Kat', 'StreetRat') * 3
  xp -= has('Kat', 'Deckhand') * 4
  xp -= has('Kat', 'FreeWoman') * 5
  return xp

export searchSpecializeEnabled = -> has('Natalie', 'Initiate')
