/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * DS202: Simplify dynamic range loops
 * DS207: Consider shorter variations of null checks
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
import $ from 'jquery';
import 'jquery.scrollto';

import Game from 'game/Game';
import {autosaveGame} from 'gui/game';
import {applyStory, expirationDate, gameIsOver, reputationNeeded, storyEffects, unmetNeed} from 'game/Story';
import {drawMap, travel} from 'gui/map';
import {quote} from 'gui/person';
import {hideOverview} from 'gui/place';

import * as content from 'content';
import * as images from 'content/images';
import {displayStoryHelp, enterMapHelp} from 'content/help';

/*
Formatting guide:

|| places/VailiaDay
  Starts a new section, with an optional image. Each section requires a click to advance.

  Each line of text starts a new paragraph. Blank lines are ignored.

|| N/angry
  `N This is a quote colored according to Person.N.quoteColor. (Person.N === Person.Natalie). Similarly, J = James, etc.`

  Any section with a <button>button element</button> won't "click through" - your code is responsible for calling changeSection(1, true) when you're ready to carry on (probably in an onclick handler).

  Sections are automatically divided into pages as the player advances between them, fitting as many as possible on the screen at once.

|||| travel/SailingStorm
  Starts a full-screen section. While active, the image will be used as a background rather than floating inline, and the text will be at the top of the screen. All other sections will be hidden.

||-
  This section cannot be clicked through by the player. As with a <button> tag, yourcode is responsible for calling changeSection(1 true) when you're ready to carry on. Or don't, if this is a game-over screen.
*/

export var drawStory = function(place, story){
  const need = unmetNeed(place, story);

  const onclick = (g.map.from === place) && !need ?
    'onclick=\'displayWithOverlay("' + place + '", "' + story + '");\''
  : '';

  const rep = reputationNeeded(story);
  const days = expirationDate(story) - g.day;
  const expires = days === 0 ?
    'Expires today'
  : days === 1 ?
    'Expires tomorrow'
  :
    `${days} days`;

  const required = content[story].required ? 'required' : '';
  const active = onclick ? 'active' : '';
  const _class = ['story', required, active, content[story]._class].join(' ');

  return `<td class="${_class}" ${onclick} story="${story}">
  <div>
    <span class="label">${content[story].label}</span>
    <span class="cost">${rep ? -rep + ' rep' : ''}</span>
    <span class="expires">${expires}</span>
    <span class="success">✓</span>
  </div>
  <div class="participants">${Game.drawEffects(storyEffects(story))}</div>
  ${need}
</td>`;
};

window.displayWithOverlay = function(place, story){
  Game.passDay();
  applyStory(place, story);

  $('.story[story="' + story + '"] .success')
    .animate({opacity: 1}, 500)
    .animate({opacity: 0}, 1500);
  return Game.showPassDayOverlay(g.day, Game.drawEffects(storyEffects(story)), function(removeOverlay){
    removeOverlay();
    return displayStory(story);
  });
};

export var displayStory = function(story, speed = 500){
  const elements = render(story);
  $('#content').css({display: 'block'}).stop().animate({opacity: 1}, speed, function() {
    drawMap();
    return hideOverview(speed);
  });

  $('#stories').empty().append(elements);
  if (g.scroll === -1) { g.scroll = 0; }
  forwardSection(elements.first(), 1);

  return displayStoryHelp(story, speed);
};

window.continueWith = function(e, story){
  applyStory(null, story);
  autosaveGame();
  $('#stories button').attr('disabled', true);
  e.stopPropagation();
  return setTimeout((function() {
    const elements = render(story);
    $('#stories').append(elements);
    return changeSection(1, true);
  }), 200);
};

export var drawHistory = function() {
  if (g.history.Intro == null) {
    return displayStory('Intro');
  }

  const end = gameIsOver();
  if (end) {
    displayStory(end.required);
    g.history[end.required] = g.day;
    return;
  }

  if (g.scroll >= 0) {
    let day;
    const inverted = {};
    for (let event in g.history) { day = g.history[event]; inverted[day] = event; }
    ({
      day
    } = g);
    while (true) {
      if (inverted[day]) {
        displayStory(inverted[day]);
        break;
      }
      day -= 1;
    }
  }

  for (let i = 0, end1 = g.scroll, asc = 0 <= end1; asc ? i < end1 : i > end1; asc ? i++ : i--) {
    changeSection(1, true);
  }
};

export var render = function(story){
  const text = content[story].text();
  const sections = $('<div></div>');

  let lastSection = $('<section></section>');
  for (let line of text.split('\n').filter(Boolean)) {
    line = line.trim().replace(/`(\w*) (.+?)`/g, quote);
    if (!line) { continue; }

    if (line.match(/^\|\|/)) {
      lastSection.append('<hr>');
      lastSection = $('<section></section>');
      addSectionImage(lastSection, line);
      sections.append(lastSection);
      if (line.match(/^\|\|\|\|/)) {
        lastSection.addClass('full-screen');
      }
      if (line.match(/^\|\|-/)) {
        lastSection.addClass('noClickThrough');
      }
    } else {
      lastSection.append('<p>' + line + '</p>');
      if (line.match(/<button.*<\/button>/)) {
        lastSection.addClass('noClickThrough');
      }
    }
  }

  return sections.children();
};

export var changeSection = function(direction, force = false){
  if ((g.scroll === 0) && (direction < 0) && ($('section.active').length === 1)) { return; }
  const currentElement = $('section.active').last();

  if (currentElement.hasClass('noClickThrough') && (direction >= 0) && !force) { return; }
  const targetElement = elementInDirection(currentElement, direction);

  // We're moving into a section. Stop any previous animations.
  $('section').stop();

  g.scroll = Math.max(0, g.scroll + direction);
  if (direction >= 0) {
    return forwardSection(targetElement);
  } else {
    return backSection(currentElement, targetElement);
  }
};

export var forwardSection = function(to){
  if (!to.length) { return enterMap(); }

  to.addClass('active').css('opacity', 0);
  $('section.active').animate({opacity: 1}, 500);
  return $('#stories').stop().scrollTo(to, 300, {over: 1}).focus();
};

var backSection = function(from, to){
  if (!to.length) { return; }
  if ($('#content').css('display') === 'none') { return exitMap(); }

  from.animate({opacity: 0}, 500, function() {
    from.removeClass('active');
    return $('section.active').animate({opacity: 1}, 500);
  });
  return $('#stories').stop().scrollTo(to, 300, {over: 1}).focus();
};

var enterMap = function() {
  g.scroll = -1;
  $('#content').stop().animate({opacity: 0}, 500, function() {
    // Make sure the user didn't cancel and go back to the previous page before hiding the #content + deactivating sections.
    if ($('#content').css('opacity') === '0') {
      return $('#content').css({display: 'none'});
    }
});

  if (g.map.to) { travel(); }
  return enterMapHelp();
};

var exitMap = function() {
  g.scroll = $('#stories').children().length - 1;
  $('#content').stop().css({display: 'block'}).animate({opacity: 1}, 500);
  return $('section.active').animate({opacity: 1}, 500);
};

export var storyGuiSetup = function() {
  $('#stories').on('click', 'img', function(e){
    Game.showOverlay(`<img src='${e.target.src}'>`);
    return false;
  });
  $('#stories').on('click', function(e){
    if ($(e.target).closest('input, label').length) { return; }
    return changeSection(1);
  });

  $(window).keydown(keyPress);
  return $('#back').on('click', () => changeSection(-1));
};

var addSectionImage = function(element, line){
  const img = line.match(/\|\| (.+)$/);

  if (img) {
    let src = images;
    for (let part of img[1].split('/')) { src = src[part]; }

    if (src) {
      return element.append( `<img src='.${src}'>`);
    }
  }
};

var elementInDirection = function(element, direction){
  if ((direction < 0) && element.length) { return element.prev();
  } else if (direction < 0) { return $('section').last();
  } else { return element.next(); }
};

var keyPress = function(e){
  // Right
  if (e.keyCode === 39) {
    return changeSection(1);
  // Left
  } else if (e.keyCode === 37) {
    return changeSection(-1);
  }
};
