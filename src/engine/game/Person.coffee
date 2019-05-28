import {wordJoin} from 'game/util'

import people from 'content/people'
import {xpNeededSkill} from 'content/people/skillEffects'

samplePerson =
  xp: 100
  skills:
    EarToTheGround: true

sampleData =
  name: 'Natalie'
  skills:
    EarToTheGround:
      label: 'Ear to the ground'
      description: 'Add a new cargo immediately wherever you deliver one'
    Gregarious:
      description: '+1 reputation wherever you deliver cargo'
      # Only one of requiresOr or requiresAnd should be present.
      requiresOr: ['EarToTheGround']
      requiresAnd: ['EarToTheGround']

  quoteColor: '#8CDAFF'

Person = {
  xpNeeded: (level)-> Math.round(Math.pow(level, 1.5) * 3 + xpNeededSkill())

  level: (xp)->
    l = 0
    while Person.xpNeeded(l + 1) <= xp
      l++
    return l

  skillPoints: (person)->
    level = Person.level(g.people[person].xp)
    return level - Object.keys(g.people[person].skills).length

  unmetRequirements: (person, skill)->
    skills = g.people[person].skills
    data = people[person].skills[skill]

    unmetAnd = (data.requiresAnd or []).filter((s)-> not skills[s])
    if unmetAnd.length
      return wordJoin(unmetAnd.map((s)-> people[person].skills[s].name or s))

    if data.requiresOr and not data.requiresOr.some((s)-> skills[s])
      return wordJoin(data.requiresOr.map((s)-> people[person].skills[s].name or s), 'or')

    return ''
}

export default Person
