Person.alias.A = 'Asara'
Person.Asara =
  name: 'Asara'
  skills:
    Tears:
      Description: "Nothing"
    Fear:
      description: "Double the benefit of all of Natalie's 1st tier skills"
      requiresAnd: ['Tears']
    Regret:
      description: "Double the benefits of all of Kat's 1st tier skills"
      requiresAnd: ['Fear']
    Desert:
      description: "Unlock Asara's events after prologue"
      requiresAnd: ['Regret']

    Duty:
      description: "Double the benefits of all of James' 1st tier skills"
      requiresAnd: ['Desert']
    Trust:
      description: "Double the benefit of all of Natalie's 2nd tier skills"
      requiresAnd: ['Duty']
    Moon:
      description: "Unlock Asara's route"
      requiresAnd: ['Trust']

    Death:
      description: "Double the benefits of all of Kat's 2nd tier skills"
      requiresAnd: ['Moon']
    Power:
      description: "Double the benefits of all of James' 2nd tier skills"
      requiresAnd: ['Death']
    Goddess:
      description: "Unlock finale in Asara's route"
      requiresAnd: ['Power']

    Love:
      description: "Double the benefits of all of Natalie's 3rd tier skills"
      requiresAnd: ['Goddess']
    Desire:
      description: "Double the benefits of all of Kat's 3rd tier skills"
      requiresAnd: ['Love']
    Devotion:
      description: "Double the benefits of all of James' 3rd tier skills"
      requiresAnd: ['Desire']
