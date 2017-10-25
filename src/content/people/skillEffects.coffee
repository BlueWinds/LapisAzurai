# Skill overrides
has = (alias, skill, second)->
  p = Person.alias[alias]
  doubledBy = Person[p].skills[skill].doubledBy
  multiplier = if g?.people.Asara?.skills[doubledBy] then 2 else 1

  value = (g?.people[p]?.skills[skill] or 0) * multiplier
  unless second then value += has(alias, skill + '2', true)
  return value

oldCreate = Cargo.create
Cargo.create = (from)->
  cargo = oldCreate(from)
  cargo.reputation[0] += has('N', 'Gregarious')
  cargo.reputation[1] += has('N', 'Overdeliver')
  return cargo

oldDeliver = Cargo.deliver
Cargo.deliver = (cargo)->
  effects = oldDeliver(cargo)
  if Math.random() < has('N', 'Grounded') * 0.25
    g.availableCargo.push Cargo.create(g.map.from)

  # Select 0 or 1 expired cargoes...
  if Math.randomRound(has('K', 'Devilish') / 4)
    undelivered = g.cargo.filter((c) -> Cargo.deliveryTimeRemaining(c) < 0)
    discard = Math.choice(undelivered)
    # ... and remove it from the ship.
    g.cargo = g.cargo.filter (c)-> c not in discard

  return effects

oldSearchChance = Cargo.searchChance
Cargo.searchChance = (place)->
  return oldSearchChance(place) + has('N', 'WellInformed') * 0.1

oldClickSearch = Cargo.clickSearch
Cargo.clickSearch = (place)->
  oldClickSearch(place)
  g.reputation[g.map.from] += Math.randomRound(has('N', 'SilverTongue') * 0.5)

oldRepairEffects = Place.repairEffects
Place.repairEffects = ->
  e = oldRepairEffects()
  e.damage *= (1 + 0.5 * has('J', 'Reliable'))
  e.damage = Math.max(e.damage, -g.damage)
  return e

oldDeliveryTimeRemaining = Cargo.deliveryTimeRemaining
Cargo.deliveryTimeRemaining = (cargo)->
  oldDeliveryTimeRemaining(cargo) + has('J', 'Trustworthy') * 2

oldMaxCargo = Cargo.maxCargo
Cargo.maxCargo = ->
  oldMaxCargo() + has('J', 'Organized')

oldPxPerDay = Game.travelPxPerDay
Game.travelPxPerDay = (travel)->
  oldPxPerDay(travel) * (1 + has('J', 'Navigator') / 10)

oldDelayDuration = Place.travel.Sail.delayDuration
Place.travel.Sail.delayDuration = (from, to, distance)->
  return Math.max(1, oldDelayDuration(from, to, distance) - has('J', 'Stoic') * 0.5)

oldDelayOccurs = Place.travel.Sail.delayOccurs
Place.travel.Sail.delayOccurs = (from, to, distance)->
  if oldDelayOccurs(from, to, distance)
    if Math.random() > (has('J', 'WeatherEye') * 0.1)
      return true
  return false

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

oldExpirationDate = Story.expirationDate
Story.expirationDate = (story)->
  return oldExpirationDate(story) + has('K', 'NeverTooLate') * 2

oldStoryOccurs = Place.travel.Sail.storyOccurs
Place.travel.Sail.storyOccurs = (from, to, distance)->
  return oldStoryOccurs(from, to, distance) or Math.random() < has('K', 'SixthSense') * 0.01

oldReputationNeeded = Story.reputationNeeded
Story.reputationNeeded = (story)->
  Math.max(0, oldReputationNeeded(story) - 2 * has('K', 'HowNotToLose'))
