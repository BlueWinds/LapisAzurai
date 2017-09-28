p = 'travel/'

Place.travel.Sail =
  normalImages: [
    p + 'CabinDay.jpg'
    p + 'CabinNight.jpg'
    p + 'DeckDay.jpg'
    p + 'DeckNight.jpg'
    p + 'DeckFog.jpg'
    p + 'SailingDay.jpg'
    p + 'SailingNight.jpg'
  ]
  travelStoryOccurs: -> Math.random() < 0.04

s = {}

s.FirstStorm2 =
  label: 'Storm'
  blocking: true
  place: 'Vailia' # Only used for counting when events should expire
  history:
    FirstStorm: true
  effects:
    xp:
      James: 3
  text: -> """
  || travel/DeckNight
    Silence.

    James clung to the railing, shivering, and trying not to pass out from the twin pangs of exhaustion and chill. But he was alive. They were all alive, by some miracle. The sea still rolled, waves still occasionally rose high enough to spray the deck, but it was clear they'd passed through the worst of the storm. Light grew on the horizon - dawn, slowly pressing its way through the clouds overhead.

    He stumbled to his feet, slipped on a loose rope, steadied himself with an arm on the railing. Deep weariness penetrated all the way to his bones, sapping every ounce of strength. Just a little more. He dragged himself across the deck, slapping a sailor on the back where she doggedly passed on pails of water handed up from below decks.

    Up on the poop deck he found Natalie, passed out and still tied to the wheel.  Numb fingers fumbled with the rope, then he bypassed them by using a knife to cut her free. They had plenty of rope. He winced away from the contact. Unlike his own icy skin, she was burning hot to the touch, as if wracked by a terrible fever. Only the strength and steadiness of her breaths reassured him she wasn't on death's doorstep.

  || travel/CabinNight
    He carried her down below decks, to her cabin. Against all odds, the interior was still dry. Even a Grandmother Storm that had snapped both masts and torn away every sail hadn't been a match for the rubber seal around the door to the captain's cabin.

    Efficiently he stripped her, all the way down to bare skin. Any other time he would have hesitated, or at the very least been blushing and mortified as he worked, but not now. Any feelings beyond mere practicality were gone, washed away somewhere in the last six hours.

    He pulled the sheets up around her neck, then a blanket, then fumbled another one from a chest to lay over her. She didn't stir. Her skin still burned.

    He slumped to the floor, his back to her bed, and waited.

  ||
    Waited.

  ||
    Slept.
  """

Place.travel.Sail.stories = Object.keys(s)
for key, value of s
  Story[key] = value
