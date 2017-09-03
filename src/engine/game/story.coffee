sampleData =
  label: 'Explore Wilds'
  blocking: true # A blocking event prevents all other actions when the player is at that location. Will reduce their reputation to 0 if they wouldn't normally have enough to play an event.
  required: true # If a required event is no longer available (timed out), show the game over screen.
  skills:
    Natalie: 'Captain'
  history:
    DeliciousFood: 10 # Must have occurred within the last 10 days
    Ch2: -1 # Event must have occurred, but not within any given timeframe.
  minCargo: 1 # Must have at least this much cargo aboard for the story to show
  maxCargo: 3 # Must have at most this much cargo aboard for the story to show
  effects:
    xp:
      Natalie: 3
      James: 5
  text: -> '''|| ...etc...'''

window.Story = {
  reputationNeeded: (story)-> if Story[story].blocking then 0 else 15

  skillNeeded: (story)->
    for skill, person of Story[story].skills
      unless g.people[person].skills[skill] then return [person, skill]
    return []

  visibleStories: (stories = [], onlyOnce = true)->
    return stories.filter(Story.matchesHistory.bind(null, onlyOnce)).filter(Story.matchesConditions)

  canSail: ->
    if g.damage then return false
    not Story.visibleStories(Place[g.map.from].stories[g.chapter]).some (p)-> Story[p].blocking

  daysUntilExpire: (story)->
    expires = Infinity
    for key, value of Story[story].history
      unless g.history[key]?
        return -Infinity
      if value isnt -1
        expires = Math.min(expires, g.history[key] + value - g.day)
    if expires < 0 and not g.history[story] then console.log story
    return expires

  matchesHistory: (onlyOnce, story)->
    if g.history[story]? and onlyOnce then return false
    if Story.daysUntilExpire(story) < 0 then return false
    return true

  matchesConditions: (story)->
    if (Story[story].minCargo or 0) > g.cargo.length then return false
    if (Story[story].maxCargo or 100) < g.cargo.length then return false
    return true

  unmetNeed: (place, story)->
    [skill, person] = Story.skillNeeded(story)
    need = if skill
      """#{person} needs #{Person[person].skills[skill].label}"""
    else if g.reputation[place] < Story.reputationNeeded(story)
      """Need #{Math.ceil(Story.reputationNeeded(story) - g.reputation[place])} more rep"""
    else ''

    return need

  effects: (story)-> JSON.parse(JSON.stringify(Story[story].effects or {}))

  apply: (place, story)->
    Game.applyEffects(Story.effects(story))
    if place
      g.reputation[place] -= Story.reputationNeeded(story)
    Story[story].apply?()
    g.history[story] = g.day
    Game.passDay()

  travelEvent: (from, to, type)->
    stories = Place.travel[type].stories.filter(Story.matchesConditions)

    return if blockingEvents(stories).length
      Math.choice(blockingEvents(stories))
    else if Place.travel[type].travelStoryOccurs()
      Math.choice(repeatableEvents(stories))
    else null

  delayEvent: (from, to, type)->
    stories = Place.travel[type].delayStories
    Math.choice(blockingEvents(stories)) or Math.choice(repeatableEvents(stories))
}

blockingEvents = (stories)-> Story.visibleStories(stories).filter((s)-> Story[s].blocking)
repeatableEvents = (stories)-> Story.visibleStories(stories, false).filter((s)-> not Story[s].blocking)
