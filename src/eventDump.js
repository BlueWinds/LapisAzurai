/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * DS205: Consider reworking code to avoid use of IIFEs
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
import './EventDump.html';
import 'content/content.css';
import 'gui/game.css';

import $ from 'jquery';

import ignore from 'gui/game';
import {render} from 'gui/story';

import * as content from 'content';

window.g = {history: {}, people: {}, day: 100, chapter: 'Ch1'};

$( function() {
  const index = $('#index').empty();
  const w = $('#warnings').empty();
  const s = $('#stories').empty();

  const drawStory = function(story, {label, history, required, where}) {
    const link = '<a href="#' + story + '">' + story + '</a>';

    if (!label) {
      w.append('<li>' + link + ' is missing a label</li>');
    }

    for (let prereq in history) {
      const value = history[prereq];
      if ((value !== true) && (value !== false)) {
        w.append('<li>' + link + ' has a non-boolean history (' + prereq + ', ' + value + ').</li>');
      }
    }

    if (required && !content[required]) {
      w.append('<li>' + link + "'s Game Over story doesn't exist (" + required + ').</li>');
    }

    const sections = render(story);
    sections.each(function(i){
      $(this).attr('id', story + i);
      const i_link = '<a href="#' + story + i + '">' + story + '[' + i + ']</a>';
      const len = $(this).text().length;

      if ($(this).find('img').length && (len < 200)) {
        w.append('<li>' + i_link + ' has an image, but is only ' + len + ' characters long.</li>');
      }

      if (len > 2000) {
        w.append('<li>' + i_link + ' is ' + len + ' characters long, consider breaking it up.</li>');
      }

      return $(this).find('img').on('error', function() {
        return w.prepend('<li>' + i_link + ' wanted invalid image "' + decodeURI(this.src.split('content/')[1]) + '"</li>');
      });
    });

    places[where].append('<li>' + link + '</li>');
    s.append('<h1 id="' + story + '">' + label + ' (' + story + ') <a href="#">^</a></h1>');
    return s.append(sections);
  };

  var places = {};
  return (() => {
    const result = [];
    for (let story in content) {
      const data = content[story];
      if (data.text) {
        if (!places[data.where]) {
          index.append('<h2>' + (data.where || 'Nowhere').split('|').join(' - ') + '</h2>');
          places[data.where] = $('<div></div>').appendTo(index);
        }
        result.push(drawStory(story, data));
      }
    }
    return result;
  })();
});
