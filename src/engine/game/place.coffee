samplePlaceData =
  name: 'Mt Julia'
  paths:
    Vailia: -1 # -1: The path is ThereHere (it needs to be animated "in reverse")
    Alkenia: 1 # 1: The path goes HereThere (it is animated "forward")
    Tomenoi: 'Vailia' # A string: The path from here to Tomenoi goes to Vailia next
  goods:
    Vailia: [
      'Fish'
      'Silver'
      'Lumber'
    ]
  stories: [
    'ExploreWilds'
  ]

window.Place = {
  delayChance: -> 0.05

  delayDuration: -> Math.random() * 3 + 1

  decayReputation: (rep)->
    return rep * 0.95

  passDay: ->
    for place, reputation of g.reputation
      g.reputation[place] = Place.decayReputation(reputation)
    return

  location: (place, distance)->
    # A path
    if '_' in place
      len = Place.distanceAlongPath(place, distance)
      return element.getPointAtLength(len)

    # A port
    circle = document.getElementById(place).children[1]
    return {x: circle.cx.baseVal.value, y: circle.cy.baseVal.value}

  distanceAlongPath: (place, distance)->
    element = document.getElementById(place)
    return if distance >= 0 then distance else element.getTotalLength() + distance

  travelDays: (origin, destination)-> # Returns days between two locations, including indirect routes
    if origin is destination then return 0
    sumLength = (sum, e)->
      sum + Math.ceil(e.getTotalLength() / Game.travelPxPerDay(e.travel))
    return Place.svgElements(origin, destination).reduce(sumLength, 0)

  svgElements: (origin, destination)-> # Returns array of svg elements between two locations (direct or indirect route)
    location = origin
    paths = []
    if origin is destination then return

    getElement = (from, to, direction)->
      string = if direction is 1 then (from + '_' + to) else (to + '_' + from)
      document.getElementById(string)

    loop
      if typeof Place[location].paths[destination] is 'number'
        paths.push getElement(location, destination, Place[location].paths[destination])
        break

      nextStop = Place[location].paths[destination]
      paths.push getElement(location, nextStop, Place[location].paths[nextStop])
      location = nextStop

    return paths

  travelImages: (element, set)->
    Place.travelImages[element.attributes.travel.value][set]

  travelEvents: (to)->
    path = Place.svgElements(g.location, to)[0]
    days = Place.travelDays(g.location, to)

    direction = if path.id.match(to + '_') then -1 else 1
    startPoint = (1 - direction) / 2 * path.getTotalLength()

    lastMoveStart = null
    events = []
    # Use this division here rather than travelPxPerDay because path length won't be a perfect multiple and we want an exact value
    pxPerDay = path.getTotalLength() / days * direction

    for day in [0 ... days]
      if day and Math.random() < Place.delayChance()
        for stormDay in [0 ... Math.ceil(Place.delayDuration())]
          event = {image: Math.choice(Place.travelImages(path, 'delay'))}
          events.push event
        lastMoveStart = null

      event = {image: Math.choice(Place.travelImages(path, 'normal'))}
      if lastMoveStart
        lastMoveStart.travelDays += 1
        lastMoveStart.to += pxPerDay
      else
        lastMoveStart = event
        event.travelDays = 1
        event.from = startPoint + day * pxPerDay
        event.to = event.from + pxPerDay
        event.path = if direction > 0 then (g.location + '_' + to) else (to + '_' + g.location)
      events.push event
    return events

  byDistance: (origin)->
    return Object.keys(g.reputation).sort((p1, p2) ->
      Place.travelDays(origin, p1) - Place.travelDays(origin, p2)
    )
}
