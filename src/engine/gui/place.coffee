$.extend Place, {
  guiSetup: ->
    # Set up draggable map
    map = $('#map')
    mapElements = $('#map, #places')
    dragMap = $('#drag-map')

    # Center the map initially
    w = map.width()
    h = map.height()
    dX = 0
    dY = 0
    center = ->
      dX = (dragMap.width() - w) / 2
      dY = (dragMap.height() - h) / 2
      mapElements.css('transform', "translate(#{dX}px, #{dY}px)")

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

        mapElements.css('transform', "translate(#{dX}px, #{dY}px)")
        lastE = e

    $(window).on 'mouseup touchend touchcancel', ->
      map.off('mousemove touchmove')

    $('#LabelLayer g').on 'click', ->
      showMenu(@id)
      return false

  drawMap: (interactive = true)->
    $('#PathLayer path').css {opacity: 0}
    $('#MapMask').children('circle, ellipse').attr('fill', 'none')
    $('#LabelLayer g').hide()

    places = for place, r of g.reputation
      $('#' + place).show().animate {opacity: 1}, 200
      $('#' + place + 'Mask').attr('fill', 'url(#maskBlur)')
      if interactive
        Place.draw(place)

    $('#places').empty().append places.join('')
    if g.openMenu
      showMenu(g.openMenu, 0)

    location = Place.location(g.location, g.distance)
    document.getElementById('Ship').attributes.x.value = location.x
    document.getElementById('Ship').attributes.y.value = location.y

  drawOverview: ->
    """<div class="places">
      <img src="game/content/#{Place[g.location].img}.jpg">
      #{Place.byDistance(g.location).map(Place.draw).join('\n')}
    </div>"""

  draw: (place)->
    location = Place.location(place)

    if g.location is place
      distanceDesc = 'Docked'
      travel = ''
    else
      distanceDesc = "#{Place.travelDays(g.location, place)} days sailing"
      disabled = if Story.canSail() then '' else 'disabled'
      travel = """<div class="travel #{disabled}" #{if disabled then '' else 'onclick="Place.animateTravel(\'' + place + '\');"'}>
        ⛵⇢
      </div>"""

    deliverable = g.cargo.filter (job)-> job.to is place
    available = g.availableCargo.filter (job)-> job.from is place
    visibleStories = Story.visibleStories(Place[place].stories[g.chapter])

    clickableStories = visibleStories.filter((s)-> not Story.unmetNeed(place, s))
    visibleStories = visibleStories.filter(Story.unmetNeed.bind(null, place))

    return """<div place="#{place}" class="place has-full" style="left: #{location.x}px; top: #{location.y}px;">
      #{travel}
      <div class="name">#{Place[place].name}</div>
      <div class="description">#{distanceDesc} - #{Math.floor(g.reputation[place])} reputation</div>
      <table>
        #{Game.drawList clickableStories, Story.draw.bind(null, place)}
        #{Game.drawList deliverable, Cargo.drawDelivery}
        #{Game.drawList available, Cargo.draw}
        #{Game.drawList visibleStories, Story.draw.bind(null, place)}
      </table>
    </div>"""

  animateTravel: (to)->
    g.openMenu = ''
    Place.drawMap(false)
    events = Place.travelEvents(to)

    for event in events
      Game.passDay()
    g.location = to
    Place.animateEvent(to, events)

  animateEvent: (to, events)->
    event = events.shift()
    unless event
      Game.drawStatus()
      return Place.drawMap()

    dayDuration = 2000

    if event.from?
      Place.animateLocation(event, dayDuration)

    Game.showOverlay("<img src='#{event.image}'>", dayDuration, 'travelOverlay')
    Game.showPassDayOverlay(g.day - events.length)
    Game.drawStatus(g.day - events.length)
    setTimeout Place.animateEvent.bind(null, to, events), dayDuration

  animateLocation: (event, dayDuration)->
    ship = document.getElementById('Ship')
    path = document.getElementById(event.path)

    $({d: event.from}).animate({d: event.to}, {
      duration: dayDuration * event.travelDays
      easing: 'linear'
      step: (now)->
        pos = path.getPointAtLength(now)
        ship.attributes.x.value = pos.x
        ship.attributes.y.value = pos.y
    })
}

showMenu = (place, showDuration = 200)->
  label = $('#' + place)
  placeDiv = $('[place="' + place + '"]')
  unless placeDiv.length then return false

  paths = $(Place.svgElements(place, g.location))
  $('[place]').not(placeDiv).stop().animate({to: 0}, {step: animateClip, duration: 200})

  placeDiv.stop().animate({to: placeDiv.outerHeight()}, {step: animateClip, duration: showDuration})
  label.stop().animate {opacity: 0}, showDuration
  paths.stop().animate {opacity: 1}, 200
  g.openMenu = place
  placeDiv.find('.name, .description').one 'click', ->
    if g.openMenu is place then g.openMenu = ''
    placeDiv.stop().animate({to: 0}, {step: animateClip, duration: 200})
    label.stop().animate {opacity: 1}, 200
    paths.stop().animate {opacity: 0}, 200


animateClip = (now, fx)->
  $(@).css('clip', 'rect(0px 500px ' + now + 'px 0)')
