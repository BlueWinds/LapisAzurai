sampleData =
  label: 'Explore Wilds'
  blocking: true # A blocking event prevents all other actions when the player is at that location. Will reduce their reputation to 0 if they wouldn't normally have enough to play an event.
  skills:
    Natalie: 'Captain'
  history:
    DeliciousFood: 5 # Must be at least 5 days in the past
    Chapter3: -10 # Must have occurred within the last 10 days
  experience:
    Natalie: 3
    James: 5
  text: -> """|| ...etc..."""

window.Story = {
  reputationNeeded: (story)-> if Story[story].blocking then 0 else 15

  skillNeeded: (story)->
    for skill, person of Story[story].skills
      unless g.people[person].skills[skill] then return [person, skill]
    return []

  visibleStories: (stories)->
    return stories.filter(Story.matchesHistory.bind(null, 0, 0))

  canSail: ->
    not Story.visibleStories(Place[g.location].stories[g.chapter]).some (p)-> Story[p].blocking

  matchesHistory: (foresight, extraTime, story)->
    if g.history[story]? then return false
    for key, value of Story[story].history
      unless g.history[key]? then return false
      if value > 0 and g.history[key] > g.day - (value - foresight) then return false
      if value < 0 and g.history[key] < g.day + (value - extraTime) then return false
    return true

  apply: (place, story)->
    for character, exp in Story[story].experience
      g.people[character].experience += exp
    g.reputation[place] -= Story.reputationNeeded(story)
    g.history[story] = g.day
    Game.passDay()
}
