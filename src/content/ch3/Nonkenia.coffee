s = {}

s.ThievingKat =
  label: "Kat's Thievery"
  history:
    Ch3Root: true
  effects:
    xp:
      Kat: 2
  text: ->"""
  || travel/DeckFog
    Natalie frowned and stared at the horizon. It was dark, but not enough for her to suspect a storm. The Lapis had good wind from the south, easy enough to use for their purposes. She wasn't exactly sure what it was that had her on edge.

    It was Kat, she realized. Where was Kat? She hadn't heard a peep out of the boisterous thief ("former", she liked to insist) in at least ten minutes. That usually meant trouble. She gestured James up to take the helm and went below decks.

  || travel/CabinDay
    `N What are you doing rummaging through my wardrobe?` Natalie closed the door to her cabit behind her.

    Kat turned slowly and grinned. `K Rummaging through your wardrobe.`

    `N That's... <i>why</i>?`

    `K 'cause I'm looking for your underwear. Was gonna steal some, but you caught me. Shall I walk the plank, or do you want to whip me first? Or maybe flog me and then steal <i>my</i> underwear instead?` Kat waggled her eyebrows and walked straight past Natalie, opened the door and left. Natalie was still too busy trying to figure out exactly what was going on to stop her.

    A mild flogging would only have her wisecracking and laughing, and a harsh one was more than... whatever this was... deserved. Something less traditional. Wearing a sign for a few days ought to to do the trick. "I'm an idiot and got caught," perhaps.
  """

Place.Nonkenia.stories.Ch3 = Object.keys(s)
for key, value of s
  value.place = 'Nonkenia'
  Story[key] = value
