Person.alias.K = 'Kat'
Person.Kat =
  name: 'Kat'
  skills:
    Bright:
      description: 'Events grant +1 experience to a random participant'
      doubledBy: 'Regret'
    Generous:
      description: 'Events grant +1 experience to a random non-participant'
      doubledBy: 'Regret'
    SixthSense:
      description: "See events two days before they're available"
      doubledBy: 'Regret'
    StreetRat:
      description: "Unlock Kat's events after prologue"
      requiresAnd: ['Bright', 'Generous', 'SixthSense']

    HowNotToLose:
      description: 'Events cost -1 Reputation'
      requiresAnd: ['StreetRat']
      doubledBy: 'Regret'
    NeverTooLate:
      description: 'Events last an additional day'
      requiresAnd: ['StreetRat']
      doubledBy: 'Death'
    Devilish:
      description: '50% change to discard an expired cargo when completing another one'
      requiresAnd: ['StreetRat']
      doubledBy: 'Death'
    Deckhand:
      description: "Unlock Kat' route"
      requiresAnd: ['HowNotToLose', 'NeverTooLate', 'Devilish']

    Bright2:
      description: 'Events grant +1 experience to a random participant'
      requiresAnd: ['Deckhand']
      doubledBy: 'Death'
    Generous2:
      description: 'Events grant +1 experience to a random non-participant'
      requiresAnd: ['Deckhand']
      doubledBy: 'Death'
    SixthSense2:
      description: "See events two days before they're available"
      requiresAnd: ['Deckhand']
      doubledBy: 'Desire'
    FreeWoman:
      description: "Unlock finale in Kat' route"
      requiresAnd: ['Bright2', 'Generous2', 'SixthSense2']

    HowNotToLose2:
      description: 'Events cost -1 Reputation'
      requiresAnd: ['FreeWoman']
      doubledBy: 'Desire'
    NeverTooLate2:
      description: 'Events last an additional day'
      requiresAnd: ['FreeWoman']
      doubledBy: 'Desire'
    Devilish2:
      description: '50% chance to discard an expired cargo when completing another one'
      requiresAnd: ['FreeWoman']
      doubledBy: 'Desire'
