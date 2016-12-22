samplePlaceData =
  name: "Mt Julia"
  paths:
    Vailia: -1 # -1: The path is ThereHere (it needs to be animated "in reverse")
    Alkenia: 1 # 1: The path goes HereThere (it is animated "forward")
    Tomenoi: "Vailia" # A string: The path from here to Tomenoi goes to Vailia next
  goods:
    Vailia: [
      "Fish"
      "Silver"
      "Lumber"
    ]
  pages: [
    'ExploreWilds'
  ]

window.Place = {
  delayChance: -> 0.1

  delayDuration: -> Math.random() * 5 + 1

  decayReputation: (rep)->
    return Math.floor(rep * 0.9)

  passDay: ->
    for place, reputation of g.reputation
      g.reputation[place] = Place.decayReputation(reputation)
    if g.distance
      sailDay()

  location: (place, distance)->
    # A path
    if '_' in place
      len = Place.distanceAlongPath(distance)
      return element.getPointAtLength(len)

    # A port
    circle = document.getElementById(place).children[0]
    return {x: circle.cx.baseVal.value, y: circle.cy.baseVal.value}

  distanceAlongPath: (distance)->
    element = document.getElementById(place)
    return if distance > 0 then distance else element.getTotalLength() + distance

  travelDays: (origin, destination)-> # Returns days between two locations, including indirect routes
    sumLength = (sum, e)->
      sum + Math.ceil(e.getTotalLength() / Game.travelPxPerDay(e.travel))
    return Place.svgElements(origin, destination).reduce(sumLength, 0)

  svgElements: (origin, destination)-> # Returns array of svg elements between two locations (direct or indirect route)
    location = Place[origin]
    paths = []

    getElement = (from, to, direction)->
      string = if direction is 1 then (from + '_' + to) else (to + '_' + from)
      document.getElementById(string)

    loop
      if location.paths[destination] instanceof Number
        paths.push getElement(location.name, destination, location.paths[destination])
        break

      nextStop = location.paths[destination]
      paths.push getElement(location.name, nextStop, location.paths[nextStop])
      location = Place[nextStop]

    return paths

  travelImages: (element, set)->
    Place.travelImages[element.travel][set]

  travelEvents: (to)->
    path = Place.svgElements(g.location, to)[0]
    days = Place.travelDays(g.location, to)

    lastMoveStart = null
    events = []
    # Use this division here rather than travelPxPerDay because path length won't be a perfect multiple and we want an exact value
    pxPerDay = path.getTotalLength() / days

    for day in [0 ... days]
      if Math.random() < Place.delayChance()
        for stormDay in [0 ... Math.ceil(Place.delayDuration())]
          event = {image: Math.choice(Place.travelImages(path, 'delay'))}
          dayEvents.push
        lastMoveStart = null
      else
        event = {image: Math.choice(Place.travelImages(path, 'normal'))}
        if lastMoveStart
          lastMoveStart.travelDays += 1
          lastMoveStart.startTravel += pxPerDay
        else
          lastMoveStart = event
          event.travelDays = 1
          event.startTravel = pxPerDay
        events.push event
    return events
}
