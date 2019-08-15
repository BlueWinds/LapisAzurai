import $ from 'jquery'
import Game from 'game/Game'
import {currentCordinates, dailyTravel, pathSvg} from 'game/Place'
import {applyStory, expirationDate, storiesAt, visibleStories} from 'game/Story'

import {showOverview} from 'gui/place'
import {displayStory} from 'gui/story'
import mapSvg from 'content/Map.svg'
import mapImage from 'content/Map.png'

import * as content from 'content'

export mapGuiSetup = ->
  # Set up draggable map
  map = $('#map').html(mapSvg.replace(/<svg.+?>|<\/svg>/g, ''))
  dragMap = $('#drag-map')
  map.find('#MapLayer image').attr('xlink:href', mapImage)

  # Center the map initially
  {width: w, height: h} = $('#MapLayer')[0].getBBox()
  dX = 0
  dY = 0
  center = ->
    dX = (dragMap.width() - w) / 2
    dY = (dragMap.height() - h) / 2
    map.css('transform', "translate(#{dX}px, #{dY}px)")

  map.width(w).height(h)
  $(window).on 'resize', center
  center()

  map.on 'mousedown touchstart', (lastE)->
    map.on 'mousemove touchmove', (e)->
      if w > dragMap.width()
        dX += e.pageX - lastE.pageX
        dX = Math.min(0, Math.max(dX, dragMap.width() - w))

      if h > dragMap.height()
        dY += e.pageY - lastE.pageY
        dY = Math.min(0, Math.max(dY, dragMap.height() - h))

      map.css('transform', "translate(#{dX}px, #{dY}px)")
      lastE = e

  $(window).on 'mouseup touchend touchcancel', ->
    map.off('mousemove touchmove')

  $('#LabelLayer g').on 'click', ->
    if $('#LabelLayer').hasClass('interactive')
      showOverview(@id)
    return false

export drawMap = ->
  $('#LabelLayer').toggleClass('interactive', not g.map.to)
  $('#PathLayer path').animate {opacity: 0}, 300, ->
    # Don't remove the attributes until after the animation is done to avoid an unpleasant flash
    $(@).removeAttr 'stroke-dasharray'
    .removeAttr 'stroke-dashoffset'
  $('#MapMask').children('circle, ellipse').attr('fill', 'none')
  $('#LabelLayer g').hide()

  for place of g.reputation
    $('#' + place).show().animate {opacity: 1}, 200
    $('#' + place + 'Mask').attr('fill', 'url(#maskBlur)')
    updateLabel(place)

  location = currentCordinates(g.map)
  document.getElementById('Ship').attributes.x.value = location.x
  document.getElementById('Ship').attributes.y.value = location.y

export travel = ->
  unless g.map.to
    return

  event = dailyTravel(g.map)
  delete g.map.speedBonus

  if event.delay?
    g.map.delay = event.delay
    g.lastStorm = g.day

  g.map.distance += event.pxTravel
  if event.effects
    Game.applyEffects(event.effects)

  Game.drawStatus()
  animateTravel(event)
  Game.passDay()

  # We have arrived at the destination
  if event.pxTravel and (g.map.distance <= 0 or g.map.distance >= pathSvg().getTotalLength())
    g.map.from = g.map.to
    g.map.to = ''
    g.map.distance = 0
    g.map.delay = 0
    setTimeout (-> showOverview(g.map.from, 1000)), 3500

animateTravel = (event)->
  effects = Game.drawEffects(event.effects or {})
  if event.story
    g.lastTravelEvent = g.day
    applyStory(null, event.story)
    displayStory(event.story, 2000)
    Game.showPassDayOverlay g.day, effects
  else
    effects += "<img src='game/content/#{event.image}'>"
    Game.showPassDayOverlay g.day, effects, (hideOverlay)->
      setTimeout hideOverlay, 500
      unless event.story then travel()

  length = event.path.getTotalLength()
  ship = document.getElementById('Ship')
  event.path.setAttribute('stroke-dasharray', length)
  $(event.path).stop().css('opacity', 1)

  # Convert -1/1 to 0/1
  dashoffset = (event.direction + 1) / 2

  $({d: event.start}).animate({d: event.start + event.pxTravel}, {
    duration: 2000
    easing: 'linear'
    step: (now)->
      pos = event.path.getPointAtLength(now)
      ship.setAttribute('x', pos.x)
      ship.setAttribute('y', pos.y)
      event.path.setAttribute('stroke-dashoffset', length * dashoffset - now)
  })

updateLabel = (place)->
  span = $('#' + place + ' tspan').removeClass()

  if $('#LabelLayer').hasClass('interactive')
    visible = visibleStories(storiesAt(place, g.chapter))
    visible = visible.sort (a, b)->
      expirationDate(a) - expirationDate(b)
  else visible = []

  if visible[0]
    expiresClass = if content[visible[0]].required then 'required' else 'normal'

    span.show()
    span.children()
      .addClass(expiresClass)
      .addClass(content[visible[0]]._class)
      .text(expirationDate(visible[0]) -  g.day)
  else
    span.hide()

  box = $('#' + place + ' text').show()[0].getBBox()
  rect = $('#' + place + ' rect').show()[0]
  rect.setAttribute('x', box.x - 4)
  rect.setAttribute('y', box.y - 2)
  rect.setAttribute('width', box.width + 8)
  rect.setAttribute('height', box.height + 4)
