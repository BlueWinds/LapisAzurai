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
      description: '+1 Reputation at the destination when delivering cargo'
      doubledBy: 'Fear'
    Gregarious:
      description: '+1 Reputation at the origin when delivering cargo'
      requiresAnd: ['WinningSmile']
      doubledBy: 'Fear'
    Grounded:
      description: 'A new cargo becomes available whenever you deliver one'
      requiresAnd: ['Overdeliver']
      doubledBy: 'Fear'
    Initiate:
      description: 'Unlock Chapter 1'
      requiresAnd: ['Gregarious', 'Grounded']

    Overdeliver2:
      name: 'Overdeliver 2'
      description: '+1 Reputation at the destination when delivering cargo'
      requiresAnd: ['Initiate']
      doubledBy: 'Trust'
    Gregarious2:
      name: 'Gregarious 2'
      description: '+1 Reputation at the origin when delivering cargo'
      requiresAnd: ['Initiate']
      doubledBy: 'Trust'
    WellInformed:
      name: 'Well Informed'
      description: 'One additional cargo available daily'
      requiresAnd: ['Overdeliver2']
      doubledBy: 'Trust'
    SilverTongue:
      name: 'Silver Tongue'
      description: '+0.2 Reputation at each location daily'
      requiresAnd: ['Gregarious2']
      doubledBy: 'Trust'
    Mage:
      description: 'Unlock character routes'
      requiresAnd: ['WellInformed', 'SilverTongue2']

    WinningSmile2:
      name: 'Winning Smile 2'
      description: '+5 Reputation when arriving at a port for the first time'
      requiresAnd: ['Mage']
      doubledBy: 'Love'
    Grounded2:
      name: 'Grounded 2'
      description: 'A new cargo becomes available whenever you deliver one'
      requiresAnd: ['Mage']
      doubledBy: 'Love'
    WellInformed2:
      name: 'Well Informed 2'
      description: 'One additional cargo available daily'
      requiresAnd: ['WinningSmile2']
      doubledBy: 'Love'
    SilverTongue2:
      name: 'Silver Tongue 2'
      description: '+0.2 Reputation at each location daily'
      requiresAnd: ['Grounded2']
      doubledBy: 'Love'
    Adept:
      description: 'Unlock endings'
      requiresAnd: ['WellInformed2', 'SilverTongue2']
