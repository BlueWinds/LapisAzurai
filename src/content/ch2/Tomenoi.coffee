s = {}

s.TomenoiArrive =
  label: 'Arrival'
  blocking: true
  history:
    TomenoiRoute: 0
  effects:
    xp:
      Natalie: 3
  text: -> """
  || N/Upset
    The keel shifted under Natalie's guidance, and the Lapis turned briefly into the wind before settling down on the other tack. She frowned in concentration - if the wind had been blowing any harder against them, she'd have settled for weighing anchor in the harbor and conducting business by boat. But the ship felt good under her hands, the crew confident and cheerful, so an upwind docking into the space between two other ships it was.

    A small crowd gathered to watch them come in, shouting advice, encouragement, or in a few cases, warning them off. Natalie ignored the noise, spun the wheel, shouted to the crew.

    `N That's it, strike the sails!` Coasting forward on its momentum, the Lapis dipped between two of the ships already docked and inched forwards towards the pier. The crew tossed lines to the dock workers, and suddenly everyone was shouting and hauling on ropes and pulling against the wind that wanted to push the Lapis sideways into one of the nearby ships.

    All in all, a rather graceful arrival given the circumstances. Natalie grinned at Kat, at James, at Asara, and hopped onto the pier.

  || places/TomenoiDay
    Tomenoi was an odd combination of bustling and dreary. The buildings looked like they could use a fresh coat of paint to hide the dirt, and the streets weren't so much "streets" as they were "beaten paths in the dust." But at the same time, those who greeted her were cheerful and loud, a mix of Vailian sailors and captains slapping her on the back and Kantian merchants and townsfolk keeping a more respectful distance.

    She hadn't seen more than a few Kantians in her life before now. Their ships were square rigged, solid but slow, making the journey to Vailia rather arduous for them. The few she had seen were mostly wealthy or powerful - the sort that could afford to take a month or more away from their affairs for a vacation at the center of the known world. The Kantians were generally darker than the Vailians, golden skin and deep brown or black waves of hair.

    ` Welcome to Tomenoi. Docking fee 2 obols per day,` His accent was heavy on the vowels and emphasis, but still easily understandable.

    Expensive. Natalie quirked an eyebrow at the man holding out his hand. `N I'll give you a half.`

    ` One and a half, and I make sure no one else unload same time you do.`

    `N You're kidding me. At Alkenia it's a quarter. Vailia doesn't even have a fee.`

    ` One obol. Those cities don't have to make a living on an otherwise barren island.`

    Natalie dug in her pocket. Better than anchoring in the bay and wasting time trying to move cargo by longboat.
  """

s.AsaraJoinsCrew =
  label: 'Asara Joins'
  history:
    TomenoiArrive: 0
    AsarasMagic: 0
  effects:
    xp:
      Asara: 3
  text: -> """
  || travel/CabinDay
    `A I will work.`

    Natalie practically jumped out of her skin. Asara had crept into the captain's captain without making a sound, coming right up behind Nat. `N What? Oh, um, right. Why?`

    `A Please let me stay here,` The young woman practically whispered. That was hardly unusual – she never seemed to make any sound, quiet as a ghost even when she had something to contribute. It wasn't, Natalie believed, healthy.

    `N You don't have to...`

    `A I am stronger than you think, Natalie. I will not blow away in the wind.`

    She didn't really know how to respond to such an accurate insight, so she stayed silent.

  || A/Sad
    `A I have a... a job? A purpose? A thing I wish to do,` she struggled for the proper word, reinforcing Natalie's conviction that she had learned Vailian only recently. Asara continued, a bit of bitterness creeping into her voice. `A But I am not yet ready, as I have learned. I would stay here a while, if you will. Your kindness in keeping me is worthy, but I wish to contribute as well.`

    `N Ah, yes, stay as long as you like. What is your task?`

    Asara shook her head. `A I am not yet ready. I shall tell you when I am.`
  """

s.StrandedShip =
  label: 'Stranded Ship'
  history:
    TomenoiArrive: 0
  effects:
    xp:
      Natalie: 3
  text: -> """
  || travel/DeckFog
    The Lapis was half a day out from Tomenoi when Kat called down from the crow's nest. `K Ship ahoy! 30 degrees starboard!` Natalie rushed up to the front of the ship, peering into the fog.

    `N Where?` Natalie looked up at the watchman, unable to make out anything other than shifting darkness.

    `K There, there!` Kat shouted and pointed impatiently.

    Natalie looked where she was pointing again. Nothing, nothing... wait, there was a darker shadow. It solidified slowly as the Lapis came closer. The other ship was drifting, no intention to its motion. She gestured to James, currently taking a turn at the helm, and her nodded. They'd go take a look, rather than let it pass silently.

    It was not a pleasant sight. The Kantian ship was missing one mast entirely, and the other square sail was ripped to shreds. Surviving a storm didn't necessarily mean living to tell the tale.

    Scattered around the deck lay men and women. They feebly struggled to their feet, calling out and waving, desperate and hopeful that someone was here to rescue them. As indeed the Lapis was. Once the crew saw the pitiful state of their fellow sailors, no order could have prevented them from bringing the ship in close, tossing over lines and bringing their compatriots aboard. Not that Natalie would have been inclined to deny aid in any case - she was merely busy opening a fresh cask of water.

    ` Akylas, captain of the Gallant, and thank the gods for your kindness,` a weather-beaten man introduced himself. He looked torn between wanting to salute her, hug her and run for the water as his crew was doing.

  || N/Normal
    `N Natalie, of the Lapis Azurai, out from Vailia. What happened?`

    The sad tale was much as she'd guessed. The Gallant had been struck by a storm just over three weeks ago, not only smashing their mast and ripping away the sails, but also flooding the cargo bay and washing away most of their supplies. They'd had plenty of food, but precious little water except when it rained.

    Natalie listened sympathetically, and patted Akylas' shoulder for reassurance. `N I think we should be able to rig something up. I can't give away all my spares, but I'm sure we have enough canvas to get you back to port.`

    ` I'm afraid I won't be able to give you anything in return. The storm took everything except our lives. But thank you for that, and for all your kindness.`

    Natalie reassured him that they'd share what they could, and shuddered. Money meant nothing compared to her pleasure that she could help one more crew return safely to port. She was captain of one of the finest ships in the world, and had her magic to protect herself - even so, the open ocean frightened her. Kantians were a brave people indeed.
  """

s.KantisRegion =
  label: 'Route to Kantis'
  history:
    AsaraJoinsCrew: 0
  effects:
    xp:
      Natalie: 3
  text: -> """
  || places/TomenoiDay
    `N I give up.` Natalie flopped back against the stone wall and slid down to the ground, ignoring the dust that puffed up around her. `N No idea where to go from here.`

    James crouched down beside her, watching the way she wrinkled her nose against the dust. `J No luck with the locals?`

    `N None. They see a Vailian, they clam right up. I thought they might be more open than the Guild with their maps, but no luck at all. I still don't understand why Janos didn't just give me a full rutter for the region - Tomenoi's a great way point, and there's plenty of trading to be done here, but he asked me to deliver a letter to Kantis, then only gave directions halfway there.` She sighed and rubbed her eyes, followed by a cute little sneeze.

    `J Why don't we just head back to Vailia and ask him? We can load up on cargo here, it won't be a waste of a trip. Have you tried these the dates? They're quite good, and would be an excellent novelty back home.`

    She let him put a piece of fruit in her mouth, but didn't let herself be distracted. `N That would be as much as admitting I can't figure it out. He always has a reason for what he does, and usually several.`

    `J I'm sure you'll figure something out.` James pressed the bag of dates into her hand, and leaned back against the wall himself. `J Don't worry about it so much.`
  """

s.KantisRegion2 =
  label: 'Route to Kantis'
  history:
    KantisRegion: 0
  effects:
    xp:
      Asara: 3
  text: -> """
  || places/TomenoiDay
    ` Priestess.`

    Asara turned slowly at the unexpected greeting. Busy day and night, dealing with goods from the Kantian region and from Vailia, Asara's ears none the less picked out one subtle word directed at her from all the noise filling Tomenoi's market. It had been little more than a whisper. One of the cooks at a food stall gave her a brief bow when he noticed her attention. Asara nodded, and he turned back to his stove before anyone else could notice the exchange.

    She found a seat nearby and waited. An hour passed. Two. Finally, he approached her.

    ` Apologies for the delay, priestess. It is hard to find work here, and I could not leave my post until now.`

  || A/Tentative
    `A You live here?` she inquired. She'd been surprised to see another one of her people so far from home, but he was here, and there might be something he could do.

    ` There are more of us here than you might think,` he smiled. ` And not all who move beyond the desert forget what we are owed. How may I help you?` They looked little alike - his black hair and dark brown eyes compared to her own silver and blonde, but if one looked beyond the coloration, the resemblance was strong.

    Asara nodded, and he took a seat beside her. `A I need a map to Kantis.`

    ` I heard a Vailian witch asking for the same thing. Is this related?`

    `A It is the same request.`

    He nodded. ` Vailian, that is the trouble. Kantis thinks there are quite enough of them crawling around already. Being a witch helps in their eyes, but not enough. I shall see what I can arrange. I... I am not a rich man. You know I will give you all I have, but...`

    `A You could hardly stop Natalie from showering you with coins. Wind at thy back,` she invoked the ritual words.

    ` Thank you, priestess. You are kind.` He returned the correct response. He stood, bowed, and slipped back into the crowd. Asara's eyes smile faded. A taste of home like that should have been comforting, but all she could taste was ash. She fled for the docks and her room aboard the Lapis before her stoic mask could dissolve entirely.
  """

s.KantisRegion3 =
  label: 'Route to Kantis'
  blocking: true
  history:
    KantisRegion2: 0
  effects:
    xp:
      Asara: 2
  text: -> """
  || travel/CabinNight
    `N Were did you get this?`

    Asara shook her head.

    `N I won't tell anyone.` She sighed and leaned back in her seat, backing away from the still standing woman. `N I want to help, Asara, I really do. But I can't do anything if you won't talk with me. Please?`

    Asara started to shake her head again, then shuddered and stopped. Pushing people away was easy. She was very good at at. But... she forced herself to meet Natalie's gaze. Maybe. Maybe she could try. `A It is... I saw you could not do this alone. So I asked some of my people to help.`

    `N Your people?` Natalie leaned closer again, interest piqued.

    Asara shook her head again. Too much sharing. Maybe later, once she'd seen that Natalie wouldn't try to hurt her with this information. Maybe.
  """

s.TomenoiHistory =
  label: 'History'
  history:
    TomenoiArrive: 0
  effects:
    xp:
      Kat: 3
  text: ->"""
  || places/TomenoiDay
    Too much James brooding. Too much Asara brooding. Too much Natalie hovering over them and pretending not too. Kat went for a walk. Too much everyone being idiots and not talking to each other the way they should.

    Following a well-worn path alongside the stream, Kat left the trading post and explored up towards its source. She soon found a spring, bubbling out from the side of a mossy boulder into a pleasant little pool. Shaded by trees, the glen was cool and sheltered. A simple wrought iron bench sat near the pool.

    Something about the spring itself caught Kat's attention, and she took a closer look. Bending down, she saw that beneath the moss, the boulder had a smooth, flat surface. She brushed some of the dirt away, pausing to flick cold water over her face. It was a warm day. Definitely not natural.

    Finally, her probing fingers felt something different - faint scratches in the rock, growing deeper and more distinct as she rubbed dirt and much out of them.

    ` ...flow eternally, as a symbol of our dedication that this may never happen again.
      - Rheia Vailia
      8th of Ascending Fire, year 23 of the new era`

    Kat pulled her hand back, suddenly unwilling to touch the stone any further. Too much history.
  """

Place.Tomenoi.stories.Ch2 = Object.keys(s)
for key, value of s
  Story[key] = value
