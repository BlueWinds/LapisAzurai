samplePerson =
  experience: 100
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
  expForNextSkill: (person)->
    skills = Object.keys(person.skills).length
    return skills * (skills + 4)
}
