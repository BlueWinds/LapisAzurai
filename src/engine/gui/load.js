/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * DS205: Consider reworking code to avoid use of IIFEs
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
import yaml from 'js-yaml';
import $ from 'jquery';

import Game from 'game/Game';
import {load} from 'gui/game';
import {hideOverview} from 'gui/place';
import {forwardSection, render} from 'gui/story';

const autosaves = [
  localStorage.autosave,
  localStorage.autosave0,
  localStorage.autosave20,
  localStorage.autosave40,
  localStorage.autosave60
];

export var Load = {
  label: 'Load',
  text() {
    const rows = (() => {
      const result = [];
      for (let key of Object.keys(localStorage).sort().reverse()) {
        var game;
        const date = new Date(parseInt(key, 10));
        if (!date.getTime()) { continue; }
        try {
          game = yaml.safeLoad(localStorage[key]);
        } catch (e) {
          continue;
        }

        if (!game.map) { continue; }

        let blob = new Blob([localStorage[key]], {type: 'text/plain'});
        blob = URL.createObjectURL(blob);

        let name = `${game.chapter} - Day ${game.day} - ${game.map.from}`;
        if (autosaves.includes(key)) { name += ' (auto)'; }

        const row = [
          name,
          `${date.toLocaleString().replace(/:\d+( | $)/, ' ')}`,
          `<button class="load">Load</button>
<a class="export" download="${name}.yaml" href="${blob}">Export</a>
<button class="delete">Delete</button>`
        ].join('</td><td>');
        result.push(`<tr game='${key}'><td>` + row + '</td></tr>');
      }
      return result;
    })();

    const table = `<table class="load-game">
  <tr><td colspan="3"><input type="file"></td></tr>
  ${rows.join("\n")}
</table>`.replace(/\n/g, '');

    return `|| class="screen load"
${table}\
`;
  }
};

export var showLoadPage = function() {
  hideOverview();
  const elements = render('Load');
  $('#content').css({display: 'block'}).animate({opacity: 1}, 300);
  $('#stories').empty().append(elements);
  forwardSection(elements.first(), 1);

  $('#stories input').change(function() {
    let file;
    if (!(file = this.files[0])) {
      return;
    }
    const reader = new FileReader();
    reader.onload = () => {
      $('.import-error').remove();
      try {
        load(yaml.safeLoad(reader.result));
      } catch (e) {
        console.log(e);
        const error = $('<tr class="import-error danger"><td colspan="3">That doesn\'t seem to be a valid save file.</td></tr>');
        $(this).parent().parent().after(error);
        error.css('opacity', 0).animate({opacity: 1}, 1000);
        error.animate({opacity: 0}, 2500);
      }
    };

    return reader.readAsText(file);
  });

  return $('#stories button').click(function() {
    const row = $(this).closest('tr');
    const key = row.attr('game');

    if ($(this).html() === 'Delete') {
      delete localStorage[key];
      row.remove();
    } else if ($(this).html() === 'Export') {
      // pass
    } else {
      load(yaml.safeLoad(localStorage[key]));
    }
    return false;
  });
};
