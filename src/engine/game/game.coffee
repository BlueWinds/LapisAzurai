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
  map:
    from: 'Vailia' # Last port we docked in
    to: 'MtJulia' # If not empty, means we're currently traveling.
    distance: 15 # Where on the current path we are.
    delay: 0 # If there is an ongoing delay, how many more days it will last
  availableCargo: [] # As g.cargo
  reputation:
    Vailia: 0.95231
  people:
    Natalie:
      xp: 100
      skills:
        Captain: true
        EarToTheGround: true
        EarToTheGround2: true
  history:
    Intro: 0
    ExploreWilds: 1

window.Game =
  travelPxPerDay: (type)-> 15

  updates: [] # Functions taking one argument, a game state.

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

  applyEffects: (e)->
    for place, rep of (e.reputation or {})
      g.reputation[place] or= 0
      g.reputation[place] += rep
    for person, xp of (e.xp or {})
      g.people[person] or= {skills: {}, xp: 0}
      g.people[person].xp += xp
    if e.damage
      g.damage += e.damage
      g.damage = Math.max(0, g.damage)
    return

  passDay: ->
    g.day++

    Cargo.passDay()
