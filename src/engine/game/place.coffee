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
  travel: {}
  delayChance: (travel)-> Place.travel[travel].delayDailyChance()
  delayDamage: (travel)->  Place.travel[travel].delayDailyDamage()
  delayDuration: (travel)-> Place.travel[travel].delayAvgDuration()

  repairRate: -> 10

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

  travelDays: (from, to)-> # Returns days between two locations, including indirect routes
    sumLength = (sum, e)->
      sum + Math.ceil(e.getTotalLength() / Game.travelPxPerDay(e.attributes.travel.value))
    return Place.travelSteps(from, to).map(Place.svgElement).reduce(sumLength, 0)

  travelSteps: (from, to)->
    if from is to then return []

    steps = []
    location = from
    loop
      if typeof Place[location].paths[to] is 'number'
        steps.push [location, to]
        break

      nextStop = Place[location].paths[to]
      steps.push [location, nextStop]
      location = nextStop
    return steps

  svgElement: ([from, to])->
    direction = Place[from].paths[to]
    unless typeof direction is 'number'
      throw new Error('No direct path from ' + from + ' to ' + to)

    string = if direction is 1 then (from + '_' + to) else (to + '_' + from)
    return document.getElementById(string)

  travelEvents: (from, to)->
    events = []
    for [stepFrom, stepTo] in Place.travelSteps(from, to)
      e = stepEvents(stepFrom, stepTo)
      events = events.concat(e)
    return events

  byDistance: (from)->
    return Object.keys(g.reputation).sort((p1, p2) ->
      Place.travelDays(from, p1) - Place.travelDays(from, p2)
    )
}

stepEvents = (from, to)->
  events = []
  path = Place.svgElement([from, to])
  travel = path.attributes.travel.value
  days = Place.travelDays(from, to)

  direction = if path.id.match(to + '_') then -1 else 1
  startPoint = (1 - direction) / 2 * path.getTotalLength()

  lastMoveStart = null
  # Use this division here rather than travelPxPerDay because path length won't be a perfect multiple and we want an exact value
  pxPerDay = path.getTotalLength() / days * direction

  for day in [0 ... days]
    if day and Math.random() < Place.delayChance(travel)
      delayE = delayEvents(travel)
      delayE[0].travelDays = delayE.length
      delayE[0].from = startPoint + day * pxPerDay
      delayE[0].to = delayE[0].from + pxPerDay
      delayE[0].path = path.id

      events = events.concat delayE
      events[events.length - 1]
      lastMoveStart = null
    else
      event = {image: Math.choice(Place.travel[travel].normalImages)}
      if lastMoveStart
        lastMoveStart.travelDays += 1
        lastMoveStart.to += pxPerDay
      else
        lastMoveStart = event
        event.travelDays = 1
        event.from = startPoint + day * pxPerDay
        event.to = event.from + pxPerDay
        event.path = path.id
      events.push event

  events[events.length - 1].image = Place[to].img
  return events

delayEvents = (travel)->
  for stormDay in [0 ... Math.ceil(Place.delayDuration(travel))]
    {
      image: Math.choice(Place.travel[travel].delayImages)
      effects: {damage: Place.delayDamage(travel)}
    }
