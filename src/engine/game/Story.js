/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * DS205: Consider reworking code to avoid use of IIFEs
 * DS207: Consider shorter variations of null checks
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
let story;
import $ from 'jquery';
import {choice} from 'game/util';
import Game from 'game/Game';

import * as content from 'content';
import * as places from 'content/places';
import * as travelData from 'content/travel';
import {storyExpirationSkill, storyEffectsSkill, storyReputationNeededSkill} from 'content/people/skillEffects';

/*
const sampleData = {
  where: 'Vailia|Ch1',
  label: 'Explore Wilds',
  blocking: true, // A blocking event prevents all other actions when the player is at that location. Costs no reputation.
  required: 'GameOver', // This event will result in a game over screen (using the given story) if it expires unviewed.
  requiredGroup: 'Ch2Routes', // This required event will only cause a game-over if *all* events in its group are expired or viewed, and if the chapter hasn't changed.
  _class: 'KatRoute', // Adds this class to the map view for the event
  cost: 1, // Multiplier on the event's cost. Defaults to 1 if absent.
  place: 'Vailia', // Used mostly to calculate how many days events should take to expire
  extraDays: 10, // Days added to the calculated expiration date, used to manually tweak balance
  history: {
    DeliciousFood: 1, // Must have occurred
    Ch2: -1
  }, // Event must not have occurred
  minCargo: 1, // Must have at least this much cargo aboard for the story to show
  maxCargo: 3, // Must have at most this much cargo aboard for the story to show
  effects: {
    xp: {
      Natalie: 3,
      James: 5
    }
  },
  text() { return '|| ...etc...'; }
};
*/

const sortedStories = {};
for (story in content) {
  const {where: w} = content[story];
  if (!sortedStories[w]) { sortedStories[w] = []; }
  sortedStories[w].push(story);
}

export var storiesAt = (...w) => sortedStories[w.join('|')] || [];

export var reputationNeeded = function(story){
  const mult = (content[story].cost != null) ? content[story].cost : 1;
  const base = content[story].blocking ? 0 : 15;
  return Math.max(0, (base * mult) + storyReputationNeededSkill());
};

export var canSail = function() {
  // During tutorial, don't let them sail until they've accepted cargo
  if (g.day === 1) { return false; }
  return !visibleStories(storiesAt(g.map.from, g.chapter)).some(s => content[s].blocking);
};

export var expirationDate = function(story){
  if (!content[story].history) { return (content[story].extraDays || 0); }
  const prereqsExpire = (() => {
    const result = [];
    for (let key in content[story].history) {
      result.push(expirationDate(key));
    }
    return result;
  })();
  const extraDays = parseInt(content[story].extraDays) || (typeof content[story].extraDays === 'function' ? content[story].extraDays() : undefined) || 0;
  const timeAdded = extraDays + (content[story].blocking ? 4 : 15);
  return Math.max(...prereqsExpire) + timeAdded + (prereqsExpire.length * 12) + storyExpirationSkill();
};

export var unmetNeed = function(place, story){
  if (g.reputation[place] < reputationNeeded(story)) {
    return `Need ${Math.ceil(reputationNeeded(story) - g.reputation[place])} more rep`;
  } else { return ''; }
};

export var storyEffects = function(story){
  const e = $.extend(true, {}, content[story].effects);
  return storyEffectsSkill(content[story], e);
};

export var applyStory = function(place, story){
  Game.applyEffects(storyEffects(story));
  if (place) {
    g.reputation[place] -= reputationNeeded(story);
  }
  if (typeof content[story].apply === 'function') {
    content[story].apply();
  }
  g.history[story] = g.day;
};

export var travelEvent = function(from, to, type){
  const stories = storiesAt(type)
    .concat(storiesAt(type, g.chapter))
    .filter(matchesConditions);

  if (blockingEvents(stories).length) {
    return choice(blockingEvents(stories));
  } else if (travelData[type].travelStoryOccurs()) {
    return choice(repeatableEvents(stories));
  }
  return null;
};

export var delayEvent = function(from, to, type){
  const stories = storiesAt(type, 'delay').concat(storiesAt(type, g.chapter, 'delay'));
  return choice(blockingEvents(stories)) || choice(repeatableEvents(stories)) || null;
};

export var visibleStories = (stories = []) => stories
  .filter(hasntOccurred)
  .filter(matchesHistory)
  .filter(matchesConditions);

export var gameIsOver = function() {
  let group;
  const requiredEvents = {};
  for (let place in places) {
    for (story of storiesAt(place, g.chapter)) {
      if (content[story].required) {
        group = content[story].requiredGroup;
        if (group) {
          if (!requiredEvents[group]) { requiredEvents[group] = []; }
          requiredEvents[group].push(story);
        } else if (hasntOccurred(story) && (expirationDate(story) < g.day)) {
          return content[story];
        }
      }
    }
  }

  for (group in requiredEvents) {
    const events = requiredEvents[group];
    if (!events.some(stillAvailable)) {
      return content[events.first(hasntOccurred)];
    }
  }

  return false;
};

var matchesConditions = function(story){
  if ((content[story].minCargo || 0) > g.cargo.length) { return false; }
  if ((content[story].maxCargo || 100) < g.cargo.length) { return false; }
  if ((content[story].minDamage || 0) > g.damage) { return false; }
  if ((content[story].maxDamage || 1000) < g.damage) { return false; }
  return true;
};

var matchesHistory = function(story){
  const expires = expirationDate(story);
  if (expires && (expires < g.day)) { return false; }
  for (let key in content[story].history) {
    const value = content[story].history[key];
    if (value && (g.history[key] == null)) { return false; }
    if (!value && (g.history[key] != null)) { return false; }
  }
  return true;
};

var blockingEvents = stories => visibleStories(stories)
  .filter(s => content[s].blocking);

var repeatableEvents = stories => stories
  .filter(matchesHistory)
  .filter(matchesConditions)
  .filter(story => !content[story].blocking);

var stillAvailable = story => hasntOccurred(story) && (expirationDate(story) >= g.day);
var hasntOccurred = story => g.history[story] == null;
