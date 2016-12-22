p = {}
p.MtJuliaArrive =
  label: 'Arrival'
  blocking: true
  history:
    ReadyToGo: 0
  experience:
    James: 3
    Natalie: 3
  text: -> """
  || bg=places/MtJuliaDay
  Mount Julia loomed up out of the ocean, a jagged peak that had been growing on the horizon all day. If the current wind held steady, the Lapis would arrive just after midnight – enough time for everyone to rest and catch their breath before exploring the city in the morning. A week of sailing had settled the crew into a comfortable routine. James often took the night shift, watching the helm while the captain slept, and some of the more experienced sailors were finally starting to warm up tho Natalie and respect her judgement.

  Though the crew was still perhaps a little small should they encounter rough weather, they'd done admirably so far. They'd also been lucky, sailing in clear weather and steady wind - an auspicious beginning for a first voyage. Hopefully the trip home would be as smooth.

  || bg=travel/DeckDay left=Natalie/happy
  -- `N Tell James what you were telling me last night,` Natalie waved over one of the sailors and her Quartermaster. He saluted the officers, bringing a smile to Natalie's face – she loved that feeling – and began again.

  || right=SailorMale/normal
  ` Mount Julia's not much more than a couple of warehouses, some wharves and an inn. I last sailed here about two years ago, and I don't imagine much has changed. The area's too rugged to support a real town, and there are... things... in the forset, but the natural harbor is such a good layover on the way out from Vailia that only idiots don't take the chance to top off supplies and rest a night on shore. Begging your pardon, ma'am,` he repeated the salute.

  || left=N/normal
  -- `N Don't worry, we'll be staying at least a day. Thank you,` Natalie waved him away. To James, `N I'm intending to sell our cargo here, rather than haul it further. Slim profit, but I want to take this first trip easy. We've been lucky with the weather. Let's not push it before we have a chance to debrief and hire more crew.`

  || right=J/normal
  `J I'll get everything cleaned up and check over the ship while you find a buyer.` He nodded, glancing behind them at the cargo hold. Several items hadn't been secured properly in the haste to depart, and one cask of fresh water had sprung a leak from the banging around.

  || left=N/normal
  -- `Good. I hardly expect to make more on this trip than I've spent in supplies and wages, but it'll be worth it for a shakedown cruise. Let's not waste time.`
  """

p.CheckShip =
  label: 'Check for Damage'
  history:
    MtJuliaArrive: 0
  experience:
    James: 3
  text: -> """
  || bg=places/MtJuliaDay
  The Azurai shouldn't have taken any damage from such a minor voyage in calm weather, but it didn't hurt to check. James stripped down to his trunks – any issues would begin below the waterline on the outside of the hull long before they became visible to the occupants.

  || left=J/embarrassed
  He shook his head as someone whistled behind him, but he refused to dignify the catcall with a glance. Let Natalie have her fun. Or one of the sailors, if they were so bold. He didn't really want to know who it was. Yes he did, actually, but he still wasn't going to turn his head to look.

  || bg=travel/ShipDay
  -- He dove over the rail, hitting the icy water with nary a splash. The ocean water stung his open eyes for a moment, but he spun around and began inspecting the hull for damage without surfacing. No child in Vailia avoided learning to swim – if not intentionally, then at least when older children threw you over a cliff into the ocean.

  || bg=travel/DeckDay
  -- `J Nothing. We're clean.` James accepted the towel from a sailor, tussling it through his hair and rubbing the water off his back. No scrapes, no barnacles, no leaks.  The Guild hadn't skimped in giving Natalie a good vessel. The Lapis Azurai was a solid ship, straight out of the Vailian shipyards, not some rickety junk from Kantis. If there were ships anywhere in the world to match Vailian ones, even rumor hadn't reached James' ears.
  """

p.VisitInn =
  label: 'Visit Inn'
  history:
    MtJuliaArrive: 0
  experience:
    Natalie: 3
  text: -> """
  || bg=places/Tavern
  Natalie was surprised, walking in, to see a little girl tending the bar. Perhaps twelve, she smiled and greeted Nat with a cheerful wave, not pausing in her current attempt to mop the floor into some state of cleanliness. Rather than spilled beer, though, her main enemy at the moment seemed to be leaves, seeds, and other detritus from the forest. It wasn't hard to understand why – other than the Azurai, there are no other ships docked in the bay.

  -- ` What can I gettcha?

  || left=N/normal
  `N Nothing right now, thank you. Where are your parents?`

  ` Out back. But I can do anything ya'need. Don't be bothering 'em.`

  || left=N/normal
  `N Well, I suppose. I have some goods to deliver from Vailia. And I suppose, given that there's no one else here, you're the target of 'you'll know who to give it to.' It was all nice and mysterious.`

  ||
  -- ` Yep, you can leave 'em with me. Getting a shipment from home is always much more interesting'an watching you an' a buncha rowdy sailors get shitfaced.` She lay her broom aside with a grin, rubbing her hands together gleefully.

  ` Easier to clean up after too. So, what'cha got for me?`
  """

p.MeetAsara =
  label: 'Castaway'
  history:
    FirstStormSick: 0
  experience:
    Natalie: 2
  text: -> """
  || bg=travel/cabinNight
  Natalie stood up suddenly, hair prickling along the back of her neck. It felt... it felt like a storm, but not a storm. Powerful magic was being unleashed nearby. She threw open her door and dashed on-deck.

  || bg=travel/deckNight
  -- It wasn't hard to find the source, with the entire crew staring in one direction. A distant pillar of silvery flames burned up from the horizon, tiny with distance, but huge to be visible so far out to sea. And intense. It cast shadows.
  `N All hands on deck!` She shouted, rousing those - like James - who hadn't yet appeared, and to stop everyone staring and start them moving. `N We're going to investigate.`

  || right=J/normal
  `J Nat?` James came up beside her, still shrugging on his boots. He rubbed sleep from his eyes. `J What is it?`

  || left=N/normal
  -- `N It's...` She hesitated, not really wanting to explain. The flames drew her eyes – she could hardly look away. It was the stuff of her nightmares. She knew that color, had dreamt those silver flames engulfing the world. But somehow... somehow they didn't feel dangerous, right now. Desperate, not dangerous.

  || right=J/normal
  `J Nat?`
  She shook herself free of the dream's grip. `J It'll be fine.`
  He shook his head at the non-answer. and turned to help with the anchor.

  || bg=travel/sailingNight
  -- The beacon lasted for half an hour before guttering out, and with it the sense of magic at play, but by that time Natalie had a good enough idea of its location to guide the Azurai. She knew they were getting close when they first sighted debris – shattered and burned wood, ash-blackened taters of rope.

  -- They slowed, moving through the field of detritus, first finding only splinters, then fragments of board and then bodies. Not survivors, clearly – they floated face down in the water, as burned and shattered as their vessel around them. The Azurai nosed aside a broken mast.

  Finally, at the center of the devastation, they found something. Sweeping a lantern beam across the water, James let out a cry and pointed. Amid the ocean of blackened soot and rent wood, a flash of white – a body, naked and seemingly unharmed. They drew it out of the water with a net.

  || bg=travel/deckNight
  -- A survivor. She coughed and shuddered as they lowered her on the deck, then lay still. A young woman – barely more than a girl – slender and pale-skinned, completely naked except for a metal collar and a manacles binding her wrists and ankles. The metal was twisted and warped, as though it had melted hot enough to start dripping over her bare flesh.

  Natalie draped a blanket over her, reached down to feel her forehead. She flinched away from the touch, and Natalie withdrew her hand. James reached down to pick her up, provoking a much more violent reaction – the girl moaned painfully, curled up into a ball beneath the blanket and began to sob.

  -- Everyone looked around uncertainly – surely they couldn't just leave her there on the deck – until Natalie shook her head and took charge again. `N Get us out of here and back towards Mt. Julia. James, I don't care if she shrieks, bring her to my cabin.`

  || bg=travel/cabinNight
  -- The girl struggled feebly in James' arms and sobbed horridly, but he did as ordered, grimacing at the horrid sobs provoked by his touch.

  Natalie drew aside the blankets as he lay the girl in her bed. She leaned in and, again despite the girl's feeble protests, held her wrists to examine the manacles. They were meant to be bolted to a wall, and probably had been until... something. Though the steel had bubbled and dripped, the skin beneath wasn't even red. Natalie drew the blanket up over her again, hiding her nakedness. She gestured, and they stepped back out on deck, closing the door behind them.

  || bg=travel/deckNight left=N/uncertain
  -- `N Did you see the bruises?` Natalie hated the conclusions she'd come to.
  || right=J/uncertain
  `J Wrists, neck, brea... other places...` he nodded unhappily. `J What was that fire?`
  || left=N/uncertain
  `N Nothing we can do until morning. Back to Mt. Julia, and we'll proceed as planned tomorrow.` She ignored the question.
  || right=J/uncertain
  `j Nat...` he searched her face uncomfortably. `J Is she a demon?`

  || left=N/uncertain
  -- Natalie bit her lip, and after a moment shook her head. `N I don't know. But what can we do, just leave her there floating in the wreckage?`

  || right=J/uncertain
  `J Of course not! I just... I can't...` he trailed off, glancing behind the ship, back into the heart of a vessel larger than the Lapis reduced to splinters. `J You should keep watch over her. She's not as afraid of you as she is of me.`

  || left=N/uncertain
  `N I will. I'd tell you to get some sleep, but I know it wouldn't work.`  She squeezed his shoulder with one hand. `N I'll watch over her.`
  """

p.AsaraAwakens =
  label: 'Castaway'
  history:
    MeetAsara: 0
  experience:
    Natalie: 2
    Asara: 5
  text: -> """
  || bg=travel/cabinDay
  The Azurai's passenger had nightmares. Terrible, screaming terrors that roused the whole ship before Natalie could sahke her free of them, though the physical contact seemed to reinforce the fear rather than assuage it. Still, Natalie figured, passing out from terror and resting peacefully must be better for her recovery than thrashing and screaming. It became a nightly routine.

  -- Her bruises healed with amazing speed, fading from fresh red to purple and yellow in a single day, gone entirely by the end of the second. Though they'd have liked to free her hands and feet, until she stopped moaning and struggling at any human touch, no one was willing to force the issue.

  -- It took longer than that before their passenger woke enough to do more than take a few sips of water or broth and pass out again. Natalie was plotting their progress on a chart when she heard a sound behind her, a shifting of cloth and a rustle of movement... the links of the manacles descended around her throat, threatening to choke her. Only threatening – they were tight but not yet difficult to breathe around.

  || center=A/afraid center=N/uncertain
  -- `A لا تصرخ. يمكنني كسر العنق.` The girl whispered gibberish in her ear.
  `N Please, I only want to hel-hurk...` Natalie's voice was choked off mid-sound, though the chain relaxed again soon after. Despite the danger in the situation, she couldn't help but notice the naked body pressed against her back, hot breath tickling her ear.
  `A I'll snap your neck if you scream,` the girl's voice was a hoarse hiss in her ear, accent strong but perfectly understandable.

  -- Natalie nodded, feeling the strength in her captor's hold, irresistable despite the fact that the threatener was centimeters shorter.
  `A What do you want from me?`
  `N I want-` the chain strangled her again briefly, and she gasped for breath when she could. Natalie continued more quietly. `N I want to help. We rescued you from the wreckage.`

  || right=A/normal
  -- That seemed to satisfy her. The chain relaxed around Natalie's neck, then  the girl stepped back, all sense of menace fading. Natalie stood and turned to face her. She huddled back against the bed, arms crossed over her breasts and looking quite thoroughly miserable.

  || left=N/normal
  `N Here, let me get you a robe.` Natalie dug through her closet, and produced a black nightgown to drape over the girl's shoulders.

  ||
  -- `J Nat, everything alright?` James knocked lightly on the door. The girl jerked at the sound, then calmed a little as Natalie held up her hands reassuringly.

  || left=N/normal
  `N Fine, fine. Bring breakfast for two, would you?` Back to her skittish and no-longer-nude guest, `N What's your name?`

  || right=A/normal
  `A A... Asara.` She looked both scared and hopeful as she said the name, as though it should mean something all by itself without explanation.

  || left=N/normal
  -- `N I'm Natalie. We're a merchant ship, currently docked at Mt. Vailia...` Her guest seemed to relax slightly, her shoulders losing some of the tension that had marked her posture so far. Sensing that it wasn't the content of the words so much as the mere act of friendly conversation, Natalie continued her introduction, starting with herself and widening out to the ship, the rest of the crew, Vailia... really, she just kept talking about anything and everything, initially with purpose and then just rambling about whatever came to mind to keep up the stream of words.

  -- James delivered the meal, but Natalie accepted it through a cracked door and shook her head in answer to his wordless questions – later – and closed the door on him.
  Asara flinched as Natalie came too close with the food, so she instead set it on the bed and gestured her guest to pick it up. Asara did so, but didn't take a bite of the bread until she'd seen Natalie swallow hers first.

  -- While they ate in silence, except the clanking of chains, Natalie finally had a chance to examine her Asara while awake. She wasn't as delicate as she'd seemed while sleeping – her arms had strength, and wasn't afraid to use it violently. Her entire aspect was controlled, no wasted movements or unconscious gesturing. Dangerous. Natalie didn't doubt the girl could and would have killed her had her earlier answers proven unsatisfactory. Asara noticed her staring, and Natalie looked away.

  || right=A/normal
  -- `A Please remove these,` She set aside the half finished buttered-roll and rattled her chains. She didn't make a face – she made very few expressions – but Natalie could tell that she didn't like the taste.

  || bg=travel/deckDay left=N/normal
  `N Of course, sorry, let's go below to where the tools are.` Natalie opened tho door and stepped out – several of the crew were around and looked at her curiously, but quickly scattered when she gestured them to clear the area. Asara hesitated at the doorway, then stepped out onto the deck. She glanced around, then nodded approval at Natalie to lead the way.

  -- In the cargo hold, James had anticipated their need, and had ready a chisel and hammer. Poking her head through the door, Asara saw him, sucked a breath through her teeth and retreated back on deck.

  || left=N/normal
  `N What's wrong?`

  || right=A/afraid
  `A Please find me clothing.`

  || left=N/normal
  -- `N You can't put on a shirt or pants until we break the links. It'll be just a moment...` Natalie trailed off as the girl closed her eyes and took in a deep breath. She was trembling. `N ...we can work out something. A wrap, maybe. Better than a robe draped over you.` She patted Asara on one shoulder. A mistake – their guest burst into tears, and fled back to the safety of Natalie's room, slamming the door behind her.

  ||
  -- Natalie stood outside her cabin, listening to her sobs. Eventually, it was too painful – she knocked, lightly. `N I'm sorry, we don't have to go down there. I'll bring the tools up, and we can do it in there...` No response. She sat down, back to the door and waited, cradling her head in her hands. James checked on her, but she waved him quiet before he spoke – it had been the sight of him that set Asara off in the first place.
  What a mess.
  """

Place.MtJulia.pages.Ch1 = Object.keys(p)
for key, value of p
  Page[key] = value
