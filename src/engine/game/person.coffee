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

window.Person = {
  alias: {}

  xpNeeded: (level)-> Math.round(Math.pow(level, 1.5) * 4)

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
    data = Person[person].skills[skill]

    unmetAnd = (data.requiresAnd or []).filter((s)-> not skills[s])
    if unmetAnd.length
      return unmetAnd.map((s)-> Person[person].skills[s].name or s).wordJoin()

    if data.requiresOr and not data.requiresOr.some((s)-> skills[s])
      return data.requiresOr.map((s)-> Person[person].skills[s].name or s).wordJoin('or')

    return ''
}
