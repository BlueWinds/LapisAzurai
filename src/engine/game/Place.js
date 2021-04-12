/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
import Game from 'game/Game';
import {delayEvent, travelEvent} from 'game/Story';
import {choice, clamp} from 'game/util';

import * as places from 'content/places';
import * as travelData from 'content/travel';
import {repairEffectsSkill} from 'content/people/skillEffects';

/*
const samplePlaceData = {
  name: 'Mt. Julia',
  paths: {
    Vailia: -1, // -1: The path is ThereHere (it needs to be animated "in reverse")
    Alkenia: 1, // 1: The path goes HereThere (it is animated "forward")
    Tomenoi: 'Vailia'
  }, // A string: The path from here to Tomenoi goes to Vailia next
  goods: {
    Vailia: [
      'Fish',
      'Silver',
      'Lumber'
    ]
  },
  jobChance: 0.3
};
*/

export var repairEffects = function() {
  const e = {
    damage: -Math.min(6 * (g.reputation[g.map.from] > 0 ? 1 : 0.5), g.damage),
    reputation: {}
  };
  e.reputation[g.map.from] = -Math.min(1, g.reputation[g.map.from]);
  return repairEffectsSkill(e);
};

export var currentCordinates = function(map){
  // A path
  if (map.to) {
    const path = pathSvg([map.from, map.to]);
    const len = distanceAlongPath(path.id, map.distance || 0);
    return path.getPointAtLength(len);
  }

  // A port
  const circle = document.getElementById(map.from).children[1];
  return {x: circle.cx.baseVal.value, y: circle.cy.baseVal.value};
};

var distanceAlongPath = function(place, distance){
  const element = document.getElementById(place);
  if (distance >= 0) { return distance; } else { return element.getTotalLength() + distance; }
};

export var travelDays = function(from, to){ // Returns days between two locations, including indirect routes
  if (!from || !to) { return 0; }
  const sumLength = function(sum, e){
    // Should be an error, but here for now so I can be lazy about drawing paths on the map.
    // TODO: remove the return
    if (!e) { return; }
    return sum + Math.ceil(e.getTotalLength() / Game.travelPxPerDay(e.attributes.travel.value));
  };
  return travelSteps(from, to).map(pathSvg).reduce(sumLength, 0);
};

export var travelSteps = function(from, to){
  if (from === to) { return []; }

  const steps = [];
  let location = from;
  while (true) {
    if (typeof places[location].paths[to] === 'number') {
      steps.push([location, to]);
      break;
    }

    const nextStop = places[location].paths[to];
    steps.push([location, nextStop]);
    location = nextStop;
  }
  return steps;
};

export var pathSvg = function([from, to] = [g.map.from, g.map.to]){
  const string = direction(from, to) === 1 ? (from + '_' + to) : (to + '_' + from);
  // For the dev tools, we don't compile the map svg into the html, as is done for the main game
  return document.getElementById(string) || document.getElementById('map').contentDocument.getElementById(string);
};

export var dailyTravel = function(map){
  const path = pathSvg([map.from, map.to]);
  const type = path.attributes.travel.value;
  const dir = direction(map.from, map.to);

  const pxPerDay = Game.travelPxPerDay(type) * dir;
  const to = clamp(map.distance + pxPerDay, 0, path.getTotalLength());

  const event = {
    image: choice(travelData[type].normalImages),
    path,
    start: map.distance,
    direction: dir,
    pxTravel: to - map.distance,
    story: !map.delay ? travelEvent(map.from, map.to, type) : undefined
  };

  if ((to === 0) || (to === path.getTotalLength())) {
    event.image = places[map.to].img;
  // No storms the day you arrive in port
  } else if (map.delay || travelData[type].delayOccurs(map.from, map.to, map.distance)) {
    const duration = map.delay || travelData[type].delayDuration(map.from, map.to, map.distance);

    event.image = choice(travelData[type].delayImages);
    event.delay = Math.max(0, duration - 1); // Subtract one day because this event already took up one of them
    event.effects = {damage: travelData[type].delayDailyDamage(map.from, map.to, map.distance)};

    // If this is the first day of a delay, trigger an event
    if (!map.delay) {
      event.story = delayEvent(map.from, map.to, type);
    }
  }

  return event;
};

export var direction = function(from, to){
  if (typeof places[from].paths[to] !== 'number') {
    throw new Error('No direct path from ' + from + ' to ' + to);
  }
  return places[from].paths[to];
};
