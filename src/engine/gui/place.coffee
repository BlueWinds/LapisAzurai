$.extend Place, {
  drawMap: ->

    $('#PathLayer path').hide()
    $('#MapMask').children('circle, ellipse').attr('fill', 'none')
    $('#LabelLayer g').hide()
    places = for place, r of g.reputation
      $('#' + place).show().animate {opacity: 1}, 200
      $('#' + place + 'Mask').attr('fill', 'url(#maskBlur)')
      Place.draw(place)

    $('#places').empty().append places.join('')

    location = Place.location(g.location, g.distance)
    document.getElementById('Ship').attributes.x.value = location.x
    document.getElementById('Ship').attributes.y.value = location.y

  draw: (place)->
    location = Place.location(place)

    if g.location is place
      distanceDesc = 'Docked'
      travel = ''
    else
      distanceDesc = "#{Place.travelDays(g.location, place)} days"
      disabled = if Page.canSail() then '' else 'disabled'
      travel = """<div class="travel #{disabled}" #{if disabled then '' else 'onclick="Place.animateTravel(\'' + place + '\');"'}>
        ⛵⇢
      </div>"""

    deliverable = g.cargo.filter (job)-> job.to is place
    available = g.availableCargo.filter (job)-> job.from is place
    visiblePages = Page.visiblePages(Place[place].pages[g.chapter])


    return """<div place="#{place}" class="place has-full" style="left: #{location.x}px; top: #{location.y}px;">
      #{travel}
      <div class="name">#{Place[place].name}</div>
      <div class="description">#{distanceDesc} - #{Math.floor(g.reputation[place])} reputation</div>
      <table>
        #{Game.drawList deliverable, Cargo.drawDelivery}
        #{Game.drawList available, Cargo.draw}
        #{Game.drawList visiblePages, Page.draw.bind(null, place)}
      </table>
    </div>"""

  animateTravel: (to)->
    events = Place.travelEvents(to)
    Place.animateEvent(to, events)

  animateEvent: (to, events)->
    event = events.shift()
    unless event
      return drawMap()

    Game.passDay()
    Game.drawStatus()
    if event.location then g.location = event.location
    dayDuration = 500

    if event.startTravel
      Place.animateLocation(to, event.startTravel, event.travelDays * dayDuration)

  animateLocation: (to, toDistance, duration)->
    ship = document.getElementById('Ship')
    path = document.getElementById(g.location)

    $({distance: Place.distanceAlongPath(g.location, g.distance)})
    .animate({distance: toDistance}, {
      duration: duration,
      step: (now)->
        pos = path.getPointAtLength(now)
        ship.x = pos.x
        ship.y = pos.y
    })
}
