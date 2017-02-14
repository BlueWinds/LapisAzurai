sampleGame =
  version: 0
  day: 13
  chapter: 'Ch1'
  cargo: [
    {
      name: 'Fish Hooks'
      from: 'Vailia'
      to: 'Mt. Julia'
      start: 12 # Game day
    }
  ]
  location: 'Vailia' # Can also be a path name, VailiaMtJulia
  distance: 15 # 0 means at a location, 15 means 15px along the route, -15 means 15px along the route sailing "backwards."
  availableCargo: [] # As g.cargo
  reputation:
    Vailia: 0.95231
  people:
    Natalie:
      name: 'Natalie'
      experience: 100
      skills:
        Captain: true
        EarToTheGround: true
        EarToTheGround2: true
      color: ['tanned', 'none', 'green', 'ash', 'none', 'none']
  history:
    Intro: 0
    ExploreWilds: 1

window.Game =
  travelPxPerDay: (type)-> 15

  updates: [] # Update items are functions taking one argument, a game state.

  mostRecentGameData: ->
    last = Object.keys(localStorage).map((key) -> parseFloat(key) or 0).sort().pop()
    return if last
      jsyaml.safeLoad(localStorage[last])
    else
      $.extend(true, {}, Game.starting) # Game.starting is defined in content/intro.coffee

  start: (data)->
    window.g = data
    for i in [data.version ... Game.updates.length]
      Game.updates[i](data)
    data.version = Game.updates.length

  passDay: ->
    g.day++

    Cargo.passDay()
    Place.passDay()
