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
    distance = Place.distance(cargo.from, cargo.to)
    return 10 + distance - passed

  passDay: ->
    g.availabileCargo = g.availabileCargo.filter (cargo)-> Cargo.acceptTimeRemaining(cargo.start) >= 0

    Cargo.createRandom(Cargo.newCargoDaily())

  potentialCargoCount: (placeName)->
    count = 0
    for destination, goods of Place[placeName].goods when g.reputation[destination]?
      count += goods.length
    return count

  createRandom: (count)->
    possibleCargo = {}
    for r, place in g.reputation
      possibleCargo[place] = Cargo.potentialCargoCount(place)

    for i in [0 ... count]
      place = Math.weightedChoice(possibleCargo)
      g.availableCargo.push Cargo.create(place)

  create: (from)->
    potentialDestinations = {}
    for destination, goods in Place[from].goods when g.reputation[destination]?
      potentialDestinations[destination] = goods.length

    to = Math.weightedChoice(potentialDestinations)
    name = Math.choice Place[from].goods[to]
    return {name, from, to, start: g.day}

  accept: (cargo)->
    g.availableCargo = g.availabileCargo.filter (c)-> c isnt cargo
    cargo.start = g.day
    g.cargo.push cargo
    Game.passDay()

  deliver: (index)->
    g.cargo = g.cargo.splice(index, 1)
    if Cargo.acceptTimeRemaining() >= 0
      g.reputation[cargo.from] += Cargo.fromReputation()
      g.reputation[cargo.to] += Cargo.toReputation()
    Game.passDay()
