export default {
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
      description: '5 fewer days between events while sailing (these events grant XP)'
      doubledBy: 'Regret'
    StreetRat:
      name: 'Street Rat'
      description: '+3 xp for all characters'
      requiresAnd: ['Bright', 'Generous', 'SixthSense']

    HowNotToLose:
      name: 'How Not To Lose'
      description: 'Events cost -2 Reputation'
      requiresAnd: ['StreetRat']
      doubledBy: 'Regret'
    NeverTooLate:
      name: 'Never Too Late'
      description: 'Events are available for longer'
      requiresAnd: ['StreetRat']
      doubledBy: 'Death'
    Devilish:
      description: '25% chance to discard an expired job when completing a different delivery'
      requiresAnd: ['StreetRat']
      doubledBy: 'Death'
    Deckhand:
      description: '+4 xp for all characters'
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
      description: '5 fewer days between events while sailing (these events grant XP)'
      requiresAnd: ['Deckhand']
      doubledBy: 'Desire'
    FreeWoman:
      name: 'Free Woman'
      description: '+5 xp for all characters'
      requiresOr: ['Bright2', 'Generous2', 'SixthSense2']

    HowNotToLose2:
      name: 'How Not To Lose 2'
      description: 'Events cost -2 Reputation'
      requiresAnd: ['FreeWoman']
      doubledBy: 'Desire'
    NeverTooLate2:
      name: 'Never Too Late 2'
      description: 'Events are available for longer'
      requiresAnd: ['FreeWoman']
      doubledBy: 'Desire'
    Devilish2:
      name: 'Devlish 2'
      description: '25% chance to discard an expired job when completing a different delivery'
      requiresAnd: ['FreeWoman']
      doubledBy: 'Desire'
}
