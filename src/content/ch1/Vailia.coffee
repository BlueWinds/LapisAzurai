Game.starting =
  version: 0
  day: 0
  scroll: 0
  chapter: 'Ch1'
  cargo: []
  damage: 0
  availableCargo: []
  location: 'Vailia'
  distance: 0
  reputation:
    Vailia: 20
    MtJulia: 0
  people:
    Natalie:
      xp: 0
      skills: {}
    James:
      xp: 0
      skills: {}
  history:
    Intro: 0
  openMenu: ''

s = {}

s.Intro =
  label: 'Intro'
  blocking: true
  text: -> """
  ||
    <center><i>Click anywhere on the page or use the right arrow key to advance</i></center>

  ||
    <center>Natalie dreamt of Fire.</center>

    <center>Not the tame fire of a lantern, or even the fierce danger of a forest fire. No, her dream was of Fire, the blaze with which the gods made the stars or with which they burned the skies and scorched the world clean at the dawn of an age.</center>

    <center>She also dreamt of Ocean, a vast and barren wasteland separating pinpricks of land. In her dream, she knew the ocean was waiting for her, waiting for her to see something no one else has ever seen before, and that no one would see again before storms wiped the land clean.</center>

    <center>And she dreamt of Love. Neither fire nor water, she finally had a body made of flesh, and in her heart grew a secret warmth that even the end of the world could not smother. Her secret love could neither be burned nor drowned, and it would flower into a beautiful life if only it would grow large enough, surrounded by chaos and flood and storm. She curled around it protectively.</center>

  || travel/CabinDay
    Thud.

    The dream ended abruptly as she fell off the bed. Groggy and disoriented, but definitely awake, she rubbed her head and opened her eyes. Morning light. She stumbled to her feet, grabbing the edge of her bed for support as the ship rocked beneath her. The roll of the Lapis Azurai was gentle, calming even, chasing away fraying fragments of her dreams and reminding her of where and who she was.

    She was on a ship. On her ship. Captain Natalie. She liked the sound of that. Provisional captain. If she brought it back from its maiden voyage she'd have earned the rank for real. If she didn't bring it back, well, not much use thinking about that. The ocean was not safe.

    Not her though. This was her ship. It would return safely, and not just the first time. Every time.

  || N/Normal
    Grinning at the thought of herself in wrinkles and walking across the deck with a cane – as if! - she brushed copper strands out of her eyes and examined herself in the mirror, still groggy. She slapped her cheeks and stuck her tongue out at the reflection. There were old sailors and old captains, good enough or lucky enough, and she was going to be one of them. No cane though.

    `J Nat! You ok?` James called.

    `N Yeah, fine.`
    `J I heard you thumping around.`
    `N It's nothing. How much time do we have?` She splashed water on her face, dried it with a towel, then started looking for her boots.

    `J We should have left ten minutes ago!` He hadn't woken her up, though. Natalie had learned long ago that James would worry himself sick at the slightest excuse, but it wasn't until he was practically vibrating with impatience that she actually needed to hurry.

  || travel/DeckDay
    `N I don't believe you,` she opened the door and stepped out to join him on deck. `N You were rather drunk last night. How are your eyes not red?`

    Natalie poked James in the forehead, causing him to wince. `N I knew it, you just woke up too.`

  || J/Embarrassed
    He shook his head, mop of hair unruly and uncombed, trying to deny it, but she quirked an eyebrow, and he finally relented. `J Hey, it was our very first night on board your new ship. A little drinking seemed in order.` He dropped his eyes guiltily.

    `N Never said it wasn't. Now, come on, I want breakfast before we meet with the Guildmaster.`

    `J Should have left half an hour ago,` he grumbled.
  """

s.Ch1 =
  label: 'Chapter 1 - Vailia'
  blocking: true
  history:
    Intro: 0
  effects:
    xp:
      Natalie: 3
  text: -> """
  || N/Normal
    The Guild.

    James hesitated at the doors, then hurried to join Natalie when she shot him an impatient look. The lobby was rather busy this morning, filled with preparations for the annual Festival of Lights, the longest day of the year made even longer by a celebration that ran until dawn.

    ` The Guildmaster is waiting for you in his office,` the young man at the front desk prompted, sounding a little envious. Natalie was barely a year older than him. That she'd have the attention of the Guildmaster was unusual, to say the least. He'd never even spoken with many of the "Guild Children."

    `N Thanks. Light a candle for me,` she leaned over the desk and pinched his cheek. He was cute, but she couldn't remember his name. `N I'm going to have to miss the festival this year.`

    ` Will do, Nat,` he swatted away her hand with a grin. Envious or not, children lifted off the streets and raised together looked out for their own.

  || places/GuildOffice
    Natalie entered the Guildmaster's office, trailed a moment later by James. She immediately went over and flopped into a seat across from him, while James hovered behind her nervously.

    Guildmaster Janos looked up from his reading and smiled at them. Though he had assistants to handle all the papers necessary, he still preferred to touch at least some of that work himself. Understanding the details and not merely the overview of the Guild's operations gave him important advantages, he'd once told her. Natalie briefly saw a column of figures – expenses, deposits – before he leaned forward, covering it with one arm.

  || Guildmaster/Smiling
    `Guildmaster Please, I'm not going to bite. James Thadel, is it? I understand you're to be Natalie's first mate?`

    `J Sorry sir, yes sir.` James stood up straighter, self consciously moving out from his position half hidden behind her. `J Quartermaster,` he corrected.

    `Guildmaster Please take as good care of her as we have.` He gestured to a pair of chairs in front of his desk. Natalie relaxed into hers, while James perched on the edge. It was his first time meeting Janos, and she couldn't help but chuckle at his nerves. She'd been awed too, her first time meeting the most powerful man in the city - but eight year old Natalie had gotten over that nervousness by promptly sitting in his lap, rather than the offered chair. She smiled at the memory. He'd approved, as Wend had said he would, rather than scolding her.

    `Guildmaster When do you set sail?` he went on.

  || Guildmaster/Thinking
    `N Soon. Two, three days. We've finished going over every inch of planking, and the initial trials around the island went well. If you see him, please thank Captain Johnson for assisting us with that.` `J Joneson,` James corrected, but she carried on without pause.

    `N I discussed prices for our first cargo with...` Natalie listed off the preparations she'd made for departure, while Janos listened attentively. His was one of the finest business minds in the city, and it comforted her to know that he would catch anything she'd forgotten. Which was, she suspected, the real point of this meeting.

    `Guildmaster Very thorough. I have nothing more to add.` He jotted down a note.

    Natalie grinned at that, as much approval as he ever showed of anything. Impulsively she stood and leaned over the desk and planted a kiss on his cheek before he could say anything. She quickly retreated back to her seat, sitting on her hands lest they do anything else untoward.

    `Guildmaster Please let me know when you return.` He didn't react to her gesture, other than adjust a stack of papers, but she suspected he was pleased. Hard to tell, with the Guildmaster. She also knew a dismissal when she heard one.
  """

s.ReadyToGo =
  label: 'Ready to Set Sail'
  blocking: true
  history:
    Ch1: 0
  effects:
    xp:
      James: 2
  text: -> """
  || travel/CabinDay
    Natalie laid aside her pen and admonished James, looming in the doorway. `N If you're going to fill the room with dread, at least enter all the way.`

    He started guiltily and stepped into her cabin, closing the door behind him with a foot. He remained standing. Other than the chair she occupied, the only place to sit would be on her bed, and he wasn't the sort to be comfortable with that. The space was cramped, but a private room was still more than most people aboard a ship this size would get, even the quartermaster. He'd have to share a room with the first-mate, once they had one.


  || J/Upset
    `J Nat...` he trailed off, then started again. `J I'm not sure we're ready yet.`

    She waited for him to go on. He didn't, just fidgeted and leaned against the door, resisting the swell and roll of the deck beneath them. Timber creaked, adjusting to new stresses. `N What aren't we ready for?`

    `N We've hired a crew, loaded cargo and are planning to set sail in the morning. It's a bit late for second thoughts now.`

    `J It's just... I can't shake this feeling of doom. Do you know how many ships survive a storm? I did some figuring. The odds aren't pretty, if you get caught out at sea.`

    Natalie stood and moved over to the bed, patting the chair and indicating that he should take the seat. `N The Azurai is a good ship. She'll see us through. The shipwrights knew what they were doing when they built her. She may be small, but she's fast and sturdy.` She patted his knee, attempting to reassure him of something she wasn't entirely sure of herself.

  || J/Embarrassed
    `J What are we even doing here, Natalie? There's plenty of opportunity at home, without risking your life.`

    `N You have a future in Vailia, and I never asked you to give it up. It's not my future. I don't have anyone to hand me a house and a trade, James. Do you know what I'd be doing, right now, if I weren't a captain?`

    Natalie was too small and too smart to desire any form of manual labor, and too poor to set herself up in any other trade.

    Red crept along his cheeks as he considered the question. Young, attractive, raised by the Guild... Really, there was only one answer to that question. She'd be selling her body, same as plenty of other Vailian girls her age pretty enough to make it a living. `J I, ah, sorry,` he apologized lamely.`

    `N Don't be. I chose this, you chose this, and if we'd chosen differently, we'd be different.` She poked his forehead, trying to break the mood before he turned into a beet. It was a cute reaction when she teased him too much, but now wasn't the time.

    `J I suppose so,` he rubbed his forehead, rolled his shoulders, stood up. Despite his slight frame, Natalie knew just how strong he was – one wasn't born as a blacksmith's son without working up some strength.

    `N Have a good night. Stop worrying.` She looked away and picked up her pen again.
  """

s.FirstStorm =
  label: 'Storm'
  blocking: true
  history:
    MtJuliaArrive: 0
  effects:
    damage: 6
    xp:
      James: 3
      Natalie: 3
  text: -> """
  || travel/CabinStorm
    `J Natalie! <b>Nat! Get up!</b>` James pounded on her door and shouted.

    `N What?` She slipped up out of bed, on her feet and shrugging on a shirt even while he answered. There was no light outside – still night. No, not night...

    `J A storm is rolling in! I've got the crew pulling up the sails, but it's eating the horizon like you wouldn't believe...` He stepped out of the way as she opened the door in his face.

  || N/Angry
    In one direction lay a peaceful night – dark sky and twinkling stars, ocean quiet but growing rougher. In the other... she groaned.

    `N Strike the sails, lock down all the booms, get everyone else up,` she left the door swinging open and scrambled for something warmer to wear. Waxed cap, waxed jacket, stiff boots – everything she'd need for working outdoors in the worst weather the ocean could throw at them.

  || travel/DeckStorm
    By the time she was dressed, the storm loomed almost overhead, howling winds whipping the water into a dark purple froth. Rain sleeted around them, drenching the deck and making everything slippery. The crew was already hard at work, battening everything down for a blow. She found James at the helm, pushed him aside and took the wheel herself.

    `N Not good. It's a big one,` Natalie had to shout to be heard over the sound of the ocean.

    `How do you know!?`

    `N It's... it'll take five, six hours to blow past!` She tasted the wind, unfurling instincts seldom used. The first wave caught them from the side before she could turn the ship.

    `J <b>How do you know!</b>` James repeated his question, grabbing her waist to steady her as the water washed over the deck below.

  || travel/SailingStorm
    Two sailors snapped to the end of their safety lines, saved by the rope anchoring them to their posts, while the rest remained on their feet. This one hadn't risen high enough to flood over the poop deck, but it was just a warm up. Looking deeper into the storm from their position at the top of the wave, they could see even more monstrous waves coming toward them. Natalie spun the wheel, hoping desperately that the ship would turn fast enough to take the next head-on.

    Storms like this swept across the world, leaving nothing but wreckage in their wake. Refuges like Mt. Julia were vital for any ships to survive at all. Seagoing vessels existed as fugitives, darting between safe ports in the intervening lulls. No captain set sail in anything except perfect weather, to reduce their chances of getting caught out. Like they had. And even still, as often as not, ships were unlucky. Like they were.

    Another wave towered over them, a tremendous mountain in the ocean. James managed to wrap a rope around Natalie's waist and tie it to the wheel just in time. This one didn't spill over the deck as more than a plume of spray, but surging water and gusting wind spun the ship around like a cork, and the deck tilted precipitously.

  || J/Angry
    James shouted something at her, but Natalie couldn't hear what he said, drowned out by howling wind that hit them almost like a solid object. He pointed. One of the sailors hung limply from his line, blood running from his forehead. Natalie shook her head, made a sharp gesture of denial – James shouldn't go down there. He gritted his teeth and ignored her, untied his line and ran down the stairs.

    This was the sort of storm that left no survivors. A Grandmother Storm. The last had been just a month ago. Natalie had helped comb the beach for wreckage and survivors in its wake. There were precious few of the latter, and far too much of the former.

    A wave towered over them, reaching halfway up the main mast for a brief moment before it crashed over the deck. Natalie clung to the wheel, fighting the maelstrom that tried to tear her away from her post. The Azurai popped out of the water on the other side, creaking timbers audible even over the sound of the wind. She checked the deck. James clung to one of the masts, holding the @sailor in one arm.

    Against all odds, she felt giddy, alive. Death was so close, and yet... and yet, it wouldn't claim them. She could feel it in her bones, taste it in the wind, smell it in the salt spray. Natalie felt the storm as though it were an extension of her own body, felt the howling power that fed it, felt a hundred miles of terrible elemental force seeking release...

  ||
    <h4>...</h4>

  || travel/DeckStorm
    James looked up at the wheel where Natalie hung onto it, dazed, looking more like a drowned rat than his best friend. In the brief lull between waves, he saw... he rubbed his eyes. She was grinning like a madwoman. The sailor stirred in his arms.

    He cut away the sailor's rope with a knife and dashed towards the door below decks, slamming it behind him just as another wall of water crashed over the ship. He leaned down, examined the man's forehead. Still breathing. Just a crack on the head. He'd be fine.

    James pushed back into the storm, wind instantly cutting away any semblance of warmth he'd gathered inside. Clinging to the rail for stability against the violently pitching deck, he pushed his way back up to the poop deck. Natalie hadn't moved. She still clung to the wheel, grinning madly. He grabbed her shoulder, shouted something even he couldn't hear.

  || N/Excited
    `N Do you know why they gave me a ship, James? I'm smart, and I'm pretty, but that's not why.` Her laughing voice somehow cut through the wind, though he could barely hear his own shouting. He shook his head. This wasn't the time for that.

    `They gave me a ship because I'm not going to die!` She let go of the wheel with one hand, gripped his shoulder with manic strength. Another wave crashed over the ship, burying them both in boiling, freezing foam for a moment. When it cleared, one of the sails had ripped away, floating in the ocean nearby, but the mast itself was still intact.

    James shook his head again, trying to clear it. That they hadn't sunk yet was nearly a miracle. Whatever manic state had come over her, Natalie was still alive, and still holding the wheel, turning as best she could to face each new assault from the storm. In a brief lull in the wind, he heard someone below shouting to get buckets and head below decks. He clasped her shoulder again and headed off to help.

  ||
    <h4>...</h4>

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

s.FirstStormSick =
  label: 'Storm - Aftermath'
  blocking: true
  history:
    FirstStorm: 0
  effects:
    xp:
      James: 3
  text: -> """
  || places/VailiaDay
    ` And she hasn't moved since?` The priest shook his head, trying to keep pace with the young man as he pushed his way through the crowd.

    `J Right. She was burning hot at first, like a harsh fever, but she wasn't sweating at all, and looked perfectly comfortable.` James gave everyone apologetic looks as he bulled his way towards the ship, priest in tow, but didn't stop even when he knocked a sailor over and she began hurling curses in his direction.

    No one had expected a ship to come into dock the day after a Grandmother Storm, and even with two masts snapped, the Azurai was in remarkably good condition. No hands lost. That was news. News attracted crowds. Natalie would know how to deal with this, but that wasn't much help when Natalie was the thing that needed dealing with.

    James nodded to one of the crew, guarding the ship and looking somewhat overwhelmed. The quartermaster didn't have any answers to give about how they'd survived. He understood nothing more than the sailors.

  || travel/CabinDay
    Natalie looked exactly as she had yesterday, cheerful cheeks the perfect picture of health, chest rising and falling steadily. The priest glanced at James for permission, then knelt down next to her and put his ear to her chest. James wished he could sense magic, even the slightest bit, but his family had never displayed an inch of talent, no matter how far back they went. He had no way of telling a charlatan from a healer.

    Not that there was really any danger in that - the Ocean Father's temple was the largest in Vailia, and they'd have quickly chased away anyone standing in their sanctuary wearing their robes who didn't belong.

    After only a minute of listening to Natalie breathe, the priest shook his head as though to clear it and stood again. ` I'm afraid there is nothing I can do. Rest is the only solution, rest and time.`

  || J/Upset
    `J Solution to what?` James pursed his lips, trying to dispel the previous thought. That it had been unfair of him to consider such a thing.

    The priest tilted his head, as though confused by the question. ` The shock.`

    James just stared, waiting for him to go on.

    ` Magical drain. She must be quite powerful, to bring your ship through a storm like that.` Seeing the confusion reflected in James' face, he finally deigned to explain. ` Your captain here is a sorceress. And as I said, quite a powerful one at that. I wouldn't dare touch storm-energy. It's amazing she survived, but she'll make a full recovery, given enough time.` He patted James' arm. ` No charge, since I didn't do anything. Please ask her to stop by our temple once she awakens, if she is so inclined.`
  """

s.WastingMoney =
  label: 'Wasting Money'
  history:
    KatJoins: 0
  effects:
    xp:
      Kat: 5
      Natalie: 3
  text: -> """
  || places/VailiaDay
    `N Here. 13 obols for the last voyage, plus 3 back pay from last voyage - sorry about that, it was a little tight when they refused to pay full price - minus 4 for that bottle of wine you stole from the cargo - ` Natalie smiled inwardly at Kat's guilty look. Mystery solved, and score one point for guessing where it had run off to. `N - minus 2 for that day you forgot your wallet... makes... 10.`

    Natalie dropped the coins one by one into Kat's outstretched hands, bearing the stamp of the Guild. There wasn't any better currency in all the world, pure silver and backed by the largest trading company in Vailia. The Guild hadn't needed to debase it in more than two centuries.

  || K/Normal
    Kat smooched her cheek, the coins disappearing into... well, Natalie wasn't entirely sure <i>where</i> they disappeared to, only that one moment they were in Kat's hand, the next moment, gone. `K Thanks Nat. Gonna go buy myself some new trousers, a sweet hat, a nice dinner then get drunk with the rest. Honest money is great - no one in Vailia calls for the guards when they see I have coins.`

    `N You're going to spend it all today?`

    `K Sure. I get paid again next time we make port, right?`

    `N Yes, but...`

    Kat grinned and kissed Nat's cheek again, cutting her off. `K Go, be boring and responsible. I love that about you.` She ran into the crowd before Natalie could formulate a response. She stared after the young woman, one hand rising up to touch her cheek.
  """

s.AsaraArrives =
  label: 'Asara Arrives'
  history:
    AsaraAwakens: 0
  effects:
    xp:
      Asara: 3
  text: -> """
  || A/Normal
    `A Not leaving.`

    Natalie leaned against the door, but Asara held it closed against her. She let out an exasperated sigh and slumped against it. One of the crew quirked an eyebrow to see his captain locked out of her own room, but didn't say anything. Natalie rolled her eyes and hit him lightly in the shoulder. He chuckled.

    `J Well, I guess that's that. Are you coming or not?` James smothered a smile, so Natalie hit him too. Apparently Asara wasn't ready to visit Vailia yet.
  """

s.AsaraWorriesJames =
  label: 'James Worries'
  history:
    AsaraAwakens: 0
  effects:
    xp:
      Asara: 3
      James: 3
  text: -> """
  || travel/DeckDay
    `J Everything about this is a bad idea,` James threw out casually, not pausing in his work. One of the Lapis' sails lay spread out on deck while they checked for worn spots. Natalie hadn't liked the way it had hung during the last trip.
    `N Everything about what?"
    `J Asara.`

  || N/Upset
    Natalie stopped, turned to him, waited. He didn't respond to her disapproving stare, so finally, `N We can't just abandon her.`
    `J You should leave her with a temple, someone who can take care of her properly. She's dangerous and hurting and more than a little broken. What if it's Kat who startles her next time? Or you?` James rolled his shoulder experimentally, wincing. He'd startled her below decks, coming around a corner when she wasn't expecting it. She'd nearly dislocated his shoulder. Then, mortified, she'd run off and hid in Natalie's room again, refusing to come out two fuul days.
    `N She wouldn't do that!`
    He turned his attention back to the sail, tugging experimentally on a section and ignoring Natalie's angry glare. "She's barely spoken a word to you. None of us know what she is, where she came from, or if that silver glow will..."

    `N She stays."
    For the first time in the conversation James turned fully to look at her. `J I... ok. Just... be careful, Nat. I can't protect you from this.`
    Her sudden flash of anger draining, she sighed and rubbed her temples. `N I know, I know it doesn't make sense. But it's important, and... it'll be ok. Trust me on this one.`
  """

s.AlkeniaRoute =
  label: 'Route to Alkenia'
  history:
    FirstStormSick: 0
  effects:
    xp:
      James: 3
  text: -> """
  || places/GuildOffice
    The Guild building was fortified. James noted with some satisfaction that even though they had no <i>current</i> rivals for power in Vailia, they still kept the sharp edge that they'd used finally secure a monopoly on Vailian trading abroad a generation ago. He liked working for people like that - an institution you could count on to endure. He wondered if Natalie had ever noticed the metal gates ready to be dropped in the face of violence, and the way a guard - unobtrusive, but present - appraised him as he entered. Probably not. She didn't care about things like that.

    ` Ah, James. Everything going well?` The young man at the desk - little more than a child, really - greeted him cheerfully. Natalie had lived with the other Guild orphans, and James had been her constant companion. ` I have a package for Nat.`

  || J/Normal
    `J That's what I'm here for.` He accepted the parcel - wrapped in brown paper, tied with twine, sealed with the Guildmaster's emblem.
    ` You know what it is?` His voice cracked, and embarrassment warred with eager curiosity as he rubbed his throat.

    `J I do, but I'm not telling you. Some things are secret for a reason.` He smiled apologetically.

  || travel/CabinDay
    `J One package, still sealed.`

    Natalie took it and excitedly unwrapped her present, cracking the wax seal and untying the twine. Inside... a notebook, wrapped in oiled leather and tied closed with another string. She opened it reverently to a random page. A map, precisely drawn and carefully annotated of the waters around Mt. Julia. Another page - lists of wind speeds, seasons, storm likelihood in vicinity of Nonkenia.

    A tightly guarded secret - one of the Guild's rutters. Everything an enterprising captain needed to travel safely around the continental coast near Vailia and her allied cities. Or everything a rival needed to run their own shipping business without Guild sponsorship or control. Precious almost beyond measure.

    Natalie's eyes sparkled as she started reading. She looked radiant, alive. James tried not to stare, and his heart beat faster when she reached over to squeeze his hand before returning to her reading. She didn't notice when he excused himself.
  """
  apply: ->
    g.reputation.Alkenia = 0


s.MeetMeghan =
  label: 'Lady Meghan'
  history:
    AsaraArrives: 0
    KatJoins: 0
  effects:
    xp:
      Natalie: 3
  text: -> """
  || places/GuildOffice
    Janos glanced between Natalie and his other guest. His desk was, unusually, clear, as though he'd put away everything in preparation for Natalie's arrival. No, he wouldn't care if Natalie saw his work - he'd put it away for his other guest.

    She was a young woman, Kat's age, but otherwise completely unlike the thief. Piercingly beautiful, elegant, self-assured, she looked the part of a noblewoman. But as their eyes met...

  || Meghan/Normal
    Power. The room was filled with it, And unlike the energy Natalie could harness in a storm, the power was already directed, contained, coiling around the girl and squeezing the air from Natalie's lungs.

    It wasn't hostile. It wasn't aimed at all. It merely... was, dimming the rest of the world with the mere weight of the girl's existence. Natalie's magic flickered like a candle in the presence of the sun, threatening to go out.

    Natalie couldn't breathe.

    The girl smiled, and the pressure vanished, magic coiling back inside, waiting until called forth again. Natalie staggered with the sudden change in atmosphere and sat on down hard, hands folded in her lap. The display - clearly, that's what it had been - had worked. She was overawed and cowed.

    ` Natalie Rowena, allow me to introduce Lady Vailia.`

    ` Just Meghan, please.`

  || Guildmaster/Serious
    ` Lady Meghan, then. She wanted to meet you, and I suggested that since you were already making the trip up here, she could join us.` Though the Guildmaster's neutral expression had flickered into a frown for only a moment, Natalie could read between the lines perfectly well - he hadn't wanted to introduce them at all. For Natalie's protection, or for some other reason?

    `N Named after the city?` As curiosity overcame dread, she realized what this meeting was - a test. She hoped she hadn't failed already.

    ` Other way around.` Meghan shrugged.

    ` Lady Meghan came of age a few weeks ago. I would have invited you to the celebration, but you were at sea,` Janos interjected. ` Her father was a good friend of mine.` <i>But she isn't</i> was implied.

    ` It has been some time since our city hosted a sorceress of your power.`

    Natalie laughed. "Of your power." This girl could squash her like a bug. Rumors had it that Vailia was home to the most powerful sorcerers in the world. No way this could be anyone other than his daughter. Magic traveled in the blood, and, some said, grew with each unbroken generation.

    `N Are you really the most powerful mage in the world?`

    ` The world is a big place.`

    `N That's a yes in disguise, isn't it?`

  || Meghan/Happy
    Meghan shrugged, but Natalie could tell she was pleased. Score one point for reading the girl's attitude correctly. Outright flattery would have gotten nowhere with someone so used to power, but curiosity and blunt truth had been the right approach.

    ` Who were your parents?`

    `N My mother worked for the Guild, Jessie Rowena. I don't know who my father is.`

    ` What day were you born?`

    `N 15th of Descending Fire, 1274.`

    ` Are you planning on having children any time soon?`

    `N No plans in that direction.`

    Meghan pursed her lips. Natalie felt magic stir for a moment, brushing past her mind in a movement too swift and subtle to follow. Then Meghan relaxed again, and sunk back in her chair with a smile.

    ` Kantis.`

    `N What?`

    ` Kantis. Yea bear Kantian magic. You will need to take care if you ever visit.` Meghan nodded sharply and stood. ` Thank you for your time, Natalie, Guildmaster. Take care.` She took her leave without waiting for a response.

  || N/Excited
    With the Guildmaster and Natalie left alone, silence filled the room. Natalie watched Janos, trying to figure what he made of the visit. For her own part Natalie was inclined to dismiss it as merely Meghan assessing the threat of another mage in the city, but the Guildmaster had a far broader view of events than she did, and if there were political implications in Lady Vailia taking an interest in one of the Guild's captains, he'd be the one to know.

    ` I had other things to discuss with you, but my business will have to wait for another day. I need to think on this.`

    `N Is the city really named after a family of mages?`

    ` Yes. I'm sure you can read about it at the library.`

    `N Kantis is in the far north, right?`

    ` Yes.`

    `N Don't we have some dealings with them? I heard in the market the other day that...`

    ` Another day, Natalie.`

    `N ...Yes sir.`
  """

Place.Vailia.stories.Ch1 = Object.keys(s)
for key, value of s
  Story[key] = value
