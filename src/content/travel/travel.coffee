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

s.FogSpirit =
  label: 'Fog Spirit'
  history:
    AsaraAwakens: true
  effects:
    xp:
      Natalie: 2
  text: -> """
  || travel/DeckFog
    A grey fog descended over the ship in the night and, by the time anyone thought to wake Natalie, the Lapis was becalmed in dim water. The lightlessness dragged at spirits and numbing thoughts. Natalie looked around at the crew - lethargic, barely staying awake. It was unnatural the way they dragged at their tasks, when every nerve in her screamed that something was wrong. Only Asara seemed alert, tense and silent. Nothing unusual there.

    Drooping sails and silent waves suggested that the Lapis wasn't going anywhere soon. Haranging enthusiasm into them seemed useless. There was magic at work.

    `N Come out, come out!` Her voice echoed, as though the world itself were small. No response. Time to do things the hard way then, if whatever was causing this didn't want to talk. She dug her mind down, bracing against the ship, and <i>pushed</i>. The mist obeyed only reluctantly, begrudgingly stirring and swirling around them. While holding the ship together in a storm felt like holding a tiger by the tail, this felt like pulling on a stubborn mule. It didn't want to obey.

    The mist slowed in its stirring. She pushed harder, headache growing, but like a mill grinding to a halt, some greater force resisted and canceled her magic, stilling the small wind she'd managed to summon.

  ||
    Silence.

    ` You are a feisty one.` Natalie jumped at the voice hissing from both a thousand miles away and right next to her ear.

    `N You stopped my ship and bewitched my crew. Feisty doesn't even begin to cover it.` She poked one of sailors, who was standing motionless and drooling slightly. `N Please explain.`

    ` I explain NOTHING.` The hissing voice rose in volume with each word, until the final "nothing" made Natalie clutch at her ears.

    Immediately the sense of presence disappeared, the fog began to dissolve, and the people around her stirred. She sunk to her knees, still clutching her head.

    James staggered woozily to her side. `J What happened? I heard some wind, and...</q> he raised a hand to touch her shoulder, lowered it again.

    `N I don't know. A spirit. A ghost. A god. I think... I think it was scared of me?` She shook her head helplessly. `N It's gone.`
  """

s.FishSpirit =
  label: 'Fish Spirit'
  history:
    AsaraAwakens: true
  effects:
    xp:
      Natalie: 2
  text: -> """
  || travel/DeckDay
    `N Nets out! Lower the sails. James, get everyone on deck. We're going fishing!` Sailors scrambled to obey their excited captain as the water around them churned and boiled with fish. For a dozen yards in every direction the water was silver with the glint of scales, a school as large and hungry as Natalie had ever seen. If they'd been properly equipped as a fishing vessel they'd be able to make a month's catch in just a few hours, but even so she couldn't resist the chance to stock up their larder.

    They had only to drop a net overboard before it was full, then pull it aboard to fill a barrel with the flopping, squirming take. They set up a line - catch, behead, scale, gut, drop in a barrel and sprinkle salt over the top.

  ||
    They had half a dozen barrels filled when the screaming started. Two massive tentacles, thick as tree trunks, wrapped over the sides of the Lapis, flailing around until they found James and one of the sailors, wrapping around their waists and pulling them off the deck. Dangling a hundred feet over the ocean still surging with fish, their struggles were of no avail against... whatever.

    Before anyone could gather weapons, or even formulate a coherent response to the sudden invasion by the oddly non-destructive tentacles (they hadn't even knocked anything over in their questing), the monster's body rose out of the water. A giant face, a wise old man hoary with age, but green and dripping with sea water stared back at them.

    ` Why are you hurting my friends?` It rumbled in a deep masculine voice, a frown rippling across its giant brow.

    Natalie looked up at James and her sailor, hanging there, unharmed but clearly held hostage. They'd stopped struggling - being dropped would be worse than their current situation. Despite that, she felt no hostility from the creature, merely sadness. Sadness, and an overwhelming ability to destroy her ship and everyone on it. `N Sorry?` she ventured.

    ` Why? The creature almost sounded like it was whining.

    `N Um... we didn't know they were your friends. We'll stop? Please set my people down?`

  ||
    The giant-octopus / old-man / ocean-spirit let out a weary sigh, sufficient even from a hundred yards to briefly puff the Lapis' sails, and lowered the crew back to the deck. ` You hurt them.`

    `N I'm very, very sorry. May we please depart? We promise to do no more harm here.` At her gesture the rest of the crew quietly cut away the net they'd had raised halfway out of the water when the monster appeared, dropping its still squirming contents back into the ocean.

    ` Whyyyy...` The old man's face slowly slid back into the water almost without a ripple.

    `N Let's... let's not stick around waiting for him to change his mind. Everyone, full speed.` Suddenly exhausted, Natalie slumped against the ship's wheel. `N Fuck.`
  """

s.ShipStories =
  label: 'Stories on Deck'
  history:
    FirstStorm2: true
  effects:
    xp:
      Natalie: 2
  text: -> '''
  || travel/DeckNight
    In the evenings, while a pair of lookouts kept watch, most of the crew gathered on-deck to share stories and drinks and company amid the stars. Natalie made a sure to end up leaning against the same rail as one of her sailors. The ocean lapped against the hull somewhere below, mild waves gently rocking the Lapis Azurai. They talked for some time, content to watch the others from a distance, letting bonds deepen with the setting of the sun.
  '''

s.ShipTalking =
  label: 'Talking With the Crew'
  history:
    FirstStorm2: true
  effects:
    xp:
      Natalie: 2
  text: -> '''
  || travel/DeckNight
    With colder weather setting in, those not on duty preferred to gather in the cargo hold, if it was empty enough, or squeeze into the sleeping area if not. Hot and crowded was better than windy and chill, and those too near the doorway still kept cloaks on to protect against stray drafts.

    Though she often preferred to keep her own company, or entertain a smaller group in her own quarters, Natalie also made it a point to spend plenty of time mingling with the crew, especially when off duty. Aside from the purely practical considerations of keeping in touch with their mood and fostering a sense of companionship, she also found it fascinating to listen to them - why they left their homes to risk lives on the open ocean, what they wanted, who they wanted to be. She spent hours listening to and talking with the crew.
  '''

s.ShipMusic =
  label: 'Music on Deck'
  history:
    FirstStorm2: true
  effects:
    xp:
      James: 2
  text: -> """
  || travel/DeckNight
    As often as not it had rained in the evenings recently, so those not on watch found themselves crammed into the sleeping quarters. The humidity made the confines not entirely comfortable, but at least they could easily regulate temperature, between body heat and frozen rain outside.

    Tonight the crew played music, rather than talk, rain beating a staccato counterpoint on the deck overhead. A beat up old guitar was passed around, everyone who knew how to play it taking turns until it finally made its way into one particular set of hands. He was the best, and everyone knew it, strong and clear baritone voice filling the space.

    Sitting side by side on the top bunk, Natalie and James relaxed, and it wasn't long before a drowsy captain was leaning on her first mate, lulled by the soothing tones and a sad song of home-far-away. He gently shifted her to lean against the wall instead, and covered her with a blanket when the song ended.
  """

s.ShipSports =
  label: 'Sports on Deck'
  history:
    KatJoins: true
  effects:
    xp:
      Kat: 2
  text: -> """
  || travel/DeckNight
    Some evenings, once most of the day's work was done, rather than lay about and rest or play music, the crew decided to be a little more energetic. Tossing items around wasn't entirely practical on a small ship, but wrestling or running games were entirely too popular. Natalie hadn't intended to participate, but she couldn't resist when Kat bowled her over on the way to one of the goals.

  ||
    Wrapping both arms around Kat's thigh she clung on like a burr, hanging from her leg and slowing her down enough for the other team to catch up. Together Natalie and the other team wrestled away control of the colored strip of cloth that was the aim, and Kat fled back to the other side of the ship. Natalie stuck her tongue out at the thief, and she good naturedly cursed at the captain before chasing the fleeing sailor now in possession of the cloth.
  """

s.ShipPracticeCombat =
  label: 'Mock Battle'
  history:
    ColinthArrive: true
  effects:
    xp:
      James: 2
  text: -> """
  || J/Normal
    `J I'd like to run the crew through some exercises, captain.` James came up alongside Natalie, interrupting her reverie watching the horrizon.

    `N You're worried about pirates.`

    He nodded. `J The waters around Kantis and Colinth don't feel as safe as those closer to Vailia.`

    `N I doubt there's anything with a sail that can cath us here, but if one of the rowwed vessels found us while the winds unfavorable... Go ahead. A little boarding practice never hurt anyone.`

    James nodded and got to work. With much shouting and waving of arms he divided the crew up into two teams. Half of them pretended to board, while the others repelled using oars and poles wrapped in cloth as weapons. It was still unbelievably noisy as some of the sailors got very much into the spirit, with battle cries and dramatic 'death scenes' as they were slain.

    Asara stayed on the sidelines, watching. No one had any doubts over her readiness for battle.
  """

s.ShipPracticeReading =
  label: 'Shipboard Education'
  history:
    FirstStorm2: true
  effects:
    xp:
      Natalie: 2
  text: -> """
  || N/Normal
    While the world was a vast place, and Natalie had seen barely a fraction of it, the was already one of the most well-traveled and well-educated individuals in Vailia. She could read and write, which marked her as more educated than 75% of Vailians, much less smaller and less developed cities like Alkenia or Nonkenia.

    A bit of teaching was a fun way to pass the time, for those few among the crew who were interested. Natalie enjoyed discussing history, mathematics, natural history and all the other subjects she'd had the privilage to spend time learning while others were busy struggling to find enough food to eat.
  """

s.PiratesFlee =
  label: 'Running from Pirates'
  history:
    AsaraAwakens: true
  effects:
    xp:
      Natalie: 2
  text: -> """
  || travel/DeckDay
    ` Sails! Ship ahoy!` The sailor called out from her position on the starboard side of the deck, and everyone turned to look. Natalie shaded her eyes, trying to make out anything in the bright sun.

    There was indeed a dark spot on the horizon - and watching it for several minutes, one by one everyone convinced themselves it was a ship, sailing in their direction, crossing paths at an angle.

    `N Everyone take a rest, we're letting them catch us!` Natalie's shouted command slowed shipboard activity to a crawl. Meeting with another vessel out in the middle of the ocean might not be the safest possible action, and it would be good to have everyone rested and alert by the time they were close in case there was trouble. James fetched his sword, buckled it on. The rest of the crew did the same.

    Just in case.

    Coming in from the windward-side, the vessel bearing down on them was significantly larger than the Azurai, though not nearly as sleek. Harder angles, square sails, and flying no colors. Kantian, or from Colinth perhaps. Definitely not Vailian. The number of crew on its deck and their drawn weapons weren't particularly encouraging.

  || A/Scared
    Natalie's eyes found one member of the crew who didn't appear nervous. Asara was somewhere far beyond nervous, exploring the distant lands of 'frozen in fear' and 'absolutely terrified.' Her hand gripped the hilt of her sword, knuckles white. She was whispering something repetitively to herself in her own foreign tongue.

    `N Ok, change of plans. Full sail!</q> Natalie called out commands, setting the crew back in motion. They kept their weapons close at hand as they worked, canvas billowing up to catch the wind.

    Groaning against its weight, the Azurai bobbed precipitously in the wind, full sails heeling it to an uncomfortable angle before the rudder caught hold and swung the prow around. Then, like a bow sprung from an arrow, the ship surged forward. Perpendicular to the wind they cut away.

  ||
    The Azurai's crew cheered and whooped as the other ship crossed their wake, still sailing with the wind and unable to arrest its momentum in time to pursue. The pirates - for that's what they clearly were, from up close - returned the jeers and shouts, waving swords and axes, impotent as their own vessel carried them further away. Asara had disappeared somewhere belowe decks.

    Rather than joining in her crew's cheers, Natalie let out a breath she'd been holding. It'd been close.
  """

s.AbandonedShipBurn =
  label: 'Abandoned Ship'
  history:
    AsaraAwakens: true
  effects:
    xp:
      Asara: 1
  text: => """
  || travel/DeckDay
    ` Ship ahead!` The sailor sitting in the crow's nest shouted out his find, sending those on deck and free rushing to the bow. Natalie shaded her eyes, trying to make out anything against the setting sun.

    Drifting slowly closer, it became apparent that the other ship was abandoned, listing to one side as though it had taken on a great deal of water. The Azurai put on sail to approach more rapidly.

    It was more of a half-floating wreck than a real ship at this point, wind-slashed sails and rotting timbers. James suggested immediately that they fire the thing and be on their way - a funeral fitting an abandoned ship. Though there might still be cargo aboard worth salvaging, not to mention curiosity for its own sake, Natalie bowed to tradition. The decididng factor was Asara - she seemed rather uncomfortable, more so than usual even, at the thought of crossing over to take a look. Better to keep the priestess happy than rob a grave.

    Natalie ordered a bow produced, and had James soak a rag in oil. Burning an abandoned ship wasn't hard - with pitch rubbed into the hull, oil in the ropes and wax in the canvas, even a nearly-rotten hulk like this was soon ablaze. They watched solemnly, Natalie giving voice to a prayer they were all thinking.

    When the wreck finally collapsed down the middle, they set sail again. Time to get going, and hope that the Azurai never met the same fate.
  """

s.AbandonedShipSearch =
  label: 'Abandoned Ship'
  history:
    AsaraAwakens: true
  effects:
    xp:
      Kat: 1
  text: => """
  || travel/DeckDay
    ` Ship ahead!` The sailor sitting in the crow's nest shouted out his find, sending those on deck and free rushing to the bow. Natalie shaded her eyes, trying to make out anything against the setting sun.

    Drifting slowly closer, it became apparent that the other ship was abandoned, listing to one side as though it had taken on a great deal of water. The Azurai put on sail to approach more rapidly.

    It was more of a half-floating wreck than a real ship at this point, wind-slashed sails and rotting timbers. James suggested immediately that they fire the thing and be on their way, but Natalie held off. There might still be valuables aboard, and Asara seemed more curious than concerned over the idea of paying it a visit. If their resident priestess seemed unconcerned, it was worth the risk.

    Natalie led the expedition, guiding from the prow of the Azurai's longboat as they rowed in closer than she wished to risk the larger vessel. It was with a solemn air that they searched the wreck.

    While they didn't find any cargo beyond thoroughly water-ruined provisions, Kat did discover a stash of well-preserved canvas, and one of the crew stumbled upon a still-sealed barrel of pitch. Not the most glamorous of treasure, but combined with a some usable boards pried up from the deck, nothing to scoff at.
  """

s.VailianShip =
  label: 'Vailian Ship'
  history:
    FirstStorm2: true
  effects:
    xp:
      James: 1
  text: => """
  || travel/SailingDay
    Triangular sails - James was the first to spot them in the distance, another ship approaching - and he loudly guessed that it was a Vailian vessel. Despite all odds, so far from home, he was proven right half an hour later, when they were close enough to make out more details. A Vailian-made ship meant Vailian crew - the city did not sell to outsiders, jealously guarding its ship-building secrets.

  The two vessels pulled up alongside each other and, after a few shouted exchanges, two officers jumped over to the Lapis for a closer discussion. They were just as eager as Natalie and James to share news of home, and the crews spent half an hour shooting the breeze while the officers shared knowledge of the winds and currents in the area.
  """

Place.travel.Sail.stories = Object.keys(s)
for key, value of s
  Story[key] = value
