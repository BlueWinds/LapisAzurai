# Skill overrides
has = (alias, skill, second)->
  p = Person.alias[alias]
  doubledBy = Person[p].skills[skill].doubledBy
  multiplier = if g.people.Asara.skills[doubledBy] then 2 else 1

  skill = (g.people[p].skills[skill] or 0) * multiplier
  unless second then skill += has(alias, skill + '2', true)
  return skill

oldDecay = Game.decayReputation
Place.decayReputation = (rep)->
  decay = 1 + has('N', 'WinningSmile') * 0.02
  return oldDecay(rep * decay)

oldToReputation = Cargo.toReputation
Cargo.toReputation = ->
  return oldToReputation() + has('N', 'Overdeliver')

oldFromReputation = Cargo.fromReputation
Cargo.fromReputation = ->
  return oldFromReputation() + has('N', 'Gregarious')

oldDeliver = Cargo.deliver
Cargo.deliver = (cargo)->
  oldDeliver(cargo)
  Cargo.createRandom(has('N', 'Grounded'))

  # Select a maximum of (Devilish / 2) expired cargoes...
  discardCount = Math.randomRound(has('K', 'Devilish') / 2)
  undelivered = g.cargo.filter((c) -> Cargo.deliveryTimeRemaining(c) < 0)
  discard = undelivered.slice(0, discardCount)
  # ... and remove them from the ship.
  g.cargo = g.cargo.filter (c)-> c not in discard

oldNewCargoDaily = Cargo.newCargoDaily
Cargo.newCargoDaily = ->
  return oldNewCargoDaily() + has('N', 'WellInformed')

oldPlacePassDay = Place.passDay
Place.passDay = ->
  add = 0.5 * has('N', 'SilverTongue')
  oldPlacePassDay()
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
Game.travelPxPerDay = (type)->
  oldTravelSpeed() + has('J', 'Navigator')

oldDelayDuration = Place.delayDuration
Place.delayDuration = ->
  return oldDelayDuration() - has('J', 'Stoic') * 0.5

oldDelayChance = Place.delayChance
Place.delayChance = ->
  return oldDelayChance() * (1 - has('J', 'WeatherEye') * 0.1)

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

  return e

# We don't save the old version because, unfortunately, there's no clean way to extend it - we just have to override.
Story.visibleStories = (stories)->
  foresight = has('K', 'SixthSense') * 2
  extraTime = has('K', 'NeverTooLate')
  return stories.filter(Story.matchesHistory.bind(null, foresight, extraTime))

oldReputationNeeded = Story.reputationNeeded
Story.reputationNeeded = ->
  Math.max(0, oldReputationNeeded() - 2 * has('K', 'HowNotToLose'))
