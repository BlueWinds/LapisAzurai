sampleCargo =
  name: 'Fish Hooks'
  from: 'Vailia'
  to: 'MtJulia'
  start: 12 # Game day

window.Cargo =
  acceptTimeRemaining: (cargo)->
    passed = g.day - cargo.start
    return 10 - passed

  newCargoDaily: -> Math.floor(Math.random() * 1.5)

  maxCargo: -> 3

  fromReputation: -> 7

  toReputation: -> 8

  deliveryTimeRemaining: (cargo)->
    passed = g.day - cargo.start
    travel = Place.travelDays(cargo.from, cargo.to)
    return 11 + travel - passed

  passDay: ->
    g.availableCargo = g.availableCargo.filter (cargo)->
      Cargo.acceptTimeRemaining(cargo) >= 0
    Cargo.createRandom(Cargo.newCargoDaily())

    unless g.availableCargo.length
      Cargo.createRandom(1)

  potentialCargoCount: (place)->
    count = 0
    for destination, goods of Place[place].goods when g.reputation[destination]?
      count += goods.length
    return count

  createRandom: (count)->
    possibleCargo = {}
    for place of g.reputation
      possibleCargo[place] = Cargo.potentialCargoCount(place)

    for i in [0 ... count]
      place = Math.weightedChoice(possibleCargo)
      if g.availableCargo.filter((c)-> c.from is place).length > 4
        return

      g.availableCargo.push Cargo.create(place)

  create: (from)->
    potentialDestinations = {}
    for destination, goods of Place[from].goods when g.reputation[destination]?
      potentialDestinations[destination] = goods.length

    to = Math.weightedChoice(potentialDestinations)
    name = Math.choice Place[from].goods[to]
    return {name, from, to, start: g.day}

  accept: (cargo)->
    g.availableCargo = g.availableCargo.filter (c)-> c isnt cargo
    cargo.start = g.day
    g.cargo.push cargo
    Game.passDay()

  deliver: (index)->
    cargo = g.cargo[index]
    g.cargo.splice(index, 1)
    effects = {reputation: {}}
    if Cargo.deliveryTimeRemaining(cargo) >= 0
      effects.reputation[cargo.from] = Cargo.fromReputation()
      effects.reputation[cargo.to] = Cargo.toReputation()
    Game.passDay()
    Game.applyEffects(effects)

    return effects
