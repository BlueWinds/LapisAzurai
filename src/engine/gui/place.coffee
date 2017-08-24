$.extend Place, {
  guiSetup: ->
    # Set up draggable map
    map = $('#map')
    dragMap = $('#drag-map')

    # Center the map initially
    w = map.width()
    h = map.height()
    dX = 0
    dY = 0
    center = ->
      dX = (dragMap.width() - w) / 2
      dY = (dragMap.height() - h) / 2
      map.css('transform', "translate(#{dX}px, #{dY}px)")

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
      Place.showOverview(@id)
      return false

  drawMap: (interactive = true)->
    $('#PathLayer path').animate {opacity: 0}, 300, ->
      # Don't remove the attributes until after the animation is done to avoid an unpleasant flash
      $(@).removeAttr 'stroke-dasharray'
      .removeAttr 'stroke-dashoffset'
    $('#MapMask').children('circle, ellipse').attr('fill', 'none')
    $('#LabelLayer g').hide()

    for place of g.reputation
      $('#' + place).show().animate {opacity: 1}, 200
      $('#' + place + 'Mask').attr('fill', 'url(#maskBlur)')

    location = Place.location(g.location, g.distance)
    document.getElementById('Ship').attributes.x.value = location.x
    document.getElementById('Ship').attributes.y.value = location.y

  showOverview: (place = g.location)->
    o = $('#overview')
    Person.updateOverview()

    o.find('.place').replaceWith(Place.draw(place))
    $('.place img', o).click -> Place.hideOverview()


    unless o.hasClass('active')
      o.css({opacity: 0, display: 'block'})
      .stop().delay(100).animate({opacity: 1}, 400)
    o.addClass('active')

  hideOverview: (duration = 500)->
    $('.logo').removeClass('active')
    $('#overview').removeClass('active').stop().animate {opacity: 0}, duration, ->
      unless $('#overview').hasClass('active') then $('#overview').css('display', 'none')

  drawRepair: ->
    repair = Math.min(Place.repairRate(), g.damage)
    """<td class="story active repair" onclick="Place.clickRepair();">
      <div>
        <span class="label">Repair Ship</span>
        <span class="cost">#{Game.drawEffects({damage: -repair})}</span>
        <span class="success">✓</span>
      </div>
      <div class="damage">#{Math.round(g.damage - repair)} damage will remain</div>
    </td>"""

  clickRepair: (i)->
    Game.passDay()
    Game.applyEffects {damage: -Place.repairRate()}

    Game.showPassDayOverlay(undefined, 'Repaired the ship')
    $('.repair.active .success')
      .animate({opacity: 1}, 500)
      .animate {opacity: 0}, 1500, ->
        Place.drawMap()
        Place.showOverview()

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

    return """<div place="#{place}" class="place">
      <img src="game/content/#{Place[place].img}">
      #{travel}
      <div class="name">#{Place[place].name}</div>
      <div class="description">#{distanceDesc} - #{Math.floor(g.reputation[place])} reputation</div>
      <div class="table-wrapper"><table>
        #{Game.drawList clickableStories, Story.draw.bind(null, place)}
        #{if g.damage and g.location is place then Game.drawList [true], Place.drawRepair else ''}
        #{Game.drawList deliverable, Cargo.drawDelivery}
        #{Game.drawList available, Cargo.draw}
        #{Game.drawList visibleStories, Story.draw.bind(null, place)}
      </table></div>
    </div>"""

  animateTravel: (to)->
    Place.hideOverview()
    g.openMenu = ''
    Place.drawMap(false)
    events = Place.travelEvents(g.location, to)

    for event in events
      Game.passDay()
      if event.effects
        Game.applyEffects(event.effects)
    g.location = to
    Place.animateEvent(to, events)

  animateEvent: (to, events)->
    event = events.shift()
    unless event
      Game.drawStatus()
      return Place.drawMap()

    dayDuration = 2000

    if event.path
      Place.animateLocation(event, dayDuration)

    day = g.day - events.length
    effects = Game.drawEffects(event.effects or {}) + "<img src='game/content/#{event.image}'>"
    Game.showPassDayOverlay day, effects, (hideOverlay)->
      setTimeout hideOverlay, 500
      Place.animateEvent(to, events)

  animateLocation: (event, dayDuration)->
    ship = document.getElementById('Ship')
    path = document.getElementById(event.path)
    direction = event.to > event.from

    length = path.getTotalLength()
    path.setAttribute('stroke-dasharray', length)
    $(path).stop().css('opacity', 1)

    $({d: event.from}).animate({d: event.to}, {
      duration: dayDuration * event.travelDays
      easing: 'linear'
      step: (now)->
        pos = path.getPointAtLength(now)
        ship.setAttribute('x', pos.x)
        ship.setAttribute('y', pos.y)
        path.setAttribute('stroke-dashoffset', length * direction - now)
    })
}
