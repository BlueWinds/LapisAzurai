sampleCargo =
  name: 'Fish Hooks'
  from: 'Vailia'
  to: 'MtJulia'
  start: 12 # Game day
  reputation: [3, 5] # This cargo is worth 3 reputation at the origin and 5 at the destination

window.Cargo =
  goods: {}
  acceptTimeRemaining: (cargo)->
    passed = g.day - cargo.start
    return 30 - passed

  maxCargo: -> 3

  canPickUpDeliver: ->
    not Story.visibleStories(Place[g.map.from].stories[g.chapter]).some (p)-> Story[p].blocking

  searchChance: (place)->
    baseChance = Place[place].jobChance * (if g.reputation[place] > 0 then 1 else 0.5)
    return baseChance + (g.jobSearch[place] or 0)

  searchCost: (place)->
    return Math.min(1, g.reputation[place])

  deliveryTimeRemaining: (cargo)->
    passed = g.day - cargo.start
    travel = Place.travelDays(cargo.from, cargo.to)
    return 15 + travel - passed

  passDay: ->
    g.availableCargo = g.availableCargo.filter (cargo)->
      Cargo.acceptTimeRemaining(cargo) >= 0
    return

  potentialDestinations: (from)->
    dest = {}
    for destination, goods of Place[from].goods when g.reputation[destination]?
      dest[destination] = goods.length
      # If the player is focusing on this location, quadruple the changes cargo will be headed here
      if destination is g.jobFocus
        dest[destination] += goods.length * 3
    return dest

  create: (from)->
    to = Math.weightedChoice(Cargo.potentialDestinations(from))
    unless to then return
    name = Math.choice Place[from].goods[to]
    reputation = [Cargo.goods[name][0], Cargo.goods[name][1]]
    return {name, from, to, start: g.day, reputation}

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
      effects.reputation[cargo.from] = cargo.reputation[0]
      effects.reputation[cargo.to] = cargo.reputation[1]
    Game.passDay()
    Game.applyEffects(effects)

    return effects
