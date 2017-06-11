Person.alias.N = 'Natalie'
Person.Natalie =
  name: 'Natalie'
  skills:
    WinningSmile:
      description: 'Reputation decays 20% slower'
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
      description: '+1 Reputation at the destination when delivering cargo'
      requiresAnd: ['Initiate']
      doubledBy: 'Trust'
    Gregarious2:
      description: '+1 Reputation at the origin when delivering cargo'
      requiresAnd: ['Initiate']
      doubledBy: 'Trust'
    WellInformed:
      description: 'One additional cargo available daily'
      requiresAnd: ['Overdeliver2']
      doubledBy: 'Trust'
    SilverTongue:
      description: '+1 Reputation at each location daily'
      requiresAnd: ['Gregarious2']
      doubledBy: 'Trust'
    Adept:
      description: 'Unlock character routes'
      requiresAnd: ['WellInformed', 'SilverTongue2']

    WinningSmile2:
      description: 'Reputation decays 10% slower'
      requiresAnd: ['Adept']
      doubledBy: 'Love'
    Grounded2:
      description: 'A new cargo becomes available whenever you deliver one'
      requiresAnd: ['Adept']
      doubledBy: 'Love'
    WellInformed2:
      description: 'One additional cargo available daily'
      requiresAnd: ['WinningSmile2']
      doubledBy: 'Love'
    SilverTongue2:
      description: '+1 Reputation at each location daily'
      requiresAnd: ['Grounded2']
      doubledBy: 'Love'
    Mage:
      description: 'Unlock finale'
      requiresAnd: ['WellInformed2', 'SilverTongue2']
