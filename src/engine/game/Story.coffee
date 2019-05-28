import {choice} from 'game/util'
import Game from 'game/Game'
import Place from 'game/Place'

import * as content from 'content'
import * as travelData from 'content/travel'
import {storyExpirationSkill, storyEffectsSkill, storyReputationNeededSkill} from 'content/people/skillEffects'

sampleData =
  label: 'Explore Wilds'
  blocking: true # A blocking event prevents all other actions when the player is at that location. Costs no reputation.
  required: 'GameOver' # This event will result in a game over screen (using the given story) if it expires unviewed.
  requiredGroup: 'Ch2Routes' # This required event will only cause a game-over if *all* events in its group are expired or viewed, and if the chapter hasn't changed.
  _class: 'KatRoute' # Adds this class to the map view for the event
  cost: 1 # Multiplier on the event's cost. Defaults to 1 if absent.
  place: 'Vailia' # Used mostly to calculate how many days events should take to expire
  extraDays: 10 # Days added to the calculated expiration date, used to manually tweak balance
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


sortedStories = {}
for story, {where: w} of content
  sortedStories[w] or= []
  sortedStories[w].push(story)

export storiesAt = (...w) -> sortedStories[w.join('|')] or []

Story = {
  reputationNeeded: (story)->
    mult = if content[story].cost? then content[story].cost else 1
    base = if content[story].blocking then 0 else 15
    Math.max(0, base * mult + storyReputationNeededSkill())

  visibleStories: (stories = [])->
    return stories.filter(Story.matchesHistory.bind(null, false)).filter(Story.matchesConditions)

  canSail: ->
    # During tutorial, don't let them sail until they've accepted cargo
    if g.day is 1 then return false

    not Story.visibleStories(storiesAt(g.map.from, g.chapter)).some (p)-> content[p].blocking

  expirationDate: (story)->
    unless content[story].history then return (content[story].extraDays or 0)
    prereqsExpire = for key, value of content[story].history
      Story.expirationDate(key)
    extraDays = parseInt(content[story].extraDays) or content[story].extraDays?() or 0
    timeAdded = extraDays + if content[story].blocking then 4 else 15
    return Math.max(...prereqsExpire) + timeAdded + prereqsExpire.length * 12 + storyExpirationSkill()

  matchesHistory: (onlyOnce, story)->
    if g.history[story]? and onlyOnce then return false
    expires = Story.expirationDate(story)
    if expires and expires < g.day then return false
    for key, value of content[story].history
      if value and not g.history[key]? then return false
      if not value and g.history[key]? then return false
    return true

  matchesConditions: (story)->
    if (content[story].minCargo or 0) > g.cargo.length then return false
    if (content[story].maxCargo or 100) < g.cargo.length then return false
    if (content[story].minDamage or 0) > g.damage then return false
    if (content[story].maxDamage or 1000) < g.damage then return false
    return true

  unmetNeed: (place, story)->
    return if g.reputation[place] < Story.reputationNeeded(story)
      """Need #{Math.ceil(Story.reputationNeeded(story) - g.reputation[place])} more rep"""
    else ''

  effects: (story)->
    e = JSON.parse(JSON.stringify(content[story].effects or {}))
    return storyEffectsSkill(content[story], e)

  apply: (place, story)->
    Game.applyEffects(Story.effects(story))
    if place
      g.reputation[place] -= Story.reputationNeeded(story)
    content[story].apply?()
    g.history[story] = g.day

  travelEvent: (from, to, type)->
    stories = travelData[type].stories.filter(Story.matchesConditions)

    return if blockingEvents(stories).length
      choice(blockingEvents(stories))
    else if travelData[type].travelStoryOccurs()
      choice(repeatableEvents(stories))
    else null

  delayEvent: (from, to, type)->
    stories = travelData[type].delayStories
    choice(blockingEvents(stories)) or choice(repeatableEvents(stories)) or null

  gameIsOver: ->
    requiredEvents = {}
    for place of Place
      for story in storiesAt(place, g.chapter) when content[story].required
        group = content[story].requiredGroup
        if group
          requiredEvents[group] or= []
          requiredEvents[group].push(story)
        else if not g.history[story]? and Story.expirationDate(story) < g.day
          return content[story]

    for group, events of requiredEvents when not events.some(stillAvailable)
      return content[events.first(hasntOccurred)]

    return false
}

blockingEvents = (stories)->
  Story.visibleStories(stories)
    .filter((s)-> content[s].blocking)

repeatableEvents = (stories)->
  stories
    .filter(Story.matchesHistory.bind(null, false))
    .filter(Story.matchesConditions)
    .filter((s)-> not content[s].blocking)

stillAvailable = (story)-> (not g.history[story]?) and Story.expirationDate(story) >= g.day
hasntOccurred = (story)-> return not g.history[story]?

export default Story
