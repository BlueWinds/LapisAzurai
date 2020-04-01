import './EventGraph.html'

import d3 from 'd3'
import $ from 'jquery'

import Person from 'game/Person'
import {direction} from 'game/Place'
import {expirationDate, reputationNeeded, storiesAt} from 'game/Story'
import {sumObject} from 'game/util'

import * as content from 'content'
import * as places from 'content/places'
import * as travelData from 'content/travel'
import people from 'content/people'

mainCharacters = []
for person of people
  if people[person].skills then mainCharacters.push(person)

byChapter = {}
xpByChapter = {}
for story of content
  data = content[story]

  if data.where
    [place, chapter = 'Any'] = data.where.split('|')
    if chapter is 'delay' then chapter = 'Any'
    byChapter[chapter] or= []
    byChapter[chapter].push(story)

    if data.effects?.xp
      for person, xp of data.effects.xp
        xpByChapter[chapter] or= {}
        xpByChapter[chapter][person] or= 0
        xpByChapter[chapter][person] += xp

byChapter.Ch2.push('Ch2')
byChapter.Ch3.push('Ch3')
byChapter.Ch3.push('AsaraCh3Yes')
byChapter.Ch3.push('KatCh3Yes')
byChapter.Ch3.push('JamesCh3Yes')

placeColors = d3.scale.category20()
requiredColors = d3.scale.category10()
_classColors = d3.scale.category10()
characterColors = d3.scale.category10()
linkColors = d3.scale.category10()

$(->
  width = $(document).width()
  height = $(document).height()

  window.svg = d3.select('body').append('svg')
    .attr('width', width)
    .attr('height', height)

  window.defs = svg.append('defs')
  drawEvents()
)

window.drawEvents = (chapter) ->
  chapter = setHash(chapter, null)[0]
  makeColorExplanations(chapter)

  links = []
  nodes = {}

  for place of places
    for story in storiesAt(place, chapter)
      places[story] = place

  for story in byChapter[chapter]
    nodes[story] = {
      name: story
      location: content[story].where.split('|')[0]
      expires: (expirationDate(story) or '').toString()
    }

    h = content[story].history
    for link of h
      # "backwards" so that the arrows point in an intuitive direction
      links.push({source: link, target: story})

  links = links.filter((link) ->
    unless nodes[link.source]
      # Don't warn that Ch2/Ch3's prereqs are missing when viewing that chapter (they're just hidden, because they belong to the previous chapter).
      unless link.target is chapter or link.target.match(chapter + 'Yes')
        console.log('Missing source', link.source)

      return false

    link.source = nodes[link.source]
    link.target = nodes[link.target]
    return true
  )


  force = d3.layout.force()
    .nodes(d3.values(nodes))
    .links(links)
    .size([$(document).width(), $(document).height()])
    .linkDistance(60)
    .charge(-300)

  d3.selectAll('svg > g').remove()

  getLinkGroup = (l)->
    story = l.target.name
    group = content[story].requiredGroup or (if content[story].required then 'Required' else 'Normal')
    return group

  window.path = svg.append('g').selectAll('path')
    .data(force.links())
    .enter()
    .append('path')
      .attr('class', 'link')
      .attr('stroke', (l)-> getLinkColor(getLinkGroup(l)))
      .attr('stroke-dasharray', (l)-> if content[l.target.name].blocking then '7,3' else null)
      .attr('marker-end', (l)-> 'url(#' + getLinkGroup(l) + ')')

  window.circle = svg.append('g').selectAll('circle')
    .data(force.nodes())
    .enter()
    .append('a')
    .attr('target', 'dump')
    .attr('href', (d)-> './EventDump.html#' + d.name)
    .append('circle')
      .attr('r', 7)
      .call(force.drag)

  names = svg.append('g').selectAll('text')
      .data(force.nodes())
      .enter()
      .append('text')
        .attr('x', 12)
        .attr('y', '.31em')
        .text((d)-> d.name)

  expires = svg.append('g').selectAll('text')
      .data(force.nodes())
    .enter().append('text')
      .text((d)-> d.expires)
      .attr('x', 0)
      .attr('y', '-1em')
      .attr('text-anchor', 'middle')

  recolor()

  linkArc = (d)->
    dx = d.target.x - d.source.x
    dy = d.target.y - d.source.y
    dr = 0
    return 'M' + d.source.x + ',' + d.source.y + 'A' + dr + ',' + dr + ' 0 0,1 ' + d.target.x + ',' + d.target.y

  transform = (d)-> 'translate(' + d.x + ',' + d.y + ')'

  tick = ->
    path.attr('d', linkArc)
    circle.attr('transform', transform)
    names.attr('transform', transform)
    expires.attr('transform', transform)

  force
    .on('tick', tick)
    .start()

makeColorExplanations = (chapter)->
  $('.links, .colorBy').empty()

  $('<div><span class="solid"> Normal</div>').css('color', '#aaa').appendTo('.links')
  $('<div><span class="dashed"> Blocking</div>').css('color', '#aaa').appendTo('.links')
  $('<div><span class="solid"> Required</div>').css('color', linkColors('Required')).appendTo('.links')

  $('<div>None</div>').css('color', '#aaa').appendTo('.required')

  # Per-type markers, as they don't inherit styles.
  defs.selectAll('marker')
    .data(linkColors.domain().concat('Normal'))
  .enter().append('marker')
    .attr('id', (l)-> l)
    .attr('viewBox', '0 -5 10 10')
    .attr('refX', 15)
    .attr('refY', -1.5)
    .attr('markerWidth', 6)
    .attr('markerHeight', 6)
    .attr('orient', 'auto')
    .attr('fill', getLinkColor)
  .append('path')
    .attr('d', 'M0,-5L10,0L0,5')

  addPlaceColors(chapter)
  addStoryColors(chapter)
  addCharacterColors(chapter)

addPlaceColors = (chapter)->
  for place of places
    rep = sumObject(storiesAt(place, chapter).map(reputationNeeded))
    if rep
      $('<div>' + place + ' - ' + rep + '</div>')
        .css('color', placeColors(place))
        .appendTo('.colorBy.places')
        .attr('place', place)
        .on('click', -> recolor('places', $(@).attr('place')))

addStoryColors = ->
  for story of content
    required = content[story].required
    if required and not $('.' + required).length
      $('<div class="' + required + '">' + required + '</div>').css('color', requiredColors(required)).appendTo('.colorBy.required')

    _class = content[story]._class
    if _class and not $('.' + _class).length
      $('<div class="' + _class + '">' + _class + '</div>').css('color', _classColors(_class)).appendTo('.colorBy._class')

    requiredGroup = content[story].requiredGroup
    if requiredGroup and not $('.' + requiredGroup).length
      $('<div class="' + requiredGroup + '"><span class="solid"></span> ' + requiredGroup + '</div>').css('color', linkColors(requiredGroup)).appendTo('.links')

  for type of travelData
    $('<div>' + type + '</div>')
      .css('color', placeColors(type))
      .appendTo('.colorBy.places')
      .attr('place', type)
      .on('click', -> recolor('places', $(@).attr('place')))

addCharacterColors = (chapter)->
  for p1 in mainCharacters
    $('<div>' + p1 + ' - ' + xpByChapter[chapter][p1] + '</div>').css('color', characterColors(p1)).appendTo('.colorBy.characters')
    for p2 in mainCharacters
      # Define the gradient
      gradient = defs.append('svg:linearGradient')
        .attr('id', p1 + '_' + p2)
        .attr('x1', 0).attr('x2', 1)
        .attr('y1', 0).attr('y2', 0)

      # Define the gradient colors
      gradient.append('svg:stop')
        .attr('offset', '50%')
        .attr('stop-color', characterColors(p1))

      gradient.append('svg:stop')
        .attr('offset', '50%')
        .attr('stop-color', characterColors(p2))

getLinkColor = (group)-> if group is 'Normal' then '#aaa' else linkColors(group)

window.recolor = (colorBy, category)->
  [ignore, colorBy, category] = setHash(null, colorBy, category)

  $('.colorBy').hide()
  $('.' + colorBy).show()

  colorize = {
    places: (d)->
      if not category or category is places[d.name]
        return placeColors(places[d.name])
    required: (d)->
      required = content[d.name].required
      if required then return requiredColors(required)
    characters: (d)->
      if content[d.name].effects?.xp
        xp = content[d.name].effects.xp
        c = Object.keys(xp).sort().reverse()
        gradient = c[0] + '_' + (c[1] or c[0])
        return 'url(#' + gradient + ')'
    _class: (d)->
      _class = content[d.name]._class
      if _class then return _classColors(_class)
  }
  circle.attr('fill', (d)-> (colorize[colorBy]?(d) or '#aaa'))

setHash = (chapter, colorBy, category)->
  split = window.location.hash.substr(1).split('|')

  unless chapter then chapter = split[0] or 'Ch1'
  unless colorBy then colorBy = split[1] or 'places'
  unless category then category = split[2] or ''

  if category is split[2] then category = ''

  window.location.hash = '#' + chapter + '|' + colorBy + '|' + category
  return [chapter, colorBy, category]
