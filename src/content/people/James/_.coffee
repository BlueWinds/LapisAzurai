Person.alias.J = 'James'
Person.James =
  name: 'James'
  skills:
    Reliable:
      description: '+1 day to deliver cargo'
      doubledBy: 'Duty'
    Trustworthy:
      description: '+1 day to accept cargo'
      doubledBy: 'Duty'
    Stoic:
      description: 'Storms delay by half a day less'
      requiresOr: ['Reliable', 'Stoic']
      doubledBy: 'Duty'
    WeatherEye:
      description: '10% less likely to be caught in a storm'
      requiresOr: ['Trustworthy', 'Stoic']
      doubledBy: 'Duty'
    Apprentice:
      description: "Unlock James' events after prologue"
      requiresAnd: ['Reliable', 'Trustworthy']

    Reliable2:
      description: '+1 day to deliver cargo'
      requiresOr: ['Stoic', 'Trustworthy2']
      doubledBy: 'Power'
    Trustworthy2:
      description: '+1 day to accept cargo'
      requiresOr: ['WeatherEye', 'Reliable2']
      doubledBy: 'Power'
    Organized:
      description: '+1 cargo capacity'
      requiresOr: ['Reliable2', 'Navigator']
      doubledBy: 'Power'
    Navigator:
      description: '+10% sail speed'
      requiresOr: ['Trustworthy2', 'Organized']
      doubledBy: 'Power'
    Journeyman:
      description: "Unlock James' route"
      requiresAnd: ['Reliable2', 'Trustworhy2']

    WeatherEye2:
      description: '10% less likely to be caught in a storm'
      requiresOr: ['Organized', 'Stoic2']
      doubledBy: 'Devotion'
    Stoic2:
      description: 'Storms delay by half a day less'
      requiresOr: ['Navigator', 'WeatherEye2']
      doubledBy: 'Devotion'
    Organized2:
      description: '+1 cargo capacity'
      requiresOr: ['WeatherEye2', 'Navigator2']
      doubledBy: 'Devotion'
    Navigator2:
      description: '+10% sail speed'
      requiresOr: ['Stoic2', 'Organized2']
      doubledBy: 'Devotion'
    Master:
      description: "Unlock finale in James' route"
      requiresAnd: ['Stoic2', 'Stoic2']
