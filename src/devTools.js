import d3 from 'd3'
import $ from 'jquery'

import Person from 'game/Person'
import {direction} from 'game/Place'
import {expirationDate} from 'game/Story'

import * as content from 'content'
import * as places from 'content/places'
import * as travelData from 'content/travel'
import * as root from './index'

window.eventGraph = function() {
  var placeColors = d3.scale.category20()
  var requiredColors = d3.scale.category10()
  var _classColors = d3.scale.category10()
  var characterColors = d3.scale.category10()
  var linkColors = d3.scale.category10()

  $(function() {
    var width = $(document).width(),
        height = $(document).height()

    window.svg = d3.select("body").append("svg")
      .attr("width", width)
      .attr("height", height)

    window.defs = svg.append("defs")

    makeColorExplanations()
    drawEvents()
    console.log('hi')
  })

  window.drawEvents = function drawEvents(chapter) {
    chapter = setHash(chapter, null)[0]

    var links = []
    var nodes = {}

    window.places = {}
    Object.keys(places).forEach(function(place) {
      storiesAt(place, chapter).forEach(function(story) { places[story] = place })
    })

    for (var type in travelData) {
      storiesAt(type).forEach(historyInThisChapter)
      storiesAt(type, 'delay').forEach(historyInThisChapter)
    }

    function historyInThisChapter(story) {
      if (Object.keys(content[story].history || []).every(function(s) { return places[s] })) {
        places[story] = 'Sail'
      }
    }

    for (var key in content) {
      nodes[key] = {
        name: key,
        location: places[key],
        expires: (expirationDate(key) || '').toString()
      }
      var h = content[key].history
      for (var link in h) {
        // "backwards" so that the arrows point in an intuitive direction
        links.push({source: link, target: key})
      }
    }

    links = links.filter(function(link) {
      if (!nodes[link.source]) {
        // Don't warn that Ch2/Ch3's prereqs are missing when viewing that chapter (they're just hidden, because they belong to the previous chapter).
        if (link.target !== chapter) {
          console.log('Missing source', link.source)
        }
        return false
      }
      link.source = nodes[link.source]
      link.target = nodes[link.target]
      return true
    })

    var force = d3.layout.force()
      .nodes(d3.values(nodes))
      .links(links)
      .size([$(document).width(), $(document).height()])
      .linkDistance(60)
      .charge(-300)
      .on("tick", tick)
      .start()

    d3.selectAll("svg > g").remove()

    window.path = svg.append("g").selectAll("path")
      .data(force.links())
      .enter()
      .append("path")
        .attr("class", "link")
        .attr('stroke', function(l) { return getLinkColor(getLinkGroup(l)) })
        .attr('stroke-dasharray', function(l) { return content[l.target.name].blocking ? '7,3' : null })
        .attr("marker-end", function(l) { return 'url(#' + getLinkGroup(l) + ')' })

    window.circle = svg.append("g").selectAll("circle")
      .data(force.nodes())
      .enter()
      .append("a")
      .attr("target", "dump")
      .attr("href", function(d) { return "./EventDump.html#" + d.name})
      .append("circle")
        .attr("r", 7)
        .call(force.drag)

    var names = svg.append("g").selectAll("text")
        .data(force.nodes())
        .enter()
        .append("text")
          .attr("x", 12)
          .attr("y", ".31em")
          .text(function(d) { return d.name })

    var expires = svg.append("g").selectAll("text")
        .data(force.nodes())
      .enter().append("text")
        .text(function(d) { return d.expires })
        .attr("x", 0)
        .attr("y", "-1em")
        .attr("text-anchor", "middle")

    recolor()

    // Use elliptical arc path segments to doubly-encode directionality.
    function tick() {
      path.attr("d", linkArc)
      circle.attr("transform", transform)
      names.attr("transform", transform)
      expires.attr("transform", transform)
    }

    function linkArc(d) {
      var dx = d.target.x - d.source.x,
          dy = d.target.y - d.source.y,
          dr = 0
      return "M" + d.source.x + "," + d.source.y + "A" + dr + "," + dr + " 0 0,1 " + d.target.x + "," + d.target.y
    }

    function transform(d) {
      return "translate(" + d.x + "," + d.y + ")"
    }

    function getLinkGroup(l) {
      var story = l.target.name
      var group = content[story].requiredGroup || (content[story].required ? 'Required' : 'Normal')
      return group
    }
  }

  function makeColorExplanations() {
    $('.links, .colorBy').empty()

    $('<div><span class="solid"> Normal</div>').css('color', '#aaa').appendTo('.links')
    $('<div><span class="dashed"> Blocking</div>').css('color', '#aaa').appendTo('.links')
    $('<div><span class="solid"> Required</div>').css('color', linkColors('Required')).appendTo('.links')

    $('<div>None</div>').css('color', '#aaa').appendTo('.required')

    for (var place in places) {
      $('<div>' + place + '</div>').css('color', placeColors(place)).appendTo('.colorBy.places')
    }

    for (var story in content) {
      var required = content[story].required
      if (required && !$('.' + required).length) {
        $('<div class="' + required + '">' + required + '</div>').css('color', requiredColors(required)).appendTo('.colorBy.required')
      }

      var _class = content[story]._class
      if (_class && !$('.' + _class).length) {
        $('<div class="' + _class + '">' + _class + '</div>').css('color', _classColors(_class)).appendTo('.colorBy._class')
      }

      var requiredGroup = content[story].requiredGroup
      if (requiredGroup && !$('.' + requiredGroup).length) {
        $('<div class="' + requiredGroup + '"><span class="solid"></span> ' + requiredGroup + '</div>').css('color', linkColors(requiredGroup)).appendTo('.links')
      }
    }

    for (var type in travelData) {
      $('<div>' + type + '</div>').css('color', placeColors(type)).appendTo('.colorBy.places')
    }

    var people = []
    for (var person in Person) {
      if (!Person[person].skills) { continue }
      $('<div>' + person + '</div>').css('color', characterColors(person)).appendTo('.colorBy.characters')
      people.push(person)
    }

    people.forEach(function(p1) {
      people.forEach(function(p2) {
        // Define the gradient
        var gradient = defs.append("svg:linearGradient")
          .attr("id", p1 + '_' + p2)
          .attr("x1", 0).attr("x2", 1)
          .attr("y1", 0).attr("y2", 0)

        // Define the gradient colors
        gradient.append("svg:stop")
          .attr("offset", "50%")
          .attr("stop-color", characterColors(p1))

        gradient.append("svg:stop")
          .attr("offset", "50%")
          .attr("stop-color", characterColors(p2))
      })
    })

    // Per-type markers, as they don't inherit styles.
    defs.selectAll("marker")
      .data(linkColors.domain().concat('Normal'))
    .enter().append("marker")
      .attr("id", function(l) { return l })
      .attr("viewBox", "0 -5 10 10")
      .attr("refX", 15)
      .attr("refY", -1.5)
      .attr("markerWidth", 6)
      .attr("markerHeight", 6)
      .attr("orient", "auto")
      .attr('fill', function(group) { return getLinkColor(group) })
    .append("path")
      .attr("d", "M0,-5L10,0L0,5")

  }

  function getLinkColor(group) {
    return group === 'Normal' ? '#aaa' : linkColors(group)
  }

  window.recolor = function recolor(colorBy) {
    colorBy = setHash(null, colorBy)[1]

    setHash(null, colorBy)
    $('.colorBy').hide()
    $('.' + colorBy).show()

    circle.attr('fill', function(d) {
      if (colorBy === 'places') {
        return placeColors(places[d.name])
      }
      if (colorBy === 'required') {
        var required = content[d.name].required
        return required ? requiredColors(required) : '#aaa'
      }
      if (colorBy === 'characters') {
        if (!content[d.name].effects || !content[d.name].effects.xp) { return '#aaa' }
        var xp = content[d.name].effects.xp
        var c = Object.keys(xp).sort().reverse()
        var gradient = c[0] + '_' + (c[1] || c[0])
        return 'url(#' + gradient + ')'
      }
      if (colorBy === '_class') {
        var _class = content[d.name]._class
        return _class ? _classColors(_class) : '#aaa'
      }
    })
  }

  function setHash(chapter, colorBy) {
    var split = window.location.hash.substr(1).split('|')

    if (!chapter) { chapter = split[0] || 'Ch1' }
    if (!colorBy) { colorBy = split[1] || 'places' }

    window.location.hash = '#' + chapter + '|' + colorBy
    return [chapter, colorBy]
  }
}
