import {choice} from 'game/util'
import Game from 'game/Game'

import * as content from 'content'
import * as places from 'content/places'
import * as travelData from 'content/travel'
import {storyExpirationSkill, storyEffectsSkill, storyReputationNeededSkill} from 'content/people/skillEffects'

sampleData =
  where: 'Vailia|Ch1'
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

export reputationNeeded = (story)->
  mult = if content[story].cost? then content[story].cost else 1
  base = if content[story].blocking then 0 else 15
  Math.max(0, base * mult + storyReputationNeededSkill())

export canSail = ->
  # During tutorial, don't let them sail until they've accepted cargo
  if g.day is 1 then return false
  not visibleStories(storiesAt(g.map.from, g.chapter)).some((s)-> content[s].blocking)

export expirationDate = (story)->
  unless content[story].history then return (content[story].extraDays or 0)
  prereqsExpire = for key, value of content[story].history
    expirationDate(key)
  extraDays = parseInt(content[story].extraDays) or content[story].extraDays?() or 0
  timeAdded = extraDays + if content[story].blocking then 4 else 15
  return Math.max(...prereqsExpire) + timeAdded + prereqsExpire.length * 12 + storyExpirationSkill()

export unmetNeed = (place, story)->
  if g.reputation[place] < reputationNeeded(story)
    """Need #{Math.ceil(reputationNeeded(story) - g.reputation[place])} more rep"""
  else ''

export storyEffects = (story)->
  e = $.extend(true, {}, content[story].effects)
  return storyEffectsSkill(content[story], e)

export applyStory = (place, story)->
  Game.applyEffects(storyEffects(story))
  if place
    g.reputation[place] -= reputationNeeded(story)
  content[story].apply?()
  g.history[story] = g.day

export travelEvent = (from, to, type)->
  stories = storiesAt(type)
    .concat(storiesAt(type, g.chapter))
    .filter(matchesConditions)

  return if blockingEvents(stories).length
    choice(blockingEvents(stories))
  else if travelData[type].travelStoryOccurs()
    choice(repeatableEvents(stories))
  else null

export delayEvent = (from, to, type)->
  stories = storiesAt(type, 'delay').concat(storiesAt(type, chapter, 'delay'))
  choice(blockingEvents(stories)) or choice(repeatableEvents(stories)) or null

export visibleStories = (stories = [])->
  stories
    .filter(hasntOccurred)
    .filter(matchesHistory)
    .filter(matchesConditions)

export gameIsOver = ->
  requiredEvents = {}
  for place of places
    for story in storiesAt(place, g.chapter) when content[story].required
      group = content[story].requiredGroup
      if group
        requiredEvents[group] or= []
        requiredEvents[group].push(story)
      else if hasntOccurred(story) and expirationDate(story) < g.day
        return content[story]

  for group, events of requiredEvents when not events.some(stillAvailable)
    return content[events.first(hasntOccurred)]

  return false

matchesConditions = (story)->
  if (content[story].minCargo or 0) > g.cargo.length then return false
  if (content[story].maxCargo or 100) < g.cargo.length then return false
  if (content[story].minDamage or 0) > g.damage then return false
  if (content[story].maxDamage or 1000) < g.damage then return false
  return true

matchesHistory = (story)->
  expires = expirationDate(story)
  if expires and expires < g.day then return false
  for key, value of content[story].history
    if value and not g.history[key]? then return false
    if not value and g.history[key]? then return false
  return true

blockingEvents = (stories)->
  visibleStories(stories)
    .filter((s)-> content[s].blocking)

repeatableEvents = (stories)->
  stories
    .filter(matchesHistory)
    .filter(matchesConditions)
    .filter((story)-> not content[story].blocking)

stillAvailable = (story)-> hasntOccurred(story) and expirationDate(story) >= g.day
hasntOccurred = (story)-> not g.history[story]?
