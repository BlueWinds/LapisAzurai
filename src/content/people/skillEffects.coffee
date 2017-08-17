# Skill overrides
has = (alias, skill, second)->
  p = Person.alias[alias]
  doubledBy = Person[p].skills[skill].doubledBy
  multiplier = if g.people.Asara?.skills[doubledBy] then 2 else 1

  value = (g.people[p]?.skills[skill] or 0) * multiplier
  unless second then value += has(alias, skill + '2', true)
  return value

oldToReputation = Cargo.toReputation
Cargo.toReputation = ->
  return oldToReputation() + has('N', 'Overdeliver')

oldFromReputation = Cargo.fromReputation
Cargo.fromReputation = ->
  return oldFromReputation() + has('N', 'Gregarious')

oldDeliver = Cargo.deliver
Cargo.deliver = (cargo)->
  effects = oldDeliver(cargo)
  Cargo.createRandom(has('N', 'Grounded'))

  # Select 0 or 1 expired cargoes...
  if Math.randomRound(has('K', 'Devilish') / 4)
    undelivered = g.cargo.filter((c) -> Cargo.deliveryTimeRemaining(c) < 0)
    discard = Math.choice(undelivered)
    # ... and remove it from the ship.
    g.cargo = g.cargo.filter (c)-> c not in discard

  return effects

oldNewCargoDaily = Cargo.newCargoDaily
Cargo.newCargoDaily = ->
  return oldNewCargoDaily() + has('N', 'WellInformed')

oldGamePassDay = Game.passDay
Game.passDay = ->
  oldGamePassDay()
  add = 0.2 * has('N', 'SilverTongue')
  for place of g.reputation
    g.reputation[place] += add
  return

oldRepairRate = Place.repairRate
Place.repairRate = ->
  oldRepairRate() * (1 + 0.5 * has('J', 'Reliable'))

oldDeliveryTimeRemaining = Cargo.deliveryTimeRemaining
Cargo.deliveryTimeRemaining = (cargo)->
  oldDeliveryTimeRemaining(cargo) + has('J', 'Trustworthy')

oldMaxCargo = Cargo.maxCargo
Cargo.maxCargo = ->
  oldMaxCargo() + has('J', 'Organized')

oldTravelSpeed = Game.travelPxPerDay
Game.travelPxPerDay = (travel)->
  oldTravelSpeed(travel) + has('J', 'Navigator')

oldDelayDuration = Place.delayDuration
Place.delayDuration = (travel)->
  return oldDelayDuration(travel) - has('J', 'Stoic') * 0.5

oldDelayChance = Place.delayChance
Place.delayChance = (travel)->
  return oldDelayChance(travel) * (1 - has('J', 'WeatherEye') * 0.1)

oldEffects = Story.effects
Story.effects = (story)->
  e = oldEffects(story)

  # We use the story name as a seed, so that this is deterministic for a given story
  if story.xp
    for i in [0 ... has('K', 'Bright')]
      person = Math.choice(Object.keys(e.xp), story)
      e.xp[person] += 1

    nonParticipants = ['Natalie', 'James', 'Kat', 'Asara'].filter((p)-> not e.xp[p])
    if nonParticipants
      for i in [0 ... has('K', 'Generous')]
        person = Math.choice(nonParticipants, story)
        e.xp[person] or= 0
        e.xp[person] += 1

  if Story[story].label is 'Arrival' and has('N', 'WinningSmile')
    for place, data of Place when data.stories?[g.chapter]
      if story in data.stories[g.chapter]
        break
    e.reputation or= {}
    e.reputation[place] or= 0
    e.reputation[place] += 5 * has('N', 'WinningSmile')

  return e

# We don't save the old version because, unfortunately, there's no clean way to extend it - we just have to override.
Story.visibleStories = (stories)->
  foresight = has('K', 'SixthSense') * 2
  extraTime = has('K', 'NeverTooLate')
  return stories.filter(Story.matchesHistory.bind(null, foresight, extraTime))

oldReputationNeeded = Story.reputationNeeded
Story.reputationNeeded = (story)->
  Math.max(0, oldReputationNeeded(story) - 2 * has('K', 'HowNotToLose'))
