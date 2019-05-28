import {choice, weightedChoice} from 'game/util'
import Game from 'game/Game'
import Place from 'game/Place'
import Story, {storiesAt} from 'game/Story'

import * as content from 'content'
import {acceptTimeRemainingSkill, cargoCreateSkill, cargoDeliverSkill, cargoSearchChanceSkill, deliveryTimeRemainingSkill, maxCargoSkill} from 'content/people/skillEffects'

sampleCargo =
  name: 'Fish Hooks'
  from: 'Vailia'
  to: 'MtJulia'
  start: 12 # Game day
  reputation: [3, 5] # This cargo is worth 3 reputation at the origin and 5 at the destination

Cargo =
  goods: {}
  acceptTimeRemaining: (cargo)->
    passed = g.day - cargo.start
    return 30 - passed + acceptTimeRemainingSkill()

  maxCargo: -> 3 + maxCargoSkill()

  canPickUpDeliver: ->
    not Story.visibleStories(storiesAt(g.map.from, g.chapter)).some (p)-> content[p].blocking

  searchChance: (place)->
    baseChance = Place[place].jobChance * (if g.reputation[place] > 0 then 1 else 0.5)
    return baseChance + (g.jobSearch[place] or 0) + cargoSearchChanceSkill()

  searchCost: (place)->
    return Math.min(1, g.reputation[place])

  deliveryTimeRemaining: (cargo)->
    passed = g.day - cargo.start
    travel = Place.travelDays(cargo.from, cargo.to)
    return 15 + travel - passed + deliveryTimeRemainingSkill()

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
    to = weightedChoice(Cargo.potentialDestinations(from))
    unless to then return
    name = choice(Place[from].goods[to])
    reputation = [Cargo.goods[name][0], Cargo.goods[name][1]]
    cargo = {name, from, to, start: g.day, reputation}
    return cargoCreateSkill(cargo)

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

    return cargoDeliverSkill(effects)

export default Cargo
