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

s.Clouds =
  label: 'Clouds on the Horizon'
  history:
    KatJoins: true
  effects:
    xp:
      Kat: 2
  text: -> """
  || travel/DeckDay
    ` Land ahoy!` The cry came from the crow's nest, stirring everyone into action. Most of the crew ran to the side of the ship where the watchman was pointing, while Natalie shaded her epes with one hand against the brilliant noon sun from where she stood at the helm.

    `K Oy, that's not land, you dolt!` Kat had been the first to the railing, and she yelled back up to the watch. `K It's just a dark cloud!`

    ` Looks like land to me.` ` Can't be, shouldn't be anything but open water out here.` ` Too dark for a cloud, and the shore's clear.` ` Hm, maybee...` Sailors discussed among themselves, while Kat ran to the helm.

  || K/Happy
    `K Cap'n, permission to fetch your spyglass so you can set these dufus' aright?`
    `N Granted.`

    It had looked like land to Natalie as well as the watchman, despite the lack of charted islands in the area, but the spyglass proved Kat right - nothing more than an unusual set of clouds. Natalie strained her senses watching it. Yes, the distant darkness smelled faintly of magic, even from here. The lapis steered well clear.
  """

s.DistantShoals =
  label: 'Distant Shoals'
  history:
    KatJoins: true
  effects:
    xp:
      James: 2
  text: -> """
  || travel/SailingDay
    `N Bring in the sails.` Natalie squinted against the noonday sun reflecting off the waves. `N Slow us down.`

    `J Mainsail around! Kat, get those ropes stowed, now's not the time for messing around!` James put her quiet order into action with shouted commands, setting the crew in motion. `J What's wrong?`

    `N See how the texture of the water's different? We've drifted a little west of where we should be. Nothing serious, just a few miles. There are shoals in this area. We'll take it slow.` That was the value of an accurate rutter - not just directions and distances, but landmarks, seasonal changes, dangers and observations, painstakingly compiled over decades, often at the cost of lives.

    Natalie squinted against the sunlight again. Best not to scrape her ship along the underwater rocks in this region. At least it was high tide right now.
  """

Place.travel.Sail.stories = Object.keys(s)
for key, value of s
  Story[key] = value
