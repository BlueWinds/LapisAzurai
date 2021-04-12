/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * DS207: Consider shorter variations of null checks
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
import $ from 'jquery';
import Game from 'game/Game';
import {currentCordinates, dailyTravel, pathSvg} from 'game/Place';
import {applyStory, expirationDate, storiesAt, visibleStories} from 'game/Story';

import {showOverview} from 'gui/place';
import {displayStory} from 'gui/story';
import mapSvg from 'content/Map.svg';
import mapImage from 'content/Map.png';

import * as content from 'content';

export var mapGuiSetup = function() {
  // Set up draggable map
  const map = $('#map').html(mapSvg.replace(/<svg.+?>|<\/svg>/g, ''));
  const dragMap = $('#drag-map');
  map.find('#MapLayer image').attr('xlink:href', mapImage);

  // Center the map initially
  const {width: w, height: h} = $('#MapLayer')[0].getBBox();
  let dX = 0;
  let dY = 0;
  const center = function() {
    dX = (dragMap.width() - w) / 2;
    dY = (dragMap.height() - h) / 2;
    return map.css('transform', `translate(${dX}px, ${dY}px)`);
  };

  map.width(w).height(h);
  $(window).on('resize', center);
  center();

  map.on('mousedown touchstart', lastE => map.on('mousemove touchmove', function(e){
    if (w > dragMap.width()) {
      dX += e.pageX - lastE.pageX;
      dX = Math.min(0, Math.max(dX, dragMap.width() - w));
    }

    if (h > dragMap.height()) {
      dY += e.pageY - lastE.pageY;
      dY = Math.min(0, Math.max(dY, dragMap.height() - h));
    }

    map.css('transform', `translate(${dX}px, ${dY}px)`);
    return lastE = e;
  }));

  $(window).on('mouseup touchend touchcancel', () => map.off('mousemove touchmove'));

  return $('#LabelLayer g').on('click', function() {
    if ($('#LabelLayer').hasClass('interactive')) {
      showOverview(this.id);
    }
    return false;
  });
};

export var drawMap = function() {
  $('#LabelLayer').toggleClass('interactive', !g.map.to);
  $('#PathLayer path').animate({opacity: 0}, 300, function() {
    // Don't remove the attributes until after the animation is done to avoid an unpleasant flash
    return $(this).removeAttr('stroke-dasharray')
    .removeAttr('stroke-dashoffset');
  });
  $('#MapMask').children('circle, ellipse').attr('fill', 'none');
  $('#LabelLayer g').hide();

  for (let place in g.reputation) {
    $('#' + place).show().animate({opacity: 1}, 200);
    $('#' + place + 'Mask').attr('fill', 'url(#maskBlur)');
    updateLabel(place);
  }

  const location = currentCordinates(g.map);
  $('#Ship circle').attr('cx', location.x);
  $('#Ship circle').attr('cy', location.y);
};

export var travel = function() {
  if (!g.map.to) {
    return;
  }

  const event = dailyTravel(g.map);
  delete g.map.speedBonus;

  if (event.delay != null) {
    g.map.delay = event.delay;
    g.lastStorm = g.day;
  }

  g.map.distance += event.pxTravel;
  if (event.effects) {
    Game.applyEffects(event.effects);
  }

  Game.drawStatus();
  animateTravel(event);
  Game.passDay();

  // We have arrived at the destination
  if (event.pxTravel && ((g.map.distance <= 0) || (g.map.distance >= pathSvg().getTotalLength()))) {
    g.map.from = g.map.to;
    g.map.to = '';
    g.map.distance = 0;
    g.map.delay = 0;
    return setTimeout((() => showOverview(g.map.from, 1000)), 3500);
  }
};

var animateTravel = function(event){
  let effects = Game.drawEffects(event.effects || {});
  if (event.story) {
    g.lastTravelEvent = g.day;
    applyStory(null, event.story);
    displayStory(event.story, 2000);
    Game.showPassDayOverlay(g.day, effects);
  } else {
    effects += `<img src='${event.image}'>`;
    Game.showPassDayOverlay(g.day, effects, function(hideOverlay){
      setTimeout(hideOverlay, 500);
      if (!event.story) { return travel(); }
    });
  }

  const length = event.path.getTotalLength();
  const ship = $('#Ship circle');
  event.path.setAttribute('stroke-dasharray', length);
  $(event.path).stop().css('opacity', 1);

  // Convert -1/1 to 0/1
  const dashoffset = (event.direction + 1) / 2;

  return $({d: event.start}).animate({d: event.start + event.pxTravel}, {
    duration: 2000,
    easing: 'linear',
    step(now){
      const pos = event.path.getPointAtLength(now);
      ship.attr('cx', pos.x);
      ship.attr('cy', pos.y);
      event.path.setAttribute('stroke-dashoffset', (length * dashoffset) - now);
    }
  });
};

var updateLabel = function(place){
  let visible;
  const span = $('#' + place + ' tspan').removeClass();

  if ($('#LabelLayer').hasClass('interactive')) {
    visible = visibleStories(storiesAt(place, g.chapter));
    visible = visible.sort((a, b) => expirationDate(a) - expirationDate(b));
  } else { visible = []; }

  if (visible[0]) {
    const expiresClass = content[visible[0]].required ? 'required' : 'normal';

    span.show();
    span.children()
      .addClass(expiresClass)
      .addClass(content[visible[0]]._class)
      .text(expirationDate(visible[0]) -  g.day);
  } else {
    span.hide();
  }

  const box = $('#' + place + ' text').show()[0].getBBox();
  const rect = $('#' + place + ' rect').show()[0];
  rect.setAttribute('x', box.x - 4);
  rect.setAttribute('y', box.y - 2);
  rect.setAttribute('width', box.width + 8);
  return rect.setAttribute('height', box.height + 4);
};
