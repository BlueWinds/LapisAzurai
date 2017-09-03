s = {}
s.MtJuliaArrive =
  label: 'Arrival'
  blocking: true
  history:
    ReadyToGo: -1
  effects:
    xp:
      James: 3
      Natalie: 3
  text: -> """
  || places/MtJuliaDay
    Mount Julia loomed up out of the ocean, a jagged peak that had been growing on the horizon all day. If the current wind held steady, the Lapis would arrive just after midnight – enough time for everyone to rest and catch their breath before exploring the city in the morning. A week of sailing had settled the crew into a comfortable routine. James often took the night shift, watching the helm while the captain slept, and some of the more experienced sailors were finally starting to warm up tho Natalie and respect her judgment.

    Though the crew was still perhaps a little small should they encounter rough weather, they'd done admirably so far. They'd also been lucky, sailing in clear weather and steady wind - an auspicious beginning for a first voyage. Hopefully the trip home would be as smooth.

    `N Tell James what you were telling me last night,` Natalie waved over one of the sailors and her first mate. He saluted the officers, bringing a smile to Natalie's face – she loved that feeling – and began again.

  || Sailors/MNormal
    ` Mount Julia's not much more than a couple of warehouses, some wharves and an inn. I last sailed here about two years ago, and I don't imagine much has changed. The area's too rugged to support a real town, and there are... things... in the forest, but the natural harbor is such a good layover on the way out from Vailia that only idiots don't take the chance to top off supplies and rest a night on shore. Begging your pardon, ma'am,` he repeated the salute.

    `N Don't worry, we'll be staying at least a day. Thank you,` Natalie waved him away. To James, `N I'm intending to sell our cargo here, rather than haul it further. Slim profit, but I want to take this first trip easy. We've been lucky with the weather. Let's not push it before we have a chance to debrief and hire more crew.`

    `J I'll get everything cleaned up and check over the ship while you find a buyer.` He nodded, glancing behind them at the cargo hold. Several items hadn't been secured properly in the haste to depart, and one cask of fresh water had sprung a leak from the banging around.

    `N Good. I hardly expect to make more on this trip than I've spent in supplies and wages, but it'll be worth it for a shakedown cruise. Let's not waste time.`
  """

s.CheckShip =
  label: 'Check for Damage'
  history:
    MtJuliaArrive: 1000
  effects:
    xp:
      James: 3
  text: -> """
  || places/MtJuliaDay
    The Azurai shouldn't have taken any damage from such a minor voyage in calm weather, but it didn't hurt to check. James stripped down to his trunks – any issues would begin below the waterline on the outside of the hull long before they became visible to the occupants.

    He shook his head as someone whistled behind him, but he refused to dignify the catcall with a glance. Let Natalie have her fun. Or one of the sailors, if they were so bold. He didn't really want to know who it was. Yes he did, actually, but he still wasn't going to turn his head to look.

    He dove over the rail, hitting the icy water with nary a splash. The ocean water stung his open eyes for a moment, but he spun around and began inspecting the hull for damage without surfacing. No child in Vailia avoided learning to swim – if not intentionally, then at least when older children threw you over a cliff into the ocean.

    `J Nothing. We're clean.` James accepted the towel from a sailor, tussling it through his hair and rubbing the water off his back. No scrapes, no barnacles, no leaks.  The Guild hadn't skimped in giving Natalie a good vessel. The Lapis Azurai was a solid ship, straight out of the Vailian shipyards, not some rickety junk from Kantis. If there were ships anywhere in the world to match Vailian ones, even rumor hadn't reached James' ears.
  """

s.VisitInn =
  label: 'Visit Inn'
  history:
    MtJuliaArrive: 1000
  effects:
    xp:
      Natalie: 3
  text: -> """
  || places/Tavern
    Natalie was surprised, walking in, to see a little girl tending the bar. Perhaps twelve, she smiled and greeted Nat with a cheerful wave, not pausing in her current attempt to mop the floor into some state of cleanliness. Rather than spilled beer, though, her main enemy at the moment seemed to be leaves, seeds, and other detritus from the forest. It wasn't hard to understand why – other than the Azurai, there are no other ships docked in the bay.

    ` What can I gettcha?

    `N Nothing right now, thank you. Where are your parents?`

    ` Out back. But I can do anything ya'need. Don't be bothering 'em.`

    `N Well, I suppose. I have some goods to deliver from Vailia. And I suppose, given that there's no one else here, you're the target of 'you'll know who to give it to.' It was all nice and mysterious.`

    ` Yep, you can leave 'em with me. Getting a shipment from home is always much more interesting'an watching you an' a buncha rowdy sailors get shitfaced.` She lay her broom aside with a grin, rubbing her hands together gleefully.

    ` Easier to clean up after too. So, what'cha got for me?`
  """

s.MeetAsara =
  label: 'Castaway'
  required: true
  history:
    FirstStormSick: 1000
  effects:
    xp:
      Natalie: 2
  text: -> """
  || travel/SilverFire
    Natalie stood up suddenly, hair prickling along the back of her neck. It felt... It felt like a storm, but it wasn't. Powerful magic lashed the sea and sky. She threw open her door and dashed on-deck.

    It wasn't hard to find the source. The entire crew stared at a distant pillar of silvery flames burning on the horizon. It was tiny with distance, but huge to be visible so far out. And intense. It cast shadows.

    `N All hands on deck!` She shouted, rousing those who hadn't yet appeared and setting everyone in motion. `N We're going to investigate.`

    `J Nat?` James came up beside her, shrugging on his boots and rubbing sleep from his eyes. `J What is it?`

    `N It's...` She hesitated, not wanting to explain. The flames drew her eyes – she could hardly look away. It was the stuff of her nightmares. She knew that color, had dreamt those silver flames engulfing the world. But somehow... somehow they didn't feel dangerous right now. Desperate, but not dangerous.

    `J Nat?`

    She shook herself free of the dream's grip. `J It'll be fine.`

    He shook his head at the non-answer and turned to help cast off the ropes.

  || travel/SailingNight
    The beacon and the sense of wild power only lasted for half an hour before guttering out. Natalie's own magic relaxed again, quieting her headache, but by then she had a good enough idea of its location to guide the Azurai. She knew they were getting close when they first sighted debris – shattered and burned wood, ash-blackened tatters of rope.

    They slowed, moving through the field of detritus at first finding only flinders, then fragments of board and then bodies. Not survivors, clearly – they floated face down in the water, as burned and shattered as their vessel around them. Rough clothing. Many of them had carried weapons. The Azurai nosed aside a broken mast.

    Finally, at the center of the devastation, they found something different. Leaning over the water with a lantern, James let out a cry and pointed. Amid the soot-black ocean and rent wood, a flash of white – a body, naked and seemingly unharmed. They drew it out of the water with a net.

  || N/Upset
    A survivor. She coughed and shuddered as they lowered her on the deck, then lay still. A young woman – barely more than a girl – slender and pale-skinned, completely naked except for a metal collar and manacles binding her wrists and ankles. The metal was twisted and warped, as though it had melted hot enough to start dripping over her bare flesh.

    Natalie draped a blanket over her, then reached down to feel her forehead. The girl flinched away from the touch, so Natalie withdrew her hand. James reached down to pick her up, provoking a much more violent reaction. The girl moaned painfully, curled up into a ball beneath the blanket and began to sob.

    Everyone looked around uncertainly – surely they couldn't just leave her there on the deck – until Natalie shook her head and took charge again. `N Get us out of here and back towards Mt. Julia. James, I don't care if she shrieks, bring her to my cabin.`

  || travel/CabinNight
    The girl struggled feebly in his arms, but James did as ordered, grimacing at the horrid sobs his touch provoked.

    Natalie drew aside the blankets as he laid the girl on her bed. She leaned in and, again despite the survivor's feeble protests, held her wrists to examine the manacles. They were meant to be bolted to a wall, and probably had been until... something. Though the steel had bubbled and dripped, the skin beneath wasn't even red. Natalie drew the blanket up over her again, hiding her nakedness. She gestured, and they stepped back out on deck, closing the door behind them.

    `N Did you see the bruises?` Natalie hated the conclusions she'd come to.

    `J Wrists, neck... other places... And her chains.` he nodded unhappily. `J Anything that can soften steel like that ought to have killed her. What was that fire?`

    `N Nothing we can do until morning. Back to Mt. Julia. We'll proceed as planned tomorrow.` She ignored the question.

  || J/Upset
    `j Nat...` he searched her face uncomfortably. `J Is she a demon?`

    Natalie bit her lip, and after a moment shook her head. `N I don't know. But what can we do, just leave her there floating in the wreckage?`

    `J Of course not! I just... I can't...` he trailed off, glancing behind the ship, back into the heart of a vessel larger than the Lapis recently reduced to splinters. `J You should keep watch over her. She's not as afraid of you as she is of me.`

    `N I will. I'd tell you to get some sleep, but I know it wouldn't work.` She squeezed his shoulder with one hand. `N I'll watch over her.`
  """

s.AsaraAwakens =
  label: 'Castaway'
  required: true
  history:
    MeetAsara: 1000
  effects:
    xp:
      Natalie: 2
      Asara: 5
  text: -> """
  || travel/CabinDay
    The Azurai's new passenger had nightmares. Her terrible, screaming terrors roused the whole ship before Natalie could shake her free of them. Physical contact seemed to reinforce the fear rather than assuage it. Still, Natalie figured, passing out from terror and resting peacefully must be better for her recovery than thrashing and screaming.

    Her bruises healed with amazing speed, fading from fresh red to purple and yellow in a single day, gone entirely by the end of the second. James and Natalies both would have liked to free her hands and feet, but until she stopped moaning and struggling at any human touch neither was willing to force the issue.

    It took longer than those two days before their passenger woke enough to do more than take a few sips of water or broth and pass out again. Natalie sat plotting their progress on a chart when she heard a sound behind her, just a shifting of cloth and a rustle of movement before the links of the manacles descended around her throat, threatening to choke her. Only threatening, yet. They were tight, but not difficult to breathe around.

  || A/Angry
      `A لا تصرخ. يمكنني كسر العنق.` The girl whispered gibberish in her ear.

    `N Please, I only want to hel-` Natalie's voice was choked off mid-sound, though the chain relaxed again soon after. Despite the danger in the situation, she couldn't help but notice the hot breath tickling her ear and the unclothed chest pressed against her back. She'd been misled by the survivor's delicate features - this was a woman, both in body and in strength.

    `A I'll snap your neck if you scream.` The woman's voice was a hoarse hiss in her ear, accent strong but perfectly understandable. Natalie couldn't place it.

    Natalie nodded. Her captor might be small, but her strength was irresistible.

    `A What do you want from me?`

    `N I want-` the chain strangled her brielf, and she coughed when it was loosened again. Natalie continued more quietly. `N I want to help. We rescued you from the wreckage.`

  || A/Sad
    That seemed to satisfy her. The chain relaxed around Natalie's neck, then  the girl stepped back, all sense of menace fading. Natalie stood and turned to face her. The survivor huddled back against the bed, arms crossed over her breasts and looking quite thoroughly miserable. She walked with small shuffling steps, limited by the chain between her ankles.

    `N Here, let me get you a robe.` Natalie dug through her closet, and came back with a black nightgown to drape over the girl's shoulders.

    A knock sounded lightly on the door. The girl jerked at the interruption, then calmed a little as Natalie held up her hands reassuringly. `J Nat, everything alright?` James called out.

    `N Fine, fine. Bring breakfast for two, would you?` Back to her skittish guest, who'd pulled the robe tight around her. `N What's your name?`

    `A A... Asara.` She looked both scared and hopeful as she said the name, as though it should mean something all by itself.

  || N/Normal
    `N I'm Natalie. We're a merchant ship, currently docked at Mt. Julia...` Her guest seemed to relax a bit more, her shoulders losing some of the fierce tension that had marked her posture so far. Sensing that it wasn't the content of the words so much as the mere act of friendly conversation, Natalie continued her introduction, starting with herself and widening out to the ship, the rest of the crew, Vailia... really, she just kept talking about anything and everything, initially with purpose and eventually just rambling about whatever came to mind in order to keep up the stream of words.

    James delivered the meal a bit later, but Natalie accepted it through a cracked door and shook her head in answer to his wordless questions – not now – and closed the door on him.

    Asara tensed as Natalie came too close with the food, so instead she set it on the bed and gestured her guest to pick it up. Asara did so, but didn't take a bite of the bread until she'd seen Natalie swallow hers first.

    While they ate in silence, except the clanking of chains, Natalie finally had a chance to examine Asara while awake. She wasn't as delicate as she'd seemed while sleeping. Her arms had deceptive strength, and she wasn't afraid to use it violently. Her entire aspect seemed controlled, no wasted movements or unconscious gesturing. Dangerous. Natalie didn't doubt the girl could and would have killed her had her earlier answers proven unsatisfactory. Natalie caught herself staring and looked away.

    `A Please remove these,` Asara suddenly said. She set aside the buttered-roll half finished and rattled her chains. She didn't make a face – she displayed very few expressions – but Natalie could tell that she didn't like the taste of the food.

  || travel/DeckDay
    `N Of course, sorry. Let's go below to where the tools are.` Natalie opened the door and stepped out – several of the crew were around and looked at her curiously, but quickly scattered when she gestured them to clear the area. Asara hesitated at the doorway, then stepped out onto the deck behind her. She glanced around, then nodded approval at Natalie to lead the way.

    In the cargo hold, James had anticipated their need, and had ready a chisel and hammer. Poking her head through the door, Asara saw him, sucked a breath through her teeth and retreated back on deck.

    `N What's wrong?`

    `A Please find me more clothing.`

    `N You can't put on a shirt or pants until we break the links. It'll be just a moment...` Natalie trailed off as the girl closed her eyes and took in a deep breath. She was trembling. `N ...we can work out something. A wrap, maybe. Better than a robe draped over you.` She patted Asara on one shoulder. A mistake – their guest burst into tears, and fled back to the safety of Natalie's room, slamming the door behind her.

    Natalie stood outside her cabin, listening to her sobs. Eventually, it was too painful – she knocked, lightly. `N I'm sorry, we don't have to go down there. I'll bring the tools up, and we can do it in there...` No response. She sat down, back to the door and waited, cradling her head in her hands. James checked on her, but she waved him quiet before he spoke – it had been the sight of him that set Asara off in the first place.

    What a mess.
  """

Place.MtJulia.stories.Ch1 = Object.keys(s)
for key, value of s
  Story[key] = value
