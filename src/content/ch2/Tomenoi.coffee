s = {}

s.TomenoiArrive =
  label: 'Arrival'
  blocking: true
  required: 'GameOverExploration'
  history:
    TomenoiRoute: true
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
  required: 'GameOverKindness'
  extraDays: 65
  history:
    AsarasMagic: true
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
    KantisRegion3: true
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
  required: 'GameOverExploration'
  extraDays: 10
  history:
    AsaraJoinsCrew: true
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
  required: 'GameOverLove'
  extraDays: 30
  history:
    KantisRegion: true
  effects:
    xp:
      Asara: 3
  text: -> """
  || places/TomenoiDay
    ` Priestess.`

    Asara turned slowly at the unexpected greeting. Busy day and night, dealing with goods from the Kantian region and from Vailia, Asara's ears none the less picked out one subtle word directed at her from all the noise filling Tomenoi's market. It had been little more than a whisper. One of the cooks at a food stall gave her a brief bow when he noticed her attention. Asara nodded, and he turned back to his stove before anyone else could notice the exchange.

    She found a seat nearby and waited. An hour passed. Two. Finally, he approached her.

    ` Apologies for the delay, priestess. It is hard to find work here, and I could not leave my post until now.`

  || A/NormalFull
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
  required: 'GameOverLove'
  history:
    KantisRegion2: true
  effects:
    xp:
      Asara: 2
  text: -> """
  || travel/CabinNight
    `N Were did you get this?`

    Asara shook her head.

    `N I won't tell anyone.` She sighed and leaned back in her seat, backing away from the still standing woman. `N I want to help, Asara, I really do. But I can't do anything if you won't talk with me. Please?`

    Asara started to shake her head again, then shuddered and stopped. Pushing people away was easy. She was good at at. But... she forced herself to meet Natalie's gaze. Maybe. Maybe she could try. `A It is... I saw you could not do this alone. So I asked some of my people to help.`

    `N Your people?` Natalie leaned closer again, interest piqued.

    Asara shook her head again. Too much sharing. Maybe later, once she'd seen that Natalie wouldn't try to hurt her with this information. Maybe.
  """
  apply: ->
    g.reputation.Colinth = 0
    g.reputation.Kantis = 0

s.TomenoiHistory =
  label: 'History'
  history:
    TomenoiArrive: true
  effects:
    xp:
      Kat: 3
  cost: 2
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

s.SailorTroubles =
  label: 'Sailor Troubles'
  history:
    KantisRegion3: true
  effects:
    xp:
      James: 3
  text: ->"""
  || travel/DeckNight
    `J Natalie, can we talk?` James pulled her aside as she was about to leave the ship, gesturing to her cabin. Seeing his serious expression, she nodded.

    He closed the door behind them and leaned against it with a sigh. `J I hate bringing you into this, but I need a captain's decision.`

    `N What do you need from me?`

    `J So far as first mate I've kept crew discipline with a pretty light hand, and it's worked well. Most of them are more experienced than either of us.`

    `N I offered good pay on a brand new ship with the Guildmaster's personal attention,` Natalie ticked off her advantages on one hand. `N I had a good selection to hire from.`

    `J Yeah.` He glanced at the floor, rubbed at a dirty spot with his boot. `J Cimarin is giving me trouble. He works hard when either of us are looking, but shirks off if he thinks I'm not paying attention. Has to be ordered to do things, doesn't take any initiative. It rubs everyone else wrong. And... well, I've tried some of the lesser punishments to no effect. He keeps pushing.` James' unusual verbosity gave way to silence, and he crossed his arms over his chest.

  || J/Upset
    `J Nat, do you want me to fire him or flog him?`

    Natalie didn't answer immediately. Flogging was normal enough - on some vessels for offenses far less severe than 'pushing' the first mate. Did she want it on her ship? Did she want James to do it? It would have to be him. While she took many tasks aboard ship, Natalie was not and never would be as strong as him.

    `N Weigh it for me.`

    `J We can be light handed by one until we get back to Vailia, that won't be a problem. Tomenoi's pretty far from home, but losing this post won't stop him finding another easily enough. It'd set a bad precedent though, marking us as soft. Traditions are traditions for a reason, and trying to be nice won't do us any favors.`

    `N But you want to do it anyway. Why?`

    `J I just keep thinking how pleasant it would be to wipe that smirk off his face. I'm worried I'll enjoy hurting him if we go that route.`

    `N  James. Look at me. I've been watching Cimarin too. Now, you need to do your job as first mate, do what needs to be done to keep order aboard the ship. That's an order.`

  || N/Normal
    `N Nothing wrong with liking to hurt people. Cimarin doesn't want it though, so it wouldn't be ok to do this for fun.` She reached over to flick him in the nose. He flinched. `N You're not doing this for fun though, you're doing it because it needs to be done. Keep them separate. It's why I poke you so much.`

    `J What?`

    She laughed at his confused expression, poked him again, this time in the ribs. `N Hurting people is fun. You ever want some bite marks, you know where to find me.`
  """


s.AsaraCh3 =
  label: 'Chapter 3 - Asara'
  required: 'GameOverLove'
  requiredGroup: 'Ch2Routes'
  history:
    AsarasTrauma: true
  effects:
    xp:
      Natalie: 2
  cost: 0
  text: -> """
  || A/Crying
    A feeling of presence, of patient waiting filled Natalie's bedroom – someone was at the door. She rubbed bleary eyes, drawn up out of a heavy sleep by the sensation. She slipped a sweater over bare shoulders and went to open the door.

    Asara stood in the doorway, waiting in the darkness. Natalie wondered how long she'd been waiting there, saying nothing, without knocking. Silence stretched between them, and Natalie saw that Asara's cheeks were wet, eyes red and puffy . It didn't feel right to say anything, so she didn't, just stepped to the side and waited for the young woman to enter. The priestess. It was hard to know what to think of her, perched on the border between terrifying power and fragile girl, attractive equal and helpless innocent in equal measure.

    Asara closed the door behind her, leaving them alone together in the darkness, only moonlight from the small window to give shadowy form to the room's contents. Another moment of silence.

    `A Can I kiss you?`

    The words froze Natalie in place, catching her completely off guard. Her throat went dry. Her heart pounded.

    `A I'm sorry, I just...` Asara's voice came out strangled.

    <button onclick="Story.continueWith('AsaraCh3Yes')">`N Please, don't apologize,`</button> <button onclick="Story.continueWith('AsaraCh3No')">`N Are you sure?`</button>

    <i>Accepting her will commit you to Asara in Chapter 3, while hesitating will lock out her route. No second chances.</i>
  """

s.AsaraCh3Yes =
  label: 'Chapter 3 - Asara'
  required: 'GameOverLove'
  requiredGroup: 'Ch2Routes'
  history:
    AsaraCh3: true
  effects:
    xp:
      Asara: 10
  text: -> """
  || N/Embarrassed
    `N No, please, don't apologize,` Natalie interrupted. She reached out carefully with one hand, brushing her fingertips softly across Asara's cheek. The other woman tensed, but didn't flinch back. Her cheek was cold.

    Asara gently caught Natalie's hand in both of hers, held the fingers, pressed them against her lips. Natalie felt her heart pounding so loudly that it must have been audible clear across the room. It was... she hadn't felt this nervous in... well, ever.

    Asara moved her lips down and kissed Natalie's wrist, carefully, as if afraid that it might shatter in her hands, or reach out and strike her in sudden anger. Natalie raised her other hand to touch Asara's cheek again, but the silver-eyed beauty caught it with one hand, gently lowered it back to Nat's side. She kissed Natalie's wrist again, sending shivers up her spine, and then let go her hand and stepped closer.

    For a brief moment Natalie felt lips brush across her own, a warm caress that and left her dazed. She blinked, and the feeling was gone - not only the kiss, but also the feeling of Asara's presence, the other silhouette in the darkness. Though she hadn't noticed any movement, and certainly hadn't seen the door open, she was again alone in her room.
  """
  apply: ->
    g.chapter = 'Ch3'
    Game.showOverlay('<h1>Chapter 3</h1><h3>Asara</h3>', 0, 'chapter overlay')

s.AsaraCh3No =
  label: 'Chapter 3 - Not Asara'
  history:
    AsaraCh3: true
  effects:
    xp:
      Asara: 3
  text: -> """
  ||
    `N Are you sure?` Natalie interrupted the confession by laying a hand on Asara's shoulder. She twitched, startled by the contact, but at least she didn't shy away. Progress. `N I like you too, Asara, I like you a great deal, and nothing would make me happier than to kiss you right now. But are you sure it's what you want? I know... I know people who have gone through what you've gone through, and I know how much it makes you want someone to hold you and protect you, and I will do that, same as I have been, but I don't want to take advantage...` The words came out in a jumbled mess, rushing out until Natalie had to stop for breath. She dropped her hand, too embarrassed to keep touching Asara's shoulder.

    Silence stretched out again. Asara was as silent as ever - even her breathing was too quiet to hear, a ghost of a person, a dark outline, yet intensely present in Natalie's awareness.

    `N Please, I'm not saying no, just... I'm confused, Asara, and I don't want to make a mistake because we both thought we knew what we wanted.` Natalie blinked. The sense of presence was gone. Though she hadn't seen the door open, certainly hadn't noticed any movement, she was alone in her room.
  """

Place.Tomenoi.stories.Ch2 = Object.keys(s)
for key, value of s
  value.place = 'Tomenoi'
  Story[key] = value
