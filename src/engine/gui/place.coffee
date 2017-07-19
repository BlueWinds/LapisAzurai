$.extend Place, {
  drawMap: (interactive = true)->
    $('#PathLayer path').hide()
    $('#MapMask').children('circle, ellipse').attr('fill', 'none')
    $('#LabelLayer g').hide()

    places = for place, r of g.reputation
      $('#' + place).show().animate {opacity: 1}, 200
      $('#' + place + 'Mask').attr('fill', 'url(#maskBlur)')
      if interactive
        Place.draw(place)
    $('#places').empty().append places.join('')

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
    Place.drawMap(false)
    events = Place.travelEvents(to)
    Place.animateEvent(to, events)

  animateEvent: (to, events)->
    event = events.shift()
    unless event
      g.location = to
      return Place.drawMap()

    Game.passDay()
    Game.drawStatus()
    if event.location then g.location = event.location
    dayDuration = 2000

    if event.startTravel
      destination = g.distance + event.startTravel
      Place.animateLocation(destination, event.travelDays * dayDuration)
      g.distance = destination

    Game.showOverlay(event.image, dayDuration, 'travelOverlay')
    setTimeout Place.animateEvent.bind(null, to, events), dayDuration

  animateLocation: (toDistance, duration)->
    ship = document.getElementById('Ship')
    path = document.getElementById(g.location)

    $({distance: g.distance})
    .animate({distance: toDistance}, {
      duration: duration
      easing: 'linear'
      step: (now)->
        pos = path.getPointAtLength(now)
        ship.attributes.x.value = pos.x
        ship.attributes.y.value = pos.y
    })
}
