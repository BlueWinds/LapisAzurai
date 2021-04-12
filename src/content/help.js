/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * DS207: Consider shorter variations of null checks
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
import $ from 'jquery';

import Cargo from 'game/Cargo';
import Person from 'game/Person';
import {gameIsOver} from 'game/Story';

let queue = [];

var help = function (selector, text) {
  if (!g.showHelp) {
    return;
  }
  if ($('.help').length) {
    queue.push([selector, text]);
    return;
  }

  const element = $(`<div class='help'>
  <p>${text}</p>
</div>`);

  const target = $(selector).first();
  target.parent().append(element);

  const targetPos = target.offset();
  if (!targetPos) {
    console.error(selector, ' not found to point help towards');
    return;
  }
  targetPos.left += target.outerWidth() / 2 - element.outerWidth() / 2;

  const {bottom} = target[0].getBoundingClientRect();
  if (bottom + element.height() + 10 <= $(window).height()) {
    // There's space beneath the targeted element
    element.addClass('bottom');
    targetPos.top += target.outerHeight() + 10;
  } else {
    // No space, put it up top.
    element.addClass('top');
    targetPos.top -= $(element).outerHeight() + 10;
  }

  element.offset(targetPos);
  element.css('opacity', 0).animate({opacity: 1}, 200);
  return element.click(function () {
    element.animate({opacity: 0}, 200, function () {
      element.remove();
      const next = queue.shift();
      if (next) {
        return help(next[0], next[1]);
      }
    });
    return false;
  });
};

const clearHelp = function () {
  queue = [];
  return $('.help').remove();
};

const haventSailedYet = () => g.map.from === 'Vailia' && !g.map.to && !g.history.MtJuliaArrive;

const mapHelp = function () {
  if (gameIsOver()) {
    return;
  }
  if (g.history.MtJuliaArrive) {
    return;
  }

  return setTimeout(function () {
    if (g.history.Ch1 == null) {
      help(
        'header',
        "This is the world map, showing all the places you've discovered so far. Select Vailia to learn more about the port city."
      );
      return;
    }

    if (haventSailedYet()) {
      if (!g.cargo.length) {
        help(
          'header',
          "Before you set sail you'll need to find some cargo. This isn't normally required, but it's always a good idea."
        );
        return;
      }

      help(
        'header',
        'An orange number next to a location means a required event is available there, while black numbers shows an optional one.'
      );
      return help(
        'header',
        "The number of days remaining is absolute - it's usually best to advance the story as soon as possible, so you can see the next steps."
      );
    }
  }, 100);
};

export var enterMapHelp = function () {
  clearHelp();
  return mapHelp();
};

export var showOverviewHelp = function (place) {
  clearHelp();

  return setTimeout(function () {
    if (g.map.from === 'MtJulia' && g.history.MtJuliaArrive === g.day - 1 && place === 'MtJulia') {
      help('.cargoSearch', "The chance of finding work is halved if you don't have any reputation to spend.");
      help(
        '.cargoSearch',
        'Chances accumulate though - her odds will grow better the longer she keeps searching until she finds something.'
      );
      return;
    }

    if (skillHelp()) {
      return;
    }

    if (g.day === 0) {
      help(
        '.place .name',
        'On the left side you can see information about the location, while the right side has information about your characters. Clicking the image returns to the world map.'
      );

      help(
        '.place .description',
        'Natalie has a separate reputation at each port. You spend reputation to view events, repair damage after a storm and search the city for jobs.'
      );
      return;
    }

    if (firstVailiaHelp(place)) {
      return;
    }

    if (place === 'Vailia') {
      if (g.day === g.history.FirstStormSick2) {
        return help(
          '.repair',
          "The Lapis Azurai is damaged, and sailing is slowed until it's repaired. Calling in the necessary favors and purchasing supplies costs reputation as well as time."
        );
      }
    }
  }, 100);
};

var skillHelp = function () {
  if (noSkillSelected()) {
    if (Person.skillPoints('Natalie') === 1) {
      skillText('Natalie');
      return true;
    } else if (Person.skillPoints('James') === 1) {
      skillText('James');
      return true;
    }
  }
};

var skillText = (person) =>
  help(
    '[person="' + person + '"] .description',
    `${person} has enough experience to gain a new skill. Characters each have their specialty - James focuses on sailing and storms, while Natalie deals with cargo and reputation.`
  );

var firstVailiaHelp = function (place) {
  if (!haventSailedYet()) {
    return false;
  }
  if (!g.cargo.length && place === 'Vailia') {
    if (!g.availableCargo.length) {
      help(
        '.place .cargoSearch',
        "Natalie has contacts, but she doesn't have any cargo yet. She'll have to make new friends, speak with her old ones, and search the city for goods that need to be moved from Vailia to elsewhere."
      );

      help(
        '.place .cargoSearch .cost',
        "The chance of finding a job varies by port. Vailia's a busy city, so it'll be easy to find cargo here. With a chance above 100% she's guaranteed to find at least one job."
      );
      return true;
    }

    const c = g.availableCargo[0];
    help(
      '.cargo.accept',
      `Right now, someone in Vailia is willing to pay Natalie to deliver ${
        c.name
      } to Mount Julia. The job will disappear if she doesn't accept it in ${Cargo.acceptTimeRemaining(c)} days.`
    );

    help(
      '.cargo.accept .cost',
      `If she delivers the cargo before it expires, she'll gain ${c.reputation[0]} reputation at the origin and ${c.reputation[1]} at the destination. `
    );

    help(
      'header .cargo',
      "Natalie's ship can carry up to three loads at a time. Even if a job expires, you'll need to deliver the cargo to free up space."
    );
    return true;
  }

  if (place === 'MtJulia' && g.cargo.length) {
    help('.place .travel', 'It takes 9 days to travel from Vailia to Mt. Julia. Click the ship icon to set sail.');

    help(
      '[story="MtJuliaArrive"]',
      "You won't be able to catch every event on a given playthrough, so don't worry if you miss some with grey borders."
    );
    help('[story="MtJuliaArrive"]', 'Missing an orange event means game over though, so pay attention to those!');
    return true;
  }
};

var noSkillSelected = () =>
  Object.keys(g.people.Natalie.skills).length === 0 && Object.keys(g.people.James.skills).length === 0;

export var hideOverviewHelp = function () {
  clearHelp();
  return setTimeout(function () {
    if ($('#content').css('display') === 'none') {
      return mapHelp();
    }
  }, 0);
};

export var displayStoryHelp = () => clearHelp();
