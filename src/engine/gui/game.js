/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
// These are included via <style> tags in index.html, but load them here
// so that webpack copies over the files
import 'gui/background.jpg';
import 'gui/game.css';

import $ from 'jquery';
import yaml from 'js-yaml';

import Game from 'game/Game';
import {gameIsOver} from 'game/Story';

import {drawCargo} from 'gui/cargo';
import {showLoadPage} from 'gui/load';
import {drawMap, mapGuiSetup} from 'gui/map';
import {drawOverview} from 'gui/person';
import {showOverview} from 'gui/place';
import {displayStory, drawHistory, storyGuiSetup} from 'gui/story';

import {startingGame} from 'content/map';

const startDay = 457783; // Ascending Earth 13, 1271

const dayList = ['1st', '2nd', '3rd', '4th', '5th', '6th', '7th', '8th', '9th', '10th', '11th', '12th', '13th', '14th', '15th', '16th', '17th', '18th', '19th', '20th', '21st', '22nd', '23rd', '24th', '25th', '26th', '27th', '28th', '29th', '30th'];
const monthList = ['Ascending', 'Resplendant', 'Descending'];
const seasonList = ['Wood', 'Fire', 'Earth', 'Water'];

export var guiSetup = function() {
  $('#new-game').click(function() {
    load($.extend(true, {}, startingGame));
    return displayStory('Intro');
  });

  $('#save-game').click(function() {
    if (!g) { return; }

    localStorage.setItem(Date.now(), yaml.safeDump(g));
    return $('#save-game .success').animate({opacity: 1}, 500)
    .animate({opacity: 0}, 2000);
  });

  $('#load-game').click(showLoadPage);

  $('#container').on('click', '.overlay', () => $('.overlay').animate({opacity: 0}, function() { return this.remove(); }));

  mapGuiSetup();
  return storyGuiSetup();
};

export var load = function(data = Game.mostRecentGameData()) {
  Game.start(data);
  Game.drawStatus();
  drawMap();
  drawHistory();
  return drawOverview();
};

$.extend(Game, {
  year(d = g.day){ return Math.floor((d + startDay) / 360); },
  dayOfYear(d = g.day){ return (d + startDay) % 360; },
  season(d = g.day){ return seasonList[Math.floor(Game.dayOfYear(d) / 90)]; },
  dayOfSeason(d = g.day){ return Game.dayOfYear(d) % 90; },
  month(d = g.day){ return monthList[Math.floor(Game.dayOfSeason(d) / 30)]; },
  dayOfMonth(d = g.day){ return Game.dayOfYear(d) % 30; },
  date(d = g.day){ return `${dayList[Game.dayOfMonth(d)]} of ${Game.month(d)} ${Game.season(d)}, ${Game.year(d)}`; },

  drawStatus(d = g.day){ // Draws the status bar and included items
    $('header .day').html(Game.date(d));
    return drawCargo();
  },

  drawList(items, draw){
    if (items.length) {
      return `<tr>${items.map(draw).join("</tr><tr>")}</tr>`;
    } else { return ''; }
  },

  drawEffects(e){
    const text = [];

    const effectFuncs = {
      reputation(place, amount){ return amount + ' rep'; },
      xp(person, amount){ return amount + 'xp for ' + person; }
    };

    for (let key in e) {
      const results = e[key];
      if (typeof results === 'number') {
        text.push(`${Math.round(results)} ${key}`);
      } else {
        for (let name in results) {
          const amount = results[name];
          if (amount) {
            text.push(effectFuncs[key](name, amount));
          }
        }
      }
    }
    return text.join('<br>\n');
  },

  showOverlay(element, duration = 0, c = 'overlay', done){
    const overlay = $(`<div class='${c}'></div>`).css('opacity', 0).append(element);
    $('#container').append(overlay);
    if (duration) {
      const fadeOut = () => overlay.animate({opacity: 0}, duration / 2, () => overlay.remove());
      return overlay
        .animate({opacity: 1}, duration / 2)
        .delay(duration / 2)
        // Dummy animation so we can trigger the callback after delay, rather than waiting for the overlay to entirely fade out
        .animate({opacity: 1}, 1, function() {
          if (done) { return done(fadeOut); } else { return fadeOut(); }
      });

    } else {
      return overlay.animate({opacity: 1}, 500);
    }
  },

  showPassDayOverlay(day, result, next){
    Game.drawStatus(day);
    if (g.nextDayDescription) {
      result += '<br>' + g.nextDayDescription;
    }
    return Game.showOverlay(`<h1>${Game.date(day)}</h1><h3>${result}</h3>`, 2000, 'dayOverlay', next);
  },

  animateSuccess(element){
    return $(element).animate({opacity: 1}, 500).animate({opacity: 0}, 1500, showOverview);
  }
});

// Autosave every time a day passes
const oldPassDay = Game.passDay;
Game.passDay = function() {
  oldPassDay();

  const end = gameIsOver();
  if (end) {
    displayStory(end.required);
    g.history[end.required] = g.day;
    return;
  }

  return setTimeout(function() {
    if (localStorage.autosave !== localStorage.autosave0) {
      delete localStorage[localStorage.autosave];
    }
    autosaveGame();

    if ((g.day % 20) === 0) {
      delete localStorage[localStorage.autosave60];
      localStorage.autosave60 = localStorage.autosave40;
      localStorage.autosave40 = localStorage.autosave20;
      localStorage.autosave20 = localStorage.autosave0;
      return localStorage.autosave0 = localStorage.autosave;
    }
  }
  , 0);
};

export function autosaveGame() {
  const now = Date.now();
  localStorage.setItem(now, yaml.safeDump(g));
  localStorage.autosave = now;
}
