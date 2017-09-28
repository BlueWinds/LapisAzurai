p = 'travel/'

$.extend Place.travel.Sail, {
  delayOccurs: (from, to, distance)->
    if g.history.FirstStormSick then return Math.random() < 0.03
    # Always trigger a storm on the trip back to Vailia when we're almost in port
    if g.history.MtJuliaArrive and not g.history.FirstStorm and distance < 30 then return true
    # No storms until we've had the intro event about Natalie
    return false
  delayDailyDamage: (from, to, distance)->
    damage = 5 * (Math.random() + 0.5)
    # Damage has been prevented, probably by
    if g.preventNextDamage
      if g.preventNextDamage > damage
        g.preventNextDamage -= damage
        damage = 0
      else
        damage -= g.preventNextDamage
        g.preventNextDamage = 0
    return damage
  delayDuration: (from, to, distance)-> 4 * (Math.random() + 0.5)
  delayImages: [
    p + 'CabinStorm.jpg',
    p + 'DeckStorm.jpg',
    p + 'SailingStorm.jpg'
  ]
}

s = {}
s.FirstStorm =
  label: 'Storm'
  blocking: true
  history:
    MtJuliaArrive: true
  place: 'Vailia' # Only used for counting when events should expire
  effects:
    xp:
      Natalie: 3
  text: -> """
  || travel/CabinStorm
    `J Natalie! <b>Nat! Get up!</b>` James pounded on her door and shouted.

    `N What?` She slipped up out of bed, on her feet and shrugging on a shirt even while he answered. There was no light outside – still night. No, not night...

    `J A storm is rolling in! I've got the crew reefing the sails, but it's eating the horizon like you wouldn't believe...` He stepped out of the way as she opened the door in his face.

  || N/Angry
    In one direction lay a peaceful night – dark sky and twinkling stars, ocean quiet but growing rougher. In the other... she groaned.

    `N Strike the sails, lock down all the booms, get everyone else up,` she left the door swinging open and scrambled for something warmer to wear. Waxed cap, waxed jacket, stiff boots – everything she'd need for working outdoors in the worst weather the ocean could throw at them.

  || travel/DeckStorm
    By the time she was dressed, the storm loomed almost overhead, howling winds whipping the water into a dark purple froth. Rain sleeted around them, drenching the deck and making everything slippery. The crew was already hard at work, battening everything down for a blow. She found James at the helm, pushed him aside and took the wheel herself.

    `N Not good. It's a big one,` Natalie had to shout to be heard over the sound of the ocean.

    `J How do you know!?`

    `N It's... it'll take five, six hours to blow past!` She tasted the wind, unfurling instincts seldom used. The first wave caught them from the side before she could turn the ship.

    `J <b>How do you know!</b>` James repeated his question, grabbing her waist to steady her as the water washed over the deck below.

  || travel/SailingStorm
    Two sailors snapped to the end of their safety lines, saved by the rope anchoring them to their posts, while the rest remained on their feet. This one hadn't risen high enough to flood over the poop deck, but it was just a warm up. Looking deeper into the storm from their position at the top of the wave, they could see even more monstrous waves coming toward them. Natalie spun the wheel, hoping desperately that the ship would turn fast enough to take the next head-on.

    Storms like this swept across the world, leaving nothing but wreckage in their wake. Refuges like Mt. Julia were vital for any ships to survive at all. Seagoing vessels existed as fugitives, darting between safe ports in the intervening lulls. No captain set sail in anything except perfect weather, to reduce their chances of getting caught out. Like they had. And even still, as often as not, ships were unlucky. Like they were.

    Another wave towered over them, a tremendous mountain in the ocean. James managed to wrap a rope around Natalie's waist and tie it to the wheel just in time. This one didn't spill over the deck as more than a plume of spray, but surging water and gusting wind spun the ship around like a cork, and the deck tilted precipitously.

  || J/Angry
    James shouted something at her, but Natalie couldn't hear what he said, drowned out by howling wind that hit them almost like a solid object. He pointed. One of the sailors hung limply from his line, blood running from his forehead. Natalie shook her head, made a sharp gesture of denial – James shouldn't go down there. He gritted his teeth and ignored her, untied his line and ran down the stairs.

    This was the sort of storm that left no survivors. A Grandmother Storm. The last had been just a month ago. Natalie had helped comb the beach for wreckage and survivors in its wake. There were precious few of the latter, and far too much of the former.

    A wave towered over them, reaching halfway up the main mast for a brief moment before it crashed over the deck. Natalie clung to the wheel, fighting the maelstrom that tried to tear her away from her post. The Azurai popped out of the water on the other side, creaking timbers audible even over the sound of the wind. She checked the deck. James clung to one of the masts, holding the sailor in one arm.

    Against all odds, she felt giddy, alive. Death was so close, and yet... and yet, it wouldn't claim them. She could feel it in her bones, taste it in the wind, smell it in the salt spray. Natalie felt the storm as though it were an extension of her own body, felt the howling power that fed it, felt a hundred miles of terrible elemental force seeking release...

  ||
    <h4>...</h4>

  || travel/DeckStorm
    James looked up at the wheel where Natalie hung onto it, dazed, looking more like a drowned rat than his best friend. In the brief lull between waves, he saw... he rubbed his eyes. She was grinning like a madwoman. The sailor stirred in his arms.

    He cut away the sailor's rope with a knife and dashed towards the door below decks, slamming it behind him just as another wall of water crashed over the ship. He leaned down, examined the man's forehead. Still breathing. Just a crack on the head. He'd be fine.

    James pushed back into the storm, wind instantly cutting away any semblance of warmth he'd gathered inside. Clinging to the rail for stability against the violently pitching deck, he pushed his way back up to the poop deck. Natalie hadn't moved. She still clung to the wheel, grinning madly. He grabbed her shoulder, shouted something even he couldn't hear.

  || N/Excited
    `N Do you know why they gave me a ship, James? I'm smart, and I'm pretty, but that's not why.` Her laughing voice somehow cut through the wind, though he could barely hear his own shouting. He shook his head. This wasn't the time for that.

    `N They gave me a ship because I'm not going to die!` She let go of the wheel with one hand, gripped his shoulder with manic strength. Another wave crashed over the ship, burying them both in boiling, freezing foam for a moment. When it cleared, one of the sails had ripped away, floating in the ocean nearby, but the mast itself was still intact.

    James shook his head again, trying to clear it. That they hadn't sunk yet was nearly a miracle. Whatever manic state had come over her, Natalie was still alive, and still holding the wheel, turning as best she could to face each new assault from the storm. In a brief lull in the wind, he heard someone below shouting to get buckets and head below decks. He clasped her shoulder again and headed off to help.
  """

Place.travel.Sail.lostCargo = ->
  cargo = Math.choice(g.cargo)
  g.cargo = g.cargo.filter((c)-> c isnt cargo)
  g.nextDayDescription = "Lost #{cargo.name} destined for #{Place[cargo.to].name}"
  Story.changeSection(1, true)

Place.travel.Sail.extraDamage = ->
  damage = Math.random() * 15 + 10
  g.damage += damage
  g.nextDayDescription = "#{Math.round(damage)} extra damage"
  Story.changeSection(1, true)

Place.travel.Sail.extraDelay = ->
  delay = Math.random() + 1
  g.map.delay += delay
  g.nextDayDescription = "Delayed #{Math.round(delay)} days"
  Story.changeSection(1, true)

Place.travel.Sail.makeProgress = ->
  distance = Math.random() * 15 + 15
  g.map.speedBonus = distance
  g.nextDayDescription = 'Kept sailing despite the danger'
  Story.changeSection(1, true)

Place.travel.Sail.reduceDamage = ->
  damage = Math.random() * 15 + 5
  g.preventNextDamage += damage
  g.nextDayDescription = "#{Math.round(damage)} damage prevented"
  Story.changeSection(1, true)

s.StormDropOrDamage =
  label: 'Storm'
  minCargo: 1
  text: -> """
  |||| travel/SailingStorm
    Seas heaved, the hull groaned, masts cracked. A ferocious squall blew in without warning, giving the crew scant time to prepare. James rushed to help <button onclick='Place.travel.Sail.lostCargo();'>douse the sails</button> or <button onclick='Place.travel.Sail.extraDamage();'>secure the cargo</button> before things grew worse.
  """

s.StormDropOrDelay =
  label: 'Storm'
  minCargo: 1
  text: -> """
  |||| travel/CabinStorm
     James slammed the door in the face of storm outside, and took a moment to shake the water from his hair before he spoke. `J Nat, we're taking on water faster than we can pump it out. We need to <button onclick='Place.travel.Sail.lostCargo();'>lighten the load</button> or put <button onclick='Place.travel.Sail.extraDelay();'>more men on the pumps</button>.`
  """

s.StormSpeedOrSafety =
  label: 'Storm'
  text: -> """
  |||| travel/DeckNight
    Storm clouds darken the sky, and winds begin to pick up. Natalie can feel the energy building, crawling along her skin and ready to break at any moment. It's a big one. Should the Lapis sail into <button onclick='Place.travel.Sail.makeProgress();'>the teeth of the storm</button> or <button onclick='Place.travel.Sail.reduceDamage();'>douse the sails</button> while there's still time?
  """

Story.StormLoseCargo =
  label: 'Lose Cargo'
  text: -> 'Lost cargo'

Place.travel.Sail.delayStories = Object.keys(s)
for key, value of s
  Story[key] = value
