/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
import $ from 'jquery';

import Game from 'game/Game';
import Cargo from 'game/Cargo';
import {direction, pathSvg, repairEffects, travelDays, travelSteps} from 'game/Place';
import {canSail, storiesAt, unmetNeed, visibleStories} from 'game/Story';

import {drawMap, travel} from 'gui/map';
import {updateOverview} from 'gui/person';
import {drawStory} from 'gui/story';

import * as content from 'content';
import * as places from 'content/places';
import {hideOverviewHelp, showOverviewHelp} from 'content/help';

export var showOverview = function(place = $('.place').attr('place') || g.map.from, duration = 500){
  const o = $('#overview');
  updateOverview();

  o.find('.place').replaceWith(draw(place));
  $('.place img', o).click(() => hideOverview());

  if (!o.hasClass('active')) {
    o.css({opacity: 0, display: 'block'})
    .stop().delay(duration * 0.2).animate({opacity: 1}, duration * 0.8);
  }
  o.addClass('active');

  return showOverviewHelp(place, duration);
};

export var hideOverview = function(duration = 500){
  $('.logo').removeClass('active');
  $('#overview').removeClass('active').stop().animate({opacity: 0}, duration, function() {
    if (!$('#overview').hasClass('active')) { return $('#overview').css('display', 'none'); }
  });
  drawMap();

  return hideOverviewHelp(duration);
};

var draw = function(place){
  let distanceDesc, travelDiv;
  if (g.map.from === place) {
    distanceDesc = 'Docked';
    travelDiv = '';
  } else {
    distanceDesc = `${travelDays(g.map.from, place)} days sailing`;
    const disabled = canSail() ? '' : 'disabled';
    travelDiv = `<div class="travel ${disabled}" ${disabled ? '' : 'onclick="clickTravel(\'' + place + '\');"'}>
  ⛵⇢
  <div class="sail-speed">${Math.round(Game.travelSpeed('Sail')) * 100}% speed</div>
</div>`;
  }

  const deliverable = g.cargo.filter(job => job.to === place);
  const available = g.availableCargo.filter(job => job.from === place);
  const visible = visibleStories(storiesAt(place, g.chapter));

  let clickableHere = visible.filter(s => !unmetNeed(place, s));
  const visibleHere = visible.filter(s => unmetNeed(place, s));

  // If there are blocking stories, then hide everything else until they're dealt with.
  const blocking = clickableHere.filter(s => content[s].blocking);
  if (blocking.length) {
    clickableHere = blocking;
  }


  return `<div place="${place}" class="place">
  <img src="${places[place].img}">
  ${travelDiv}
  <div class="name">${places[place].name}</div>
  <div class="description">${distanceDesc} - ${Math.floor(g.reputation[place])} reputation</div>
  <div class="table-wrapper"><table>
    ${Game.drawList(clickableHere, drawStory.bind(null, place))}
    ${(blocking.length === 0) && g.damage && (g.map.from === place) ? Game.drawList([true], drawRepair) : ''}
    ${blocking.length === 0 ? Game.drawList([place], Cargo.drawSearch) : ''}
    ${Game.drawList(deliverable, Cargo.drawDelivery)}
    ${Game.drawList(available, Cargo.draw)}
    ${Game.drawList(visibleHere, drawStory.bind(null, place))}
  </table></div>
</div>`;
};

window.clickTravel = function(to){
  hideOverview();
  g.map.to = travelSteps(g.map.from, to)[0][1];
  drawMap();

  const dir = direction(g.map.from, g.map.to);
  g.map.distance = pathSvg().getTotalLength() * (dir < 0);
  return travel();
};

var drawRepair = function() {
  const newDamage = g.damage + repairEffects().damage;

  const oldPercent = Game.travelSpeed('Sail') * 100;
  const newPercent = Game.travelSpeed('Sail', newDamage) * 100;
  return `<td class="story active repair" onclick="clickRepair();">
  <div>
    <span class="label">Repair Ship</span>
    <span class="cost">${Game.drawEffects(repairEffects())}</span>
    <span class="success">✓</span>
  </div>
  <div class="damage">${Math.round(oldPercent)}% → ${Math.round(newPercent)}% sail speed</div>
</td>`;
};

window.clickRepair = function() {
  Game.passDay();
  Game.applyEffects(repairEffects());

  Game.showPassDayOverlay(undefined, 'Repaired the ship');
  return Game.animateSuccess('.repair.active .success');
};
