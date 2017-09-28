sampleData =
  label: 'Explore Wilds'
  blocking: true # A blocking event prevents all other actions when the player is at that location. Will reduce their reputation to 0 if they wouldn't normally have enough to play an event.
  required: true # If a required event is no longer available (timed out), show the game over screen.
  place: 'Vailia' # Used mostly to calculate how many days events should take to expire
  extraDays: 10 # Days added to the calculated expiration date, used to manually tweak balance
  skills:
    Natalie: 'Captain'
  history:
    DeliciousFood: 1 # Must have occurred
    Ch2: -1 # Event must not have occurred
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

  expirationDate: (story)->
    unless Story[story].history then return 0
    prereqsExpire = for key, value of Story[story].history
      Story.expirationDate(key) + Place.travelDays(Story[key].place, Story[story].place)
    timeAdded = (Story[story].extraDays or 0) + if Story[story].blocking then 7 else 20
    return Math.max.apply(null, prereqsExpire) + timeAdded

  matchesHistory: (onlyOnce, story)->
    if g.history[story]? and onlyOnce then return false
    if Story.expirationDate(story) < g.day and not Story[story].blocking then return false
    for key, value of Story[story].history
      if value and not g.history[key]? then return false
      if not value and g.history[key]? then return false
    return true

  matchesConditions: (story)->
    if (Story[story].minCargo or 0) > g.cargo.length then return false
    if (Story[story].maxCargo or 100) < g.cargo.length then return false
    if (Story[story].minDamage or 0) > g.damage then return false
    if (Story[story].maxDamage or 1000) < g.damage then return false
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
