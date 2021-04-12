/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * DS207: Consider shorter variations of null checks
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
import {choice, weightedChoice} from 'game/util';
import Game from 'game/Game';
import {travelDays} from 'game/Place';
import {storiesAt, visibleStories} from 'game/Story';
import {goods} from 'content/map';

import * as content from 'content';
import * as places from 'content/places';
import {acceptTimeRemainingSkill, cargoCreateSkill, cargoDeliverSkill, cargoSearchChanceSkill, deliveryTimeRemainingSkill, maxCargoSkill} from 'content/people/skillEffects';

/*
const sampleCargo = {
  name: 'Fish Hooks',
  from: 'Vailia',
  to: 'MtJulia',
  start: 12, // Game day
  reputation: [3, 5] // This cargo is worth 3 reputation at the origin and 5 at the destination
};
*/

var Cargo = {
  goods: {},
  acceptTimeRemaining(cargo){
    const passed = g.day - cargo.start;
    return (30 - passed) + acceptTimeRemainingSkill();
  },

  maxCargo() { return 3 + maxCargoSkill(); },

  canPickUpDeliver() {
    return !visibleStories(storiesAt(g.map.from, g.chapter)).some(p => content[p].blocking);
  },

  searchChance(place){
    const baseChance = places[place].jobChance * (g.reputation[place] > 0 ? 1 : 0.5);
    return baseChance + (g.jobSearch[place] || 0) + cargoSearchChanceSkill();
  },

  searchCost(place){
    return Math.min(1, g.reputation[place]);
  },

  deliveryTimeRemaining(cargo){
    const passed = g.day - cargo.start;
    const travel = travelDays(cargo.from, cargo.to);
    return ((15 + travel) - passed) + deliveryTimeRemainingSkill();
  },

  passDay() {
    g.availableCargo = g.availableCargo.filter(cargo => Cargo.acceptTimeRemaining(cargo) >= 0);
  },

  potentialDestinations(from){
    const dest = {};
    for (let destination in places[from].goods) {
      const goods = places[from].goods[destination];
      if (g.reputation[destination] != null) {
        dest[destination] = goods.length;
        // If the player is focusing on this location, quadruple the changes cargo will be headed here
        if (destination === g.jobFocus) {
          dest[destination] += goods.length * 3;
        }
      }
    }
    return dest;
  },

  create(from){
    const to = weightedChoice(Cargo.potentialDestinations(from));
    if (!to) { return; }
    const name = choice(places[from].goods[to]);
    const reputation = [goods[name][0], goods[name][1]];
    const cargo = {name, from, to, start: g.day, reputation};
    return cargoCreateSkill(cargo);
  },

  accept(cargo){
    g.availableCargo = g.availableCargo.filter(c => c !== cargo);
    cargo.start = g.day;
    g.cargo.push(cargo);
    return Game.passDay();
  },

  deliver(index){
    const cargo = g.cargo[index];
    g.cargo.splice(index, 1);
    const effects = {reputation: {}};
    if (Cargo.deliveryTimeRemaining(cargo) >= 0) {
      effects.reputation[cargo.from] = cargo.reputation[0];
      effects.reputation[cargo.to] = cargo.reputation[1];
    }
    Game.passDay();
    Game.applyEffects(effects);

    return cargoDeliverSkill(effects);
  }
};

export default Cargo;
