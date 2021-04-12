/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
import $ from 'jquery';

import Game from 'game/Game';
import Cargo from 'game/Cargo';

import * as places from 'content/places';
import {clickSearchSkill, searchSpecializeEnabled} from 'content/people/skillEffects';

const remainingDiv = function(days) {
  if (days >= 0) {
    return `<div><span class="remaining">${days} days to deliver</span></div>`;
  } else {
    return '<div><span class="remaining expired">Expired</span></div>';
  }
};

export var drawCargo = function() {
  $('header .cargo').html(`${g.cargo.length}/${Cargo.maxCargo()} Cargo`);

  const byRemaining = (a, b) => a.start - b.start;

  const c = g.cargo.sort(byRemaining).map(function(c){
    const time = Cargo.deliveryTimeRemaining(c);
    return `• ${c.name} from ${places[c.from].name} to ${places[c.to].name}, ${time ? time + ' days to deliver' : 'Expired'}`;
  });
  return $('header .cargo').attr('title', c.join('\n'));
};

$.extend(Cargo, {
  drawSearchLabel(place){
    if (!searchSpecializeEnabled()) {
      return '<span class="label">Search for jobs</span>';
    }

    const potentialDests = Object.keys(Cargo.potentialDestinations(place));
    const makeDestOption = dest => `<option value=${dest} ${g.jobFocus === dest ? 'selected' : ''}>${places[dest].name}</option>`;

    return `<span class="label">
  Search for jobs -
  <select class="searchFocus" onclick="event.stopPropagation()" onchange="changeSearchFocusCargo()">
    ${potentialDests.map(makeDestOption)}
  </select>
</span>`;
  },

  drawSearch(place){
    const onclick = (g.map.from === place) && (g.cargo.length < Cargo.maxCargo()) ?
      'onclick="clickSearchCargo(\'' + place + '\');"'
    : '';

    return `<td class="cargoSearch ${onclick ? 'active' : ''}" ${onclick}>
  <div>
    ${Cargo.drawSearchLabel(place)}
    <span class="cost">
      <span class="${g.reputation[place] ? '' : 'lowRep'}">${Math.round(Cargo.searchChance(place) * 100)}%</span>
      <br>${-Cargo.searchCost(place)} rep
    </span>
    <span class="success">✓</span>
  </div>
</td>`;
  },

  draw(cargo){
    const i = g.availableCargo.indexOf(cargo);
    const onclick = (g.map.from === cargo.from) && (Cargo.maxCargo() > g.cargo.length) && Cargo.canPickUpDeliver() ?
      'onclick="clickAcceptCargo(' + i + ');"'
    : '';

    const accept = Cargo.acceptTimeRemaining(cargo);
    return `<td class="cargo accept ${i} ${onclick ? 'active' : ''}" ${onclick}>
  <div>
    Load <span class="what">${cargo.name}</span> for <span class="to">${places[cargo.to].name}</span>
    <span class="cost">${cargo.reputation[0]} rep here<br>${cargo.reputation[1]} rep there</span>
    <span class="success">✓</span>
  </div>
  <div><span class="remaining">${accept} days to accept</div>
</nd>`;
  },

  drawDelivery(cargo){
    const i = g.cargo.indexOf(cargo);
    const onclick = (g.map.from === cargo.to) && Cargo.canPickUpDeliver() ?
      'onclick="clickDeliverCargo(' + i + ');"'
    : '';

    const result = Cargo.deliveryTimeRemaining(cargo) >= 0 ?
      `${cargo.reputation[1]} rep here<br>${cargo.reputation[0]} rep there`
    :
      '';

    return `<td class="cargo delivery ${i} ${onclick ? 'active' : ''}" ${onclick}>
  <div>
    Deliver <span class="what">${cargo.name}</span> from <span class="from">${places[cargo.from].name}</span>
    <span class="cost">${result}</span>
    <span class="success">✓</span>
  </div>
  ${remainingDiv(Cargo.deliveryTimeRemaining(cargo))}
</td>`;
  }
});

window.changeSearchFocusCargo = () => g.jobFocus = $('select.searchFocus').val() || '';

window.clickSearchCargo = function(place){
  // Call this in case the last place where focus was set isn't
  // on the list of available options for this location.
  window.changeSearchFocusCargo();
  Game.passDay();

  let chance = Cargo.searchChance(place);
  while (chance > Math.random()) {
    chance--;
    g.availableCargo.push(Cargo.create(place));
    if (g.availableCargo.length > 10) {
      g.availableCargo.shift();
    }
  }

  g.jobSearch[place] = Math.max(0, chance);
  g.reputation[place] -= Cargo.searchCost(place);

  Game.showPassDayOverlay(undefined, 'Repaired the ship');
  Game.animateSuccess('.cargoSearch .success');
  return clickSearchSkill();
};

window.clickAcceptCargo = function(i){
  const cargo = g.availableCargo[i];
  Cargo.accept(cargo);

  Game.showPassDayOverlay(undefined, `Loaded ${cargo.name.toLowerCase()} destined for ${cargo.to}`);
  return Game.animateSuccess('.cargo.accept.' + i + ' .success');
};

window.clickDeliverCargo = function(i){
  const effects = Cargo.deliver(i);

  Game.showPassDayOverlay(undefined, Game.drawEffects(effects));
  return Game.animateSuccess('.cargo.delivery.' + i + ' .success');
};
