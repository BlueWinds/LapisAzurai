Person.alias.K = 'Kat'
Person.Kat =
  name: 'Kat'
  img: 'people/Kat/Normal'
  svg: 'people/Kat/skills.svg'
  skills:
    Bright:
      description: 'Events grant +1 xp to a random participant'
      doubledBy: 'Regret'
    Generous:
      description: 'Events grant +1 xp to a random non-participant'
      doubledBy: 'Regret'
    SixthSense:
      name: 'Sixth Sense'
      description: 'Extra 1% chance each day to get event while sailing'
      doubledBy: 'Regret'
    StreetRat:
      name: 'Street Rat'
      description: 'Unlock events focused on Kat in Chapter 2'
      requiresAnd: ['Bright', 'Generous', 'SixthSense']

    HowNotToLose:
      name: 'How Not To Lose'
      description: 'Events cost -2 Reputation'
      requiresAnd: ['StreetRat']
      doubledBy: 'Regret'
    NeverTooLate:
      name: 'Never Too Late'
      description: 'Events are available for two extra days'
      requiresAnd: ['StreetRat']
      doubledBy: 'Death'
    Devilish:
      description: '25% change to discard an expired job when completing a different delivery'
      requiresAnd: ['StreetRat']
      doubledBy: 'Death'
    Deckhand:
      description: "Unlock Kat' route (also requires Mage on Natalie)"
      requiresOr: ['HowNotToLose', 'NeverTooLate', 'Devilish']

    Bright2:
      name: 'Bright 2'
      description: 'Events grant +1 xp to a random participant'
      requiresAnd: ['Deckhand']
      doubledBy: 'Death'
    Generous2:
      name: 'Generous 2'
      description: 'Events grant +1 xp to a random non-participant'
      requiresAnd: ['Deckhand']
      doubledBy: 'Death'
    SixthSense2:
      name: 'Sixth Sense 2'
      description: 'Extra 1% chance each day to get event while sailing'
      requiresAnd: ['Deckhand']
      doubledBy: 'Desire'
    FreeWoman:
      name: 'Free Woman'
      description: "Unlock Kat's ending (also requires Adept on Natalie)"
      requiresOr: ['Bright2', 'Generous2', 'SixthSense2']

    HowNotToLose2:
      name: 'How Not To Lose 2'
      description: 'Events cost -2 Reputation'
      requiresAnd: ['FreeWoman']
      doubledBy: 'Desire'
    NeverTooLate2:
      name: 'Never Too Late 2'
      description: 'Events are available for two extra days'
      requiresAnd: ['FreeWoman']
      doubledBy: 'Desire'
    Devilish2:
      name: 'Devlish 2'
      description: '25% chance to discard an expired job when completing a different delivery'
      requiresAnd: ['FreeWoman']
      doubledBy: 'Desire'
