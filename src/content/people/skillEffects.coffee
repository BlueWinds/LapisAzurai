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
  discard = Math.randomRound(has('K', 'Devilish') / 2)
  undelivered = g.cargo.filter((c) -> Cargo.deliveryTimeRemaining(c) < 0)
  undelivered = undelivered.slice(0, discard)
  # ... and discard them.
  g.cargo = g.cargo.filter (c)-> c not in undelivered

oldNewCargoDaily = Cargo.newCargoDaily
Cargo.newCargoDaily = ->
  return oldNewCargoDaily() + has('N', 'WellInformed')

oldPlacePassDay = Place.passDay
Place.passDay = ->
  add = has('N', 'SilverTongue')
  oldPlacePassDay()
  for place of g.reputation
    g.reputation[place] += add
  return

oldDeliveryTimeRemaining = Cargo.deliveryTimeRemaining
Cargo.deliveryTimeRemaining = (cargo)->
  oldDeliveryTimeRemaining(cargo) + has('J', 'Reliable')

oldAcceptTimeRemaining = Cargo.acceptTimeRemaining
Cargo.acceptTimeRemaining = (cargo)->
  oldAcceptTimeRemaining(cargo) + has('J', 'Trustworthy')

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

oldApply = Story.apply
Story.apply = (place, story)->
  exp = Story[story].experience
  nonParticipants = ['Natalie', 'James', 'Kat', 'Asara'].filter((p)-> not exp[p])

  for i in [0 ... has('K', 'Bright')]
    person = Math.choice(Object.keys(exp))
    g.people[person].experience += 1

  for i in [0 ... has('K', 'Generous')]
    person = Math.choice(Object.keys(Story[story].experience))
    # If nonParticipants is empty, this'll just fall into the void.
    g.people[person]?.experience += 1
  oldApply(place, story)

# We don't save the old version because, unfortunately, there's no clean way to extend it - we just have to override.
Story.visibleStories = (stories)->
  foresight = has('K', 'SixthSense') * 2
  extraTime = has('K', 'NeverTooLate')
  return stories.filter(Story.matchesHistory.bind(null, foresight, extraTime))

oldReputationNeeded = Story.reputationNeeded
Story.reputationNeeded = ->
  oldReputationNeeded() - has('K', 'HowNotToLose')
