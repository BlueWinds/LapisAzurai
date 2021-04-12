import * as images from './images';

import {eventIntervalSkill, stormDamageSkill, stormDurationSkill, stormIntervalSkill} from 'content/people/skillEffects';

export var Sail = {
  normalImages: [
    images.CabinDay,
    images.CabinNight,
    images.DeckDay,
    images.DeckNight,
    images.DeckFog,
    images.SailingDay,
    images.SailingNight
  ],
  delayImages: [
    images.DeckStorm,
    images.SailingStorm
  ],

  travelStoryOccurs() {
    const min = 50 + eventIntervalSkill();
    const cycle = 50;
    return (g.lastTravelEvent + (Math.random() * cycle) + min) < g.day;
  },

  delayOccurs(from, to, distance){
    // If we're past the intro, storms are random.
    if (g.history.FirstStormSick) { return randomStormOccurs(); }

    // Always trigger a storm on the trip back to Vailia when we're almost in port
    if (g.history.MtJuliaArrive && !g.history.FirstStorm && (distance < 75)) { return true; }

    // No storms until we've had the intro event about Natalie's magic
    return false;
  },

  delayDailyDamage(from, to, distance) {
    let damage = Math.max(0, (5 * (Math.random() + 0.5)) + stormDamageSkill());
    // Damage has been prevented, probably by one of the delay events
    if (g.preventNextDamage) {
      if (g.preventNextDamage > damage) {
        g.preventNextDamage -= damage;
        damage = 0;
      } else {
        damage -= g.preventNextDamage;
        g.preventNextDamage = 0;
      }
    }
    return damage;
  },

  delayDuration() { return Math.max(1, (4 * (Math.random() + 0.5)) + stormDurationSkill()); }
};

var randomStormOccurs = function() {
  const min = 70 + stormIntervalSkill();
  const cycle = 100;
  return (g.lastStorm + (Math.random() * cycle) + min) < g.day;
};
