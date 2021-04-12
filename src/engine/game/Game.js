/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * DS202: Simplify dynamic range loops
 * DS207: Consider shorter variations of null checks
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
import $ from 'jquery';
import yaml from 'js-yaml';

import Cargo from 'game/Cargo';

import {startingGame} from 'content/map';
import {sailSpeedSkill} from 'content/people/skillEffects';

/*
const sampleGame = {
  version: 0,
  day: 13,
  chapter: 'Ch1',
  showHelp: true,
  cargo: [
    {
      name: 'Fish Hooks',
      from: 'Vailia',
      to: 'Mt. Julia',
      start: 12 // Game day
    }
  ],
  map: {
    from: 'Vailia', // Last port we docked in
    to: 'MtJulia', // If not empty, means we're currently traveling.
    distance: 15, // Where on the current path we are.
    delay: 0, // If there is an ongoing delay, how many more days it will last
    speedBonus: -12
  }, // How many extra pixels of progress to make on the next day (negative will slow down, to minimum of 0px progress)
  availableCargo: [], // As g.cargo
  lastTravelEvent: 0, // When we last showed a travel event.
  reputation: {
    Vailia: 3
  },
  jobFocus: 'Vailia', // Last selected focus when searching for jobs
  jobSearch: {
    Vailia: 0.58
  }, // Accumulated chance from previous failed attempts to find cargo here
  people: {
    Natalie: {
      xp: 100,
      skills: {
        Captain: true,
        EarToTheGround: true,
        EarToTheGround2: true
      }
    }
  },
  history: {
    Intro: 0,
    ExploreWilds: 1
  },
  damage: 12, // How much damage has been done to the ship already
  preventNextDamage: 5 // The next damage will be shielded
};
*/

var Game = {
  travelSpeed(type, damage = g.damage) {
    return type === 'Sail' ?
      Math.max(0.25, 1 - (damage / 50)) * sailSpeedSkill()
    : 0.5;
  },

  travelPxPerDay(type){
    return (15 * Game.travelSpeed(type)) + ((typeof g !== 'undefined' && g !== null ? g.map.speedBonus : undefined) || 0);
  },

  updates: [], // Functions taking one argument, a game state.

  mostRecentGameData() {
    const last = Object.keys(localStorage).map(key => parseFloat(key) || 0).sort().pop();
    if (last) {
      const game = yaml.safeLoad(localStorage[last]);
      if (game.map) { return game; }
    }

    return $.extend(true, {}, startingGame);
  },

  start(data){
    window.g = data;
    for (let i = data.version, end = Game.updates.length, asc = data.version <= end; asc ? i < end : i > end; asc ? i++ : i--) {
      Game.updates[i](data);
    }
    return data.version = Game.updates.length;
  },

  applyEffects(e){
    const object = e.reputation || {};
    for (let place in object) {
      const rep = object[place];
      if (!g.reputation[place]) { g.reputation[place] = 0; }
      g.reputation[place] += rep;
    }
    const object1 = e.xp || {};
    for (let person in object1) {
      const xp = object1[person];
      if (!g.people[person]) { g.people[person] = {skills: {}, xp: 0}; }
      g.people[person].xp += xp;
    }
    if (e.damage) {
      g.damage += e.damage;
      g.damage = Math.max(0, g.damage);
    }
  },

  passDay() {
    g.day++;

    Cargo.passDay();
    return delete g.nextDayDescription;
  }
};

export default Game;
