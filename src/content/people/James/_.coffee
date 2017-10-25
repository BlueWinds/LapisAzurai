Person.alias.J = 'James'
Person.James =
  name: 'James'
  img: 'people/James/Normal'
  svg: 'people/James/skills.svg'
  skills:
    Reliable:
      description: 'Repair the ship 25% faster'
      doubledBy: 'Duty'
    Trustworthy:
      description: '+2 days to deliver cargo'
      doubledBy: 'Duty'
    Stoic:
      description: 'Storms are half a day shorter (on average)'
      requiresOr: ['Reliable', 'WeatherEye']
      doubledBy: 'Duty'
    WeatherEye:
      name: 'Weather Eye'
      description: '10% less likely to be caught in a storm'
      requiresOr: ['Trustworthy', 'Stoic']
      doubledBy: 'Duty'
    Apprentice:
      description: 'Unlock events focused on James in Chapter 2'
      requiresAnd: ['Reliable', 'Trustworthy']

    Reliable2:
      name: 'Reliable 2'
      description: 'Repair the ship 25% faster'
      requiresOr: ['Stoic', 'Trustworthy2']
      doubledBy: 'Power'
    Trustworthy2:
      name: 'Trustworthy 2'
      description: '+2 days to deliver cargo'
      requiresOr: ['WeatherEye', 'Reliable2']
      doubledBy: 'Power'
    Organized:
      description: '+1 cargo capacity'
      requiresOr: ['Trustworthy2', 'Navigator']
      doubledBy: 'Power'
    Navigator:
      description: '+10% sail speed'
      requiresOr: ['Reliable2', 'Organized']
      doubledBy: 'Power'
    Journeyman:
      description: "Unlock James' route (also requires Mage on Natalie)"
      requiresAnd: ['Reliable2', 'Trustworthy2']

    WeatherEye2:
      name: 'Weather Eye 2'
      description: '10% less likely to be caught in a storm'
      requiresOr: ['Organized', 'Stoic2']
      doubledBy: 'Devotion'
    Stoic2:
      name: 'Stoic 2'
      description: 'Storms are half a day shorter (on average)'
      requiresOr: ['Navigator', 'WeatherEye2']
      doubledBy: 'Devotion'
    Organized2:
      name: 'Organized 2'
      description: '+1 cargo capacity'
      requiresOr: ['WeatherEye2', 'Navigator2']
      doubledBy: 'Devotion'
    Navigator2:
      name: 'Navigator 2'
      description: '+10% sail speed'
      requiresOr: ['Stoic2', 'Organized2']
      doubledBy: 'Devotion'
    Master:
      description: "Unlock James' ending (also requires Adept on Natalie)"
      requiresAnd: ['Stoic2', 'WeatherEye2']
