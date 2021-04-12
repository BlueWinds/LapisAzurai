/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * DS205: Consider reworking code to avoid use of IIFEs
 * DS207: Consider shorter variations of null checks
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
let data, person, place, story, xp;
import './EventGraph.html';

import d3 from 'd3';
import $ from 'jquery';

import ignore from 'gui/game';
import {expirationDate, reputationNeeded, storiesAt} from 'game/Story';
import {sumObject} from 'game/util';

import * as content from 'content';
import * as places from 'content/places';
import * as travelData from 'content/travel';
import people from 'content/people';

const mainCharacters = [];
for (person in people) {
  if (people[person].skills) { mainCharacters.push(person); }
}

const byChapter = {};
const xpByChapter = {};
for (story in content) {
  data = content[story];

  if (data.where) {
    let chapter;
    [place, chapter = 'Any'] = data.where.split('|');
    if (chapter === 'delay') { chapter = 'Any'; }
    if (!byChapter[chapter]) { byChapter[chapter] = []; }
    byChapter[chapter].push(story);

    if (data.effects != null ? data.effects.xp : undefined) {
      for (person in data.effects.xp) {
        xp = data.effects.xp[person];
        if (!xpByChapter[chapter]) { xpByChapter[chapter] = {}; }
        if (!xpByChapter[chapter][person]) { xpByChapter[chapter][person] = 0; }
        xpByChapter[chapter][person] += xp;
      }
    }
  }
}

byChapter.Ch2.push('Ch2');
byChapter.Ch3.push('Ch3');
byChapter.Ch3.push('AsaraCh3Yes');
byChapter.Ch3.push('KatCh3Yes');
byChapter.Ch3.push('JamesCh3Yes');

const placeColors = d3.scale.category20();
const requiredColors = d3.scale.category10();
const _classColors = d3.scale.category10();
const characterColors = d3.scale.category10();
const linkColors = d3.scale.category10();

$(function() {
  const width = $(document).width();
  const height = $(document).height();

  window.svg = d3.select('body').append('svg')
    .attr('width', width)
    .attr('height', height);

  window.defs = window.svg.append('defs');
  return window.drawEvents();
});

window.drawEvents = function(chapter) {
  chapter = setHash(chapter, null)[0];
  makeColorExplanations(chapter);

  let links = [];
  const nodes = {};

  for (place in places) {
    for (story of storiesAt(place, chapter)) {
      places[story] = place;
    }
  }

  for (story of byChapter[chapter]) {
    nodes[story] = {
      name: story,
      location: content[story].where.split('|')[0],
      expires: (expirationDate(story) || '').toString()
    };

    const h = content[story].history;
    for (let link in h) {
      // "backwards" so that the arrows point in an intuitive direction
      links.push({source: link, target: story});
    }
  }

  links = links.filter(function(link) {
    if (!nodes[link.source]) {
      // Don't warn that Ch2/Ch3's prereqs are missing when viewing that chapter (they're just hidden, because they belong to the previous chapter).
      if ((link.target !== chapter) && !link.target.match(chapter + 'Yes')) {
        console.log('Missing source', link.source);
      }

      return false;
    }

    link.source = nodes[link.source];
    link.target = nodes[link.target];
    return true;
  });


  const force = d3.layout.force()
    .nodes(d3.values(nodes))
    .links(links)
    .size([$(document).width(), $(document).height()])
    .linkDistance(60)
    .charge(-300);

  d3.selectAll('svg > g').remove();

  const getLinkGroup = function(l){
    story = l.target.name;
    const group = content[story].requiredGroup || (content[story].required ? 'Required' : 'Normal');
    return group;
  };

  window.path = window.svg.append('g').selectAll('path')
    .data(force.links())
    .enter()
    .append('path')
      .attr('class', 'link')
      .attr('stroke', l => getLinkColor(getLinkGroup(l)))
      .attr('stroke-dasharray', function(l){ if (content[l.target.name].blocking) { return '7,3'; } else { return null; } })
      .attr('marker-end', l => 'url(#' + getLinkGroup(l) + ')');

  window.circle = window.svg.append('g').selectAll('circle')
    .data(force.nodes())
    .enter()
    .append('a')
    .attr('target', 'dump')
    .attr('href', d => './EventDump.html#' + d.name)
    .append('circle')
      .attr('r', 7)
      .call(force.drag);

  const names = window.svg.append('g').selectAll('text')
      .data(force.nodes())
      .enter()
      .append('text')
        .attr('x', 12)
        .attr('y', '.31em')
        .text(d => d.name);

  const expires = window.svg.append('g').selectAll('text')
      .data(force.nodes())
    .enter().append('text')
      .text(d => d.expires)
      .attr('x', 0)
      .attr('y', '-1em')
      .attr('text-anchor', 'middle');

  window.recolor();

  const linkArc = function(d){
    const dr = 0;
    return 'M' + d.source.x + ',' + d.source.y + 'A' + dr + ',' + dr + ' 0 0,1 ' + d.target.x + ',' + d.target.y;
  };

  const transform = d => 'translate(' + d.x + ',' + d.y + ')';

  const tick = function() {
    window.path.attr('d', linkArc);
    window.circle.attr('transform', transform);
    names.attr('transform', transform);
    return expires.attr('transform', transform);
  };

  return force
    .on('tick', tick)
    .start();
};

var makeColorExplanations = function(chapter){
  $('.links, .colorBy').empty();

  $('<div><span class="solid"> Normal</div>').css('color', '#aaa').appendTo('.links');
  $('<div><span class="dashed"> Blocking</div>').css('color', '#aaa').appendTo('.links');
  $('<div><span class="solid"> Required</div>').css('color', linkColors('Required')).appendTo('.links');

  $('<div>None</div>').css('color', '#aaa').appendTo('.required');

  // Per-type markers, as they don't inherit styles.
  window.defs.selectAll('marker')
    .data(linkColors.domain().concat('Normal'))
  .enter().append('marker')
    .attr('id', l => l)
    .attr('viewBox', '0 -5 10 10')
    .attr('refX', 15)
    .attr('refY', -1.5)
    .attr('markerWidth', 6)
    .attr('markerHeight', 6)
    .attr('orient', 'auto')
    .attr('fill', getLinkColor)
  .append('path')
    .attr('d', 'M0,-5L10,0L0,5');

  addPlaceColors(chapter);
  addStoryColors(chapter);
  return addCharacterColors(chapter);
};

var addPlaceColors = chapter => (() => {
  const result = [];
  for (place in places) {
    const rep = sumObject(storiesAt(place, chapter).map(reputationNeeded));
    if (rep) {
      result.push($('<div>' + place + ' - ' + rep + '</div>')
        .css('color', placeColors(place))
        .appendTo('.colorBy.places')
        .attr('place', place)
        .on('click', function() { return window.recolor('places', $(this).attr('place')); }));
    } else {
      result.push(undefined);
    }
  }
  return result;
})();

var addStoryColors = function() {
  for (story in content) {
    const {
      required
    } = content[story];
    if (required && !$('.' + required).length) {
      $('<div class="' + required + '">' + required + '</div>').css('color', requiredColors(required)).appendTo('.colorBy.required');
    }

    const {
      _class
    } = content[story];
    if (_class && !$('.' + _class).length) {
      $('<div class="' + _class + '">' + _class + '</div>').css('color', _classColors(_class)).appendTo('.colorBy._class');
    }

    const {
      requiredGroup
    } = content[story];
    if (requiredGroup && !$('.' + requiredGroup).length) {
      $('<div class="' + requiredGroup + '"><span class="solid"></span> ' + requiredGroup + '</div>').css('color', linkColors(requiredGroup)).appendTo('.links');
    }
  }

  return (() => {
    const result = [];
    for (let type in travelData) {
      result.push($('<div>' + type + '</div>')
        .css('color', placeColors(type))
        .appendTo('.colorBy.places')
        .attr('place', type)
        .on('click', function() { return window.recolor('places', $(this).attr('place')); }));
    }
    return result;
  })();
};

var addCharacterColors = chapter => (() => {
  const result = [];
  for (var p1 of mainCharacters) {
    $('<div>' + p1 + ' - ' + xpByChapter[chapter][p1] + '</div>').css('color', characterColors(p1)).appendTo('.colorBy.characters');
    result.push((() => {
      const result1 = [];
      for (let p2 of mainCharacters) {
      // Define the gradient
        const gradient = window.defs.append('svg:linearGradient')
          .attr('id', p1 + '_' + p2)
          .attr('x1', 0).attr('x2', 1)
          .attr('y1', 0).attr('y2', 0);

        // Define the gradient colors
        gradient.append('svg:stop')
          .attr('offset', '50%')
          .attr('stop-color', characterColors(p1));

        result1.push(gradient.append('svg:stop')
          .attr('offset', '50%')
          .attr('stop-color', characterColors(p2)));
      }
      return result1;
    })());
  }
  return result;
})();

var getLinkColor = function(group){ if (group === 'Normal') { return '#aaa'; } else { return linkColors(group); } };

window.recolor = function(colorBy, category){
  let ignore;
  [ignore, colorBy, category] = setHash(null, colorBy, category);

  $('.colorBy').hide();
  $('.' + colorBy).show();

  const colorize = {
    places(d){
      if (!category || (category === places[d.name])) {
        return placeColors(places[d.name]);
      }
    },
    required(d){
      const {
        required
      } = content[d.name];
      if (required) { return requiredColors(required); }
    },
    characters(d){
      if (content[d.name].effects != null ? content[d.name].effects.xp : undefined) {
        ({
          xp
        } = content[d.name].effects);
        const c = Object.keys(xp).sort().reverse();
        const gradient = c[0] + '_' + (c[1] || c[0]);
        return 'url(#' + gradient + ')';
      }
    },
    _class(d){
      const {
        _class
      } = content[d.name];
      if (_class) { return _classColors(_class); }
    }
  };
  return window.circle.attr('fill', d => (typeof colorize[colorBy] === 'function' ? colorize[colorBy](d) : undefined) || '#aaa');
};

var setHash = function(chapter, colorBy, category){
  const split = window.location.hash.substr(1).split('|');

  if (!chapter) { chapter = split[0] || 'Ch1'; }
  if (!colorBy) { colorBy = split[1] || 'places'; }
  if (!category) { category = split[2] || ''; }

  if (category === split[2]) { category = ''; }

  window.location.hash = '#' + chapter + '|' + colorBy + '|' + category;
  return [chapter, colorBy, category];
};
