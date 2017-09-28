Person.alias.N = 'Natalie'
Person.Natalie =
  name: 'Natalie'
  img: 'people/Natalie/Normal'
  svg: 'people/Natalie/skills.svg'
  skills:
    WinningSmile:
      name: 'Winning Smile'
      description: '+5 Reputation when arriving at a port for the first time'
      doubledBy: 'Fear'
    Overdeliver:
      description: 'New jobs give +1 Reputation at the destination'
      doubledBy: 'Fear'
    Gregarious:
      description: 'New jobs give +1 Reputation at the origin'
      requiresAnd: ['WinningSmile']
      doubledBy: 'Fear'
    Grounded:
      description: '25% chance that a new job becomes available whenever you deliver cargo'
      requiresAnd: ['Overdeliver']
      doubledBy: 'Fear'
    Initiate:
      description: 'Unlock Chapter 2'
      requiresAnd: ['Gregarious', 'Grounded']

    Overdeliver2:
      name: 'Overdeliver 2'
      description: 'New jobs give +1 Reputation at the destination'
      requiresAnd: ['Initiate']
      doubledBy: 'Trust'
    Gregarious2:
      name: 'Gregarious 2'
      description: 'New jobs give +1 Reputation at the origin'
      requiresAnd: ['Initiate']
      doubledBy: 'Trust'
    WellInformed:
      name: 'Well Informed'
      description: 'Extra 10% chance of finding a job each day'
      requiresAnd: ['Overdeliver2']
      doubledBy: 'Trust'
    SilverTongue:
      name: 'Silver Tongue'
      description: '+0.5 Reputation when searching for a job'
      requiresAnd: ['Gregarious2']
      doubledBy: 'Trust'
    Mage:
      description: 'Unlock Chapter 3'
      requiresAnd: ['WellInformed', 'SilverTongue2']

    WinningSmile2:
      name: 'Winning Smile 2'
      description: '+5 Reputation when arriving at a port for the first time'
      requiresAnd: ['Mage']
      doubledBy: 'Love'
    Grounded2:
      name: 'Grounded 2'
      description: '25% chance that a new job becomes available whenever you deliver cargo'
      requiresAnd: ['Mage']
      doubledBy: 'Love'
    WellInformed2:
      name: 'Well Informed 2'
      description: 'Extra 10% chance of finding a job each day'
      requiresAnd: ['WinningSmile2']
      doubledBy: 'Love'
    SilverTongue2:
      name: 'Silver Tongue 2'
      description: '+0.5 Reputation when searching for a job'
      requiresAnd: ['Grounded2']
      doubledBy: 'Love'
    Adept:
      description: 'Unlock endings'
      requiresAnd: ['WellInformed2', 'SilverTongue2']
