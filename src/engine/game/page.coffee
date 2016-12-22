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

window.Page = {
  reputationNeeded: (place)-> return 15

  skillNeeded: (page)->
    for skill, person of Page[page].skills
      unless g.people[person].skills[skill] then return [person, skill]
    return []

  visiblePages: (pages)->
    return pages.filter(Page.matchesHistory.bind(null, 0, 0))

  matchesHistory: (foresight, extraTime, page)->
    if g.history[page]? then return false
    for value, key of Page[page].history
      unless g.history[key]? then return false
      if value > 0 and g.history[key] > g.day - (value - foresight) then return false
      if value < 0 and g.history[key] < g.day + (value - extraTime) then return false
    return true

  apply: (place, page)->
    for character, exp in Page[page].experience
      g.people[character].experience += exp
    g.reputation[place] -= Page.reputationNeeded()
    g.history[page] = g.day
    g.backlog.push(page)
    g.passDay()
}
