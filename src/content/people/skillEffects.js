/*
 * decaffeinate suggestions:
 * DS103: Rewrite code to no longer use __guard__
 * DS202: Simplify dynamic range loops
 * DS207: Consider shorter variations of null checks
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
import Cargo from 'game/Cargo';
import {choice, randomRound} from 'game/util';

import people from 'content/people';

var has = function(name, skill, second){
  // Not all skills have a 'second', so this gets called with eg. Mage2, and we need to bail early
  if (!people[name].skills[skill]) { return 0; }

  const {
    doubledBy
  } = people[name].skills[skill];
  const multiplier = __guard__(typeof g !== 'undefined' && g !== null ? g.people.Asara : undefined, x => x.skills[doubledBy]) ? 2 : 1;

  let value = (__guard__(typeof g !== 'undefined' && g !== null ? g.people[name] : undefined, x1 => x1.skills[skill]) || 0) * multiplier;
  if (!second) { value += has(name, skill + '2', true); }
  return value;
};

export var cargoCreateSkill = function(cargo){
  cargo.reputation[0] += has('Natalie', 'Gregarious');
  cargo.reputation[1] += has('Natalie', 'Overdeliver');
  return cargo;
};

export var cargoDeliverSkill = function(effects) {
  if (Math.random() < (has('Natalie', 'Grounded') * 0.25)) {
    g.availableCargo.push(Cargo.create(g.map.from));
  }

  // Select 0 or 1 expired cargoes...
  if (randomRound(has('Kat', 'Devilish') / 4)) {
    const undelivered = g.cargo.filter(c => Cargo.deliveryTimeRemaining(c) < 0);
    const discard = choice(undelivered);
    // ... and remove it from the ship.
    g.cargo = g.cargo.filter(c => !discard.includes(c));
  }

  return effects;
};

export var maxCargoSkill = () => has('James', 'Journeyman') + has('James', 'Master');
export var cargoSearchChanceSkill = () => has('Natalie', 'WellInformed') * 0.1;
export var clickSearchSkill = () => g.reputation[g.map.from] += randomRound(has('Natalie', 'SilverTongue') * 0.5);
export var acceptTimeRemainingSkill = () => has('James', 'Organized') * 5;
export var deliveryTimeRemainingSkill = () => has('James', 'Trustworthy') * 5;

export var repairEffectsSkill = function(e){
  e.damage *= (1 + (0.25 * has('James', 'Reliable')));
  e.damage = Math.max(e.damage, -g.damage);
  if (has('James', 'Apprentice') && e.reputation[g.map.from]) {
    e.reputation[g.map.from] = -randomRound(0.5);
  }
  return e;
};

export var sailSpeedSkill = () => 1 + (has('James', 'Navigator') / 10);
export var eventIntervalSkill = () => -has('Kat', 'SixthSense') * 5;
export var stormIntervalSkill = () => has('James', 'WeatherEye') * 5;
export var stormDurationSkill = () => -has('James', 'Stoic') * 0.5;
export var stormDamageSkill = (from, to, distance) => -has('Natalie', 'Mage') - has('Natalie', 'Adept');

export var storyExpirationSkill = () => has('Kat', 'NeverTooLate') * 3;
export var storyReputationNeededSkill = () => -2 * has('Kat', 'HowNotToLose');
export var storyEffectsSkill = function(story, e){
  if (story.xp) {
    let i, person;
    let asc, end;
    for (i = 0, end = has('Kat', 'Bright'), asc = 0 <= end; asc ? i < end : i > end; asc ? i++ : i--) {
      person = choice(Object.keys(e.xp));
      e.xp[person] += 1;
    }

    const nonParticipants = ['Natalie', 'James', 'Kat', 'Asara'].filter(p => !e.xp[p]);
    if (nonParticipants) {
      let asc1, end1;
      for (i = 0, end1 = has('Kat', 'Generous'), asc1 = 0 <= end1; asc1 ? i < end1 : i > end1; asc1 ? i++ : i--) {
        person = choice(nonParticipants, story);
        if (!e.xp[person]) { e.xp[person] = 0; }
        e.xp[person] += 1;
      }
    }
  }

  if ((story.label === 'Arrival') && has('Natalie', 'WinningSmile')) {
    const place = story.where.split('|')[0];

    if (!e.reputation) { e.reputation = {}; }
    if (!e.reputation[place]) { e.reputation[place] = 0; }
    e.reputation[place] += 5 * has('Natalie', 'WinningSmile');
  }

  return e;
};

export var xpNeededSkill = function() {
  let xp = -has('Kat', 'StreetRat') * 3;
  xp -= has('Kat', 'Deckhand') * 4;
  xp -= has('Kat', 'FreeWoman') * 5;
  return xp;
};

export var searchSpecializeEnabled = () => has('Natalie', 'Initiate');

function __guard__(value, transform) {
  return (typeof value !== 'undefined' && value !== null) ? transform(value) : undefined;
}
