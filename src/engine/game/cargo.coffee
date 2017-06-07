sampleCargo =
  name: 'Fish Hooks'
  from: 'Vailia'
  to: 'MtJulia'
  start: 12 # Game day

window.Cargo =
  acceptTimeRemaining: (cargo)->
    passed = g.day - cargo.start
    return 15 - passed

  newCargoDaily: -> 2

  maxCargo: -> 3

  fromReputation: -> 10

  toReputation: -> 10

  deliveryTimeRemaining: (cargo)->
    passed = g.day - cargo.start
    travel = Place.travelDays(cargo.from, cargo.to)
    return 10 + travel - passed

  passDay: ->
    g.availableCargo = g.availableCargo.filter (cargo)-> Cargo.acceptTimeRemaining(cargo.start) >= 0
    Cargo.createRandom(Cargo.newCargoDaily())

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
    g.cargo = g.cargo.splice(index, 1)
    if Cargo.acceptTimeRemaining() >= 0
      g.reputation[cargo.from] += Cargo.fromReputation()
      g.reputation[cargo.to] += Cargo.toReputation()
    Game.passDay()
