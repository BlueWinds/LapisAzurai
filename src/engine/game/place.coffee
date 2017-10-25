samplePlaceData =
  name: 'Mt. Julia'
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
  stories:
    Ch1: [
      'ExploreWilds'
    ]
  jobChance: 0.3

window.Place = {
  travel: {}

  repairEffects: ->
    e =
      damage: -Math.min(6 * (if g.reputation[g.map.from] > 0 then 1 else 0.5), g.damage)
      reputation: {}
    e.reputation[g.map.from] = -Math.min(1, g.reputation[g.map.from])
    return e

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
    unless from and to then return 0
    sumLength = (sum, e)->
      # Should be an error, but here for now so I can be lazy about drawing paths on the map.
      # TODO: remove the return
      unless e then return
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

  svgElement: ([from, to] = [g.map.from, g.map.to])->
    string = if Place.direction(from, to) is 1 then (from + '_' + to) else (to + '_' + from)
    return document.getElementById(string)

  travelEvent: (map)->
    path = Place.svgElement([map.from, map.to])
    travel = path.attributes.travel.value
    dir = Place.direction(map.from, map.to)

    pxPerDay = Game.travelPxPerDay(travel) * dir
    to = Math.clamp(map.distance + pxPerDay, 0, path.getTotalLength())

    event = {
      image: Math.choice(Place.travel[travel].normalImages)
      path: path
      start: map.distance
      direction: dir
      pxTravel: to - map.distance
      story: Story.travelEvent(map.from, map.to, travel)
    }

    if event.pxTravel isnt pxPerDay
      event.image = Place[map.to].img

    if map.delay or Place.travel[travel].delayOccurs(map.from, map.to, map.distance)
      duration = map.delay or Place.travel[travel].delayDuration(map.from, map.to, map.distance)

      event.image = Math.choice(Place.travel[travel].delayImages)
      event.delay = Math.max(0, duration - 1) # Subtract one day because this event already took up one of them
      event.effects = {damage: Place.travel[travel].delayDailyDamage(map.from, map.to, map.distance)}

      # If this is the first day of a delay, trigger an event
      unless map.delay
        event.story = Story.delayEvent(map.from, map.to, travel)

    return event

  direction: (from, to)->
    unless typeof Place[from].paths[to] is 'number'
      throw new Error('No direct path from ' + from + ' to ' + to)
    return Place[from].paths[to]
}
