samplePerson =
  name: 'Natalie'
  experience: 100
  skills:
    EarToTheGround: true
  color: ['tanned', 'none', 'green', 'ash', 'none', 'none']

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

  images:
    scale: 0.45
    normal: [
      "Skin"
      "Neutral"
      "NeutralEyes"
    ]
  quoteColor: '#8CDAFF'
  colors: [
    { # Skin
      light: false
      ivory: [16, 67, 41]
    }
    {none: false} # Expression
    {none: false} # Eyes
  ]

window.Person = {
  alias: {}
  expForNextSkill: (person)->
    skills = Object.keys(person.skills).length
    return skills * (skills + 4)
}
