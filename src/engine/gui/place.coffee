$.extend Place, {
  drawMap: ->

    $('#PathLayer path').hide()
    $('#MapMask').children('circle, ellipse').attr('fill', 'none')
    $('#LabelLayer g').hide()
    places = for place, r of g.reputation
      $('#' + place).show()
      $('#' + place + 'Mask').attr('fill', 'url(#maskBlur)')
      Place.draw(place)

    $('#places').empty().append places.join('')
  draw: (place)->
    location = Place.location(place)

    if g.location is place
      distanceClass = 'here'
      distanceDesc = 'Docked'
    else
      distanceClass = ''
      distanceDesc = "#{Place.travelDays(g.location, place)} days"

    deliverable = g.cargo.filter (job)-> job.to is place
    available = g.availableCargo.filter (job)-> job.from is place
    visiblePages = Page.visiblePages(Place[place].pages[g.chapter])

    return """<div place="#{place}" class="place has-full #{distanceClass}" style="left: #{location.x}px; top: #{location.y}px;">
      <div class="name">#{place}</div>
      <div class="description">#{distanceDesc} - #{Math.floor(g.reputation[place])} reputation</div>
      <table>
        #{Game.drawList deliverable, Cargo.drawDelivery}
        #{Game.drawList available, Cargo.draw}
        #{Game.drawList visiblePages, Page.draw.bind(null, place)}
      </table>
    </div>"""

  animateTravel: (to)->
    events = Place.travelEvents(to)
    Place.animateEvent(events)

  animateEvent: (events)->
    event = events.shift()
    unless event
      return drawMap()

    Game.passDay()
    Game.drawStatus()
    dayDuration = 500

    if event.startTravel
      Place.animateLocation(event.startTravel, event.travelDays * dayDuration)

  animateLocation: (toDistance, duration)->
    ship = document.getElementById('ship')

    $({distance: Place.distanceAlongPath(g.distance)})
    .animate({distance: toDistance}, {
      duration: duration,
      step: (now)->
        pos = path.getPointAtLength(now)
        ship.x = pos.x
        ship.y = pos.y
    })
}
