s = {}
s.KatShowsSamsGrave =
  label: "Kat's Grave"
  required: 'GameOverKindness'
  requiredGroup: 'Ch2Routes'
  _class: 'KatRoute'
  extraDays: 15
  history:
    JamesUpsetMagic: true
  effects:
    xp:
      James: 3
      Kat: 4
  text: ->"""
  || places/AlkeniaDay
    James jerked and rubbed the side of his head, looking around for the source of the sting. Kat. Sitting on the roof at the edge of the market, she gave him a cheerful wave and hucked another pebble at his head. This one missed, stinging the back of another shopper. James muttered an apology on her on her behalf and went to see what she wanted.

    By the time he reached the edge of the market, she was back on the ground. `J Oww,` he greeted her.

    `K I want to show you a thing.`

    `J Weren't you supposed to be running inventory in the cargo hold today?`

    `K Yeah, but I want to show you a thing. Come on.`

    James glanced back longingly at the crowd and the errand he was supposed to be running on Natalie's behalf, and by the time he looked back Kat was disappearing around a corner down the alley. He sighed and followed.

    Through back ways and hidden shortcuts she led with an ease of long familiarity that left him panting to keep up, and finally up over a poorly maintained wooden fence. On the other side was a surprise in the middle of the grimy city - a small oasis of verdant green, two trees shading a pleasant square of grass and flowers. Walls rose on all sides, none of them sporting doors - the only way in was hopping the fence as they'd done. Half covered with grass, white stone tiles inlaid the ground in a lose pattern. The mood was pleasant, but Kat's sudden stillness and silence lent the place a solemn air as he took in the scene. He waited for her to speak. Eventually she did.

  || K/Serious
    `K You don't like me, and that's ok. Lots of people don't like me. But I want you to trust me more than you do.`

    `J I don't...` he started to object, but her silence and solemnity, so uncharacteristic, stilled his words. He let the objection die. `J What is this place?`

    She hunted a moment in the grass, then gestured him over and knelt by one of the stones, brushing dirt and grass away to reveal the surface. James crouched next to her.

    ` For Sam, 15 Ascending Air 1217. Kat honors his memory.` chiseled into the stone in small careful letters. Only a few months old. Kat blew the dust away reverently.

    `K One of the priests makes them for us, since none of us can read.`

    James brushed off another stone - another name, a different date, but the same formula. `J Us who?`

    ` Kids on the street. The guards always take care of the bodies, so there's nothing to bury.`

    They sat in silence. The early afternoon sun was still hidden by the buildings around them, leaving the little cemetery in shade.

    Finally James nodded and stood.

    Kat remained kneeling for another moment, then popped up to her feet, the movement seeming more nervous than energetic. `K I know I'm a joke. But... I wanted you to see that's not all I am. I hope you can do better than I did, and that maybe you'll let me help.`

    `J I understand.` He put a hand reassuringly on her shoulder, the muscles tense beneath his touch. `J Let's go back to the market. Thank you for showing me this.`
  """

s.AlkeniaWeaponsRunning =
  label: 'Forestry'
  history:
    Ch2: true
  cost: 2
  effects:
    xp:
      Natalie: 3
  text: ->"""
  || places/AlkeniaDay
    ` The biggest danger is raiders from Nonkenia,` the lumberjack spat the name. ` They have some devilish pact or other that keeps 'em hidden in the forest until too late. You take my advice, miss,` he leaned against his burden, a section of tree trunk almost as big around and tall as as she was, ` you won't go out there without a nice big group to keep you safe.`

    `N I'm not planning on going myself, but thanks for the tip. Mostly I was wondering if there's anything you need?` Alkenia supplied most of Vailia's lumber - the small island nation didn't have large forests, and better to build the fleet with wood from the forested mainland. Some contacts in the industry would be an advantage for a rising young captain. Thus Natalie, here, at the edge of the forest, talking with the owner of one of the larger lumber companies. She hadn't been expecting to find him out here, carrying logs and a formidable axe himself, but it was a pleasant surprise. He seemed straightforward and easy to deal with.

    ` Hah, a Vailian looking to help, there's a new one. You said you were a captain? Not much use to me, then. We already have an exclusive contract with charter company for forest products. Kind of you to ask, though.` With a grunt he heaved the log back to his shoulder, getting ready to leave. Then he paused, turning back to her, and she had to duck the swing of his beam. ` Well actually, maybe there is something. Bring me a dozen bows with spears and knives to match and I might start thinking you mean it about wanting to help. good Vailian ones, not the dreck we make here. That's what we need - help defending ourselves, not the pretty promises you'd prefer to give.` He laughed at her expression. That much weaponry was, not to put too fine a point on it, rather expensive.

  || N/Normal
    Maybe she could work something out. `N I can bring you a load at-cost if you'll front 50% of the price.` Natalie winced. It was a huge risk, and if something went wrong, it could almost break her books. Quality arms weren't cheap, and her budget was always tight.

    ` Possible. And more generous than I was expecting, to be honest. Take a seat, let's talk.` He dropped the log with a tremendous thud, and gestured her to the impromptu bench. She sat.
  """

s.AlkeniaWeaponsRunning2 =
  label: 'Weapons Running'
  history:
    AlkeniaWeaponsRunning: true
  effects:
    xp:
      James: 3
  cost: 0
  text: ->"""
  || travel/CabinDay
    `J Are you sure we should be doing this, Nat?` James kicked the cask. Compared to the beating it'd take during loading or unloading, a stray kick was nothing. It did waft the scent of the pine oil and honey in Natalie's direction, one sealing the contents against saltwater in case the hold flooded and the other hinting at the contents. Most deals were primarily in goods - far easier for a company to find spare stock than hard cash, and easier for the merchants as well. Only large companies had enough cash to outright purchase enough cargo to fill a ship. `J I don't like being an arms merchant.`

    `N Alkenia's a next door neighbor. It's not like we're selling them to some bloodthirsty warlord. He's just a lumberjack. All he wants is hunting gear anyway, bows and spears and knives, rather than swords and armor.` The lantern swayed in her hand, casting dancing shadows across the interior of the cargo hold.

    `J It's not hunting gear, Nat. This is too expensive for putting food on the table - you only pay this much money when you're killing people.` He sighed. `J I know, I know the deal you made wasn't evil or anything. It just feels like a foot in the door. Once you do this, you're the sort of person who does it, you know? Just... as a favor to me. Take these back and pay the penalty for non delivery.`

  || N/Upset
    She laid a hand on Jame's forearm with an encouraging smile. `N We won't be those sorts of people.` She closed her eyes and calculated. The fine for breaking contract, the cost of another days wages to unload everything and find another job, the hit to her reputation as reliable... James didn't need to know. Two months ago this would have bankrupted her. Today... she could do it. He spoke softly, but she could tell how much turning him away would hurt. `N I'll... it'll be close, but I can eat the cost.` Literally. He didn't need to know if she skipped a few meals this week to cut expenses.

    James tilted his head with a little hmph sound. `J I didn't think you'd actually listen. Huh. That can't be the first time you've taken my advice...` His surprise turned into a pleased smile, and he patted her hand where it still lay on his arm. `J No, I think it <i>is</i> a first. Thank you.`
  """

s.AlkeniaRaid =
  label: 'Nonkenian Raid'
  history:
    NonkeniaArrive: true
  effects:
    xp:
      Asara: 5
  text: ->"""
  || places/AlkeniaStorm
    An alarm beat in the distance, brass gong barely audible over the crash of waves in the harbor. Asara shielded her eyes, trying to keep the driving rain out of them long enough to see something useful, but to no avail. Alkenia looked quiet as ever, the same buildings huddling together for shelter and same empty streets washing storm water down to the harbor.

    Another alarm, still distant. She and Natalie had heard them a few times in the city, warnings that attackers were in the area. Usually the Alkenians mustered quickly, and a show of force and a few quick arrows were be enough to scare away the small raiding party. A lumber mill would be set fire, a house looted - small damages, mostly meant to reassure the city that the Nonkenians had neither forgotten nor forgiven them.

    It was easy to see how the attackers had penetrated so far into the city today without being confronted. Asara had to keep a hand on the rail to prevent being tossed about by powerful gusts of wind, and she shuddered to imagine trying to direct a military force in brutal conditions like these.

    Time to get moving. They'd have to defend themselves if the Alkenians were too busy hiding from the storm.

  || A/NormalFull
    `A That's far enough,` Asara held up an empty hand, the other resting on the sword at her hip. She should have had to shout to make herself heard, but her quiet voice carried over the gusting wind. `A You may not come here.` The sailors behind her held steady, forming a grim line with James at the center.

    The raiders stopped. Half a dozen women, each with the same barbed vine painted across their left cheek and running down their necks, slowly smudging as rain washed them clean, each with the same vicious looking dagger in one hand. They didn't say anything. The silence was more terrifying shouting would have been.

    No one moved. A gust of wind made everyone present stagger.

    Without warning they swept forward again, seeming to move with a single mind. Asara smoothly drew and parried the wicked dagger aimed at her chest. Beside her, one of the crew screamed and fell, tangled with a vine-woman, but Asara had her own problems to attend to. Her attacker ducked slid under her probing counter-stroke and came at her again.

  || A/Angry
    It was over in an instant, too quickly to think. One of Natalie's crew bled on the ground, and two of the Nonkenians lay dead at Asara's feet. The remainder fled as silently as they'd come, one clutching an injured arm where James had used his own blade. Asara contemplated further violence, but it wasn't necessary. Natalie was still here. She needed to stay with Natalie.

    She wiped her blade on a dead man's shirt, wiped water from her eyes. It had been sloppy, letting them get past her to hurt one of Natalie's crew. Behind her the others tended to the sailor, but caring for the wounded was not her task. Asara kept her ears on the war drums, and her eyes on the streets.
  """


s.DeliciousFood =
  label: 'Delicious Food'
  history:
    AsaraJoinsCrew: true
  effects:
    xp:
      Kat: 3
      Asara: 3
  text: -> """
  || places/AlkeniaDay
    `K Asara. This is the best, come on, try it.` Kat dragged the reluctant woman by one wrist, pulling her towards one of the many street food venders lining Vailia's streets on a market day.

    `A I...`

    `K Come on. She'll have a sticky bun,` Kat announced to the portly man behind the counter, she waited while Asara fumbled with her coin purse.

    Money produced and exchanged for "her" order, Asara stared nervously at the sticky confection in her hands. She took a bite. Stared. Took another one. Smiled slightly.

    `K It's pretty good, right? If you nick stuff from the rich folks in Alkenia you can get stuff this good, but I hardly ever got away with that. They didn't like sharing imports... hey, are you going to eat it all?`

    Asara looked at the last few bites. Tasty. She shrugged forlornly and handed them to Kat.

    `K You're the best, thanks. Hey, have you ever had a corn dog before?`
  """

s.KatBringsToys =
  label: 'Vailian Toys'
  extraDays: 10
  history:
    KatShowsSamsGrave: true
  effects:
    xp:
      Kat: 3
  text: -> """
  || places/AlkeniaDay
    Kat huffed as she dropped the heavy canvas bag. It had been a long hill, and she almost wished she'd accepted James' offer to come with her. Almost. This was still a thing better done alone.

    `K Come on you silly, it's me. Go find the others,` she laughed at the silent pair of eyes that stared at her from an alley way. Little Grace seemed to have grown inches since last time Kat had seen her. Soon they'd have to find a new nickname for her. Grace disappeared, and Kat took a seat leaning her back against the wall of a shop while the girl gathered the rest of the kids Kat had grown up with.

    Cautiously they began to appear. Kat didn't wait for everyone to gather, but began handing out her gifts as soon as their recipients arrived. Shark got a knife - he'd always complained about the nearly worn away blade on his current one. A new dress for Grace - she could wear it until she grew too big, then sell it for better rags to match her new size. She had a blanket for Tom, shoes for Natty, and a set of needles for Susan. Her old friends gathered around her as she dispensed gifts, looking at their new possessions with awe. Vailian make, all of them, and even the cheap rough cloth Kat had bought there was sturdy and weather proof.

  || K/Sad
    `K Hah, you should see the kind of money <i>Natalie</i> makes. All this look like spare change,` she tried to shrug off her own generosity. `K Yes, I eat twice a day, every day. Never go hungry,` she patted her belly in response to a disbelieving question.

    It felt unreal, in some strange way, to be back among her old friends and companions. The worries were so different, the worlds so far apart they didn't seem to fit together. Seeing the light on a little boy's face as he got shoes that didn't leak was almost painful - she'd forgotten that particular discomfort entirely, constant companion though it had been only a few months ago. Good riddance.

    She'd planned to spend the rest of the day with them, but... They devoured her stories and listened raptly to her tales of far away ports, but ultimately it was too uncomfortable for Kat to stay longer. This was no longer her world. By sheer chance, she no longer belonged - and by sheer chance her friends remained stuck, hungry and cold. She fled back to the Lapis, and back to her new life.
  """

s.KatCh3 =
  label: 'Chapter 3 - Kat'
  required: 'GameOverFun'
  requiredGroup: 'Ch2Routes'
  _class: 'KatRoute'
  history:
    ColinthAmulets2: true
    KatShowsSamsGrave: true
  effects:
    xp:
      Natalie: 2
  text: -> """
  || K/Happy
    Natalie moved quietly down the stairs into the cargo hold, timing her steps with the ship's gentle rocking to mask the sound of movement. She should have known it was futile - Kat looked up the instant her captain came into view, starting guiltily with a bottle still in her hand.

    `K Um, Captain, hi.` Her words were slurred slightly, but the bottle in her hand still mostly full. It hardly seemed enough to get someone drunk, but Kat was both twig-thin and completely unused to alcohol stronger than grog. That much, along with the cups she'd had at dinner, might indeed have been enough.

    `N Carrying on the party on your own, I see? With a fresh bottle, no less.` Two steps forward brought Natalie close enough to reach for the wine.

    Kat pulled it back, hugged it to her chest. `K I bought this one fair and square.`

    `N Then I'm sure you won't mind me taking a look, make sure it doesn't match our cargo?` Natalie grabbed for it again, wrapping her hands around the stem and the base, above and below where Kat clutched it. Natalie yanked, but the other woman's grip held, bring them closer together, rather than freeing the bottle.

    `K No, it's mine. You want it, you'll have to take it.` Lantern light glinted in her eye, her challenge a tangible presence in the air.

    She abandoned her grip on the bottle to pull on Kat's arm instead, but just as she managed to wrestle the hand free of the bottle, Kat stepped in until their noses almost touched and hooked a leg behind Natalie's knee. As she tottered and fell, Natalie managed to twist Kat around beneath her, a feat only possible because the thief was already unsteady with drink. They fell backwards onto the stairs, and Kat wheezed as Natalie landed on top of her, wine bottle sandwiched between.

  || N/Embarrassed
    As Kat blinked up at her and tried to catch her breath, a wide grin on her face, Natalie became entirely too aware of the warm body pressed against hers. Self-conscious, she pushed away and stood up again. `N Maybe we should talk about this in the morning.`

    Kat carefully set the wine bottle aside and stood up herself. She opened her mouth as if to speak... and instead wrapped herself around Natalie in a bear hug, pinning arms to her sides. Their mouths pressed together in a sudden kiss, then broke apart again as Natalie struggled to pull away. Kat let her escape the kiss, but didn't let go the hug. The sweet tang of wine lingered in on Natalie's tongue.

    It was Natalie's turn to try and catch her breath - the kiss had stolen it all, leaving her panting. `N You're drunk, Kat. Go sleep it off, we'll forget this ever happened.`

    `K I'm not that drunk. It was just... it's easier if I pretend, maybe? I don't know.` She loosened her grip, letting Natalie out to arm's length. `K Do you want me to stop?` Was that pleading in Kat's voice, fear of rejection? Or perhaps Natalie was projecting and was she the one scared of finding out that Kat was speaking from the bottle rather than heart.

    `K Hey, um, Nat, say something?` Kat's voice was quiet, hesitant.

    `N Fuck. Are you just horny or are you in love with me?` She pulled herself out of Kat's arms and stood up straight, brushing a stray strand of hair back out of her eyes.

    The thief laughed and shoved Natalie playfully, the serious mood gone as quickly as it had come. The twinkle was back in her eye. `K No fair, you first. Love or lust?`

    <button onclick="Story.continueWith('KatCh3Yes')">`N I think both?`</button> <button onclick="Story.continueWith('KatCh3No')">`N Just having fun.`</button>

    <i>Saying you love her will commit you to Kat in Chapter 3, while an hour of fun will lock out her route. No second chances.</i>
  """

s.KatCh3Yes =
  label: 'Chapter 3 - Kat'
  requiredGroup: 'Ch2Routes'
  _class: 'KatRoute'
  extraDays: -1000
  history:
    KatCh3: true
  effects:
    xp:
      Kat: 10
  cost: 0
  text: -> """
  ||
    `N I think both?`

    Kat sighed happily. `K Good answer, captain mine. Permission to grab you again, ma'am?`

    `N Granted, sailor.`

    The adrenalin must have cleared her head, because Kat wasn't slow any more, getting her arms back around Natalie before she could react. Natalie struggled and twisted, getting her arms free occasionally but always finding them pinned to her sides again a moment later. They lurched into a crate, sending bottles clinking, then Kat got her leg back in between her captain's thighs and used the leverage of superior height to bring them both down to the floor, Kat on top.

  || N/Embarrassed
    Natalie lay there, heart thudding loudly in her ears, arms still pinned at her sides. She could get an arm loose, or a leg, but not for more than a moment or two. She couldn't catch her breath, couldn't squirm free...

    Kat apparently liked whatever look was on her face, because she leaned down and kissed Natalie on the nose with a grin. In the moment of distraction the kiss created she rolled her prey over onto her belly, catching both of Natalie's arms with her knees before they could escape, straddling her lower back. Hot breath on her skin sent shivers down Natalie's spine, and she cried out as Kat bit down on the back of her neck. It only lasted a moment, but left her panting when the teeth finally let go.

    `K Damn, I like that sound,` Kat shifted her weight, rummaging overhead for something. Natalie craned her head to see what was going on, twisted around just far enough to see the thief pull something out of a chest. Kat grinned down at her, and held what she'd found so Natalie could see. A coil of rope - easy enough to find anywhere on the ship, especially in the cargo hold. `K If you keep resisting, I'm going to have to bite you again,` she promised with a grin.

    Kat looped the rope first around one arm then the other, and with a shift of her weight and a sudden yank, pulled Natalie's arms together behind her back. `N Oww!`

    `K Sorry, sorry,` Kat apologized, pausing in her knot to rub Natalie's arms where the rope had cut into flesh. The discomfort eased as she adjusted the rope, and Natalie relaxed her cheek back into the floorboards while Kat finished tieing her wrists together. She felt Kat moving, the weight lift off her back, felt hands on her hips.

  || K/Happy
    `K Roll over and lay flat,` Kat ordered, kneeling beside her. Pretending to obey, Natalie rolled over, then curled up her knees and aimed a double-footed kick at Kat's chest. Caught off guard by the return, Kat sprawled back into the crates behind her with a surprised yelp.

    `K Biting it is then,` Kat smirked. Catching Natalie's attempt to kick her again with both hands, she knelt down and trapped her captain's legs between her thighs. Kat groped roughly at Natalie's breasts with both hands, then with a violent motion she tore open Natalie's blouse, sending buttons scattering everywhere.

    `N Hey! You're going to sew those baaAAAH!` Her objection rose to a high-pitched squeal as Kat pulled aside her bra and bit down - hard - on the tender flesh beneath. Natalie bucked and jerked, the motion only adding to her pain as Kat refused to let go. A rough hand gripped her hair and yanked, pulling her head up off the floor. She finally stopped thrashing as the pain of pulling her nipple away from Kat's teeth became too much.

    Finally the torture ended, Kat releasing her nipple and relaxing the grip on Natalie's hair. Natalie's chest heaved as she sucked down air, a wordless groan escaping her lips as the excruciating bite was replaced with a gentle sucking sensation.

    Shifting wood and bootsteps brought Natalie back to the present moment. The hatch at the top of the stairway opened. ` Is something wrong down here?` A crewman poked his head in from above.

    Kat looked up at the voice, froze, one of Natalie's breasts still in her hand, still straddling the captain. She could imagine what what he must be seeing, a bare chest and ripped shirt and trailing rope and Kat's cheeks already brilliant red and growing brighter by the second...

    No one breathed.

  || Sailors/MSad
    ` Um... s-sorry, carry on.` He stuttered and backed out, slamming the hatch closed.

    Natalie burst out laughing, accompanied a moment later by Kat's nervous giggles. It went on until they were both gasping for breath - and Natalie's first words, `N Yes, let's c-carry on,` set them off again until their sides hurt.

    Kat lay spent on top of her, and more than anything, Natalie wanted to hug her. Instead she had to settle for kissing the other woman on the lower lip and rubbing their cheeks together. It turned into a real kiss - tentative, but real. Finally Natalie broke it.

    `N I think maybe we'd better call it here for tonight, before anyone else stumbles in on us.`

    `K But, um, just for tonight, right? We can do this again?` Kat rolled off to the side, sat up, straightened Natalie's bra so it at least mostly covered her breasts again. She bit her lip, looked at the floor.

    Natalie heard the worry in the question, guessed what was really being asked. She smiled up at the other woman, meeting uncertain brown eyes with her own kind gaze. `N Thank you, Kat. I mean it. I want this, and I want you.` She lifted up, kissed the taller woman on the shoulder and relaxed back to the hard floor.

    It was the right thing to say. She saw the relief flood through the thin body, tension sleeting away.

    `N You still have to sew those buttons back on though. Now untie me so we can start hunting for them.`
  """
  apply: ->
    g.chapter = 'Ch3'
    Game.showOverlay('<h1>Chapter 3</h1><h3>Kat</h3>', 0, 'chapter overlay')

s.KatCh3No =
  label: 'Chapter 3 - Not Kat'
  requiredGroup: 'Ch2Routes'
  _class: 'KatRoute'
  extraDays: -1000
  history:
    KatCh3: true
  effects:
    xp:
      Kat: 3
  text: -> """
  ||
    `N Just having fun.`

    `K Oh. Ok, captain mine. Permission to grab you again, ma'am?`

    `N Granted, sailor.`

     The adrenalin must have cleared her head, because Kat wasn't slow any more, getting her arms back around Natalie before she could react. Natalie struggled and twisted, but no matter how she tried to move, couldn't get her arms free. They lurched into a crate, sending bottles clinking, then Kat got her leg back in between her captain's thighs and used the leverage of superior height to bring them both down, Kat on top.

     With her arms still pinned, Natalie curled up her knees and aimed a double-footed kick at Kat's chest. Caught off guard by the sudden return action, Kat sprawled back into the crates behind her with a surprised yelp.

    `K Biting it is then,` Kat smirked. Catching Natalie's attempt to kick her again with both hands, she knelt down and trapped her captain's legs with her body weight, between her thighs. She groped roughly at Natalie's breasts with both hands, then with a violent motion she tore open Natalie's blouse, sending buttons scattering everywhere.

    `N Hey! You're going to sew those baaAAAH!` Her objection rose to a high-pitched squeal as Kat chomped on her shoulder. Natalie bucked and jerked, the motion only adding to her pain as Kat refused to let go. Shifting wood and bootsteps brought Natalie back to the present moment.

    The hatch at the top of the stairway opened. ` Is something wrong down here?` A crewman poked his head in from above.

    Kat froze at the voice, Natalie's shoulder still gripped in her teeth, still straddling the captain, a ripped shirt still gripped in one hand. Kat's cheeks grew to a brilliant red.

    No one breathed.

  || Sailors/MSad
    ` Um... sorry, c-carry on.` He stuttered and backed out, slammed the hatch closed.

    Natalie burst out laughing, accompanied a moment later by Kat's nervous giggles, then a full laugh from both women. It went on until they were both gasping for breath - and Natalie's first words, `N Yes, let's c-carry on,` set them both off again until their sides hurt.

    Kat lay collapsed on top of her, and more than anything, Natalie really just wanted to hug her. She did that. `N I think maybe we'd better call it here for tonight, before anyone else stumbles in on us.`

    `N You still have to sew those buttons back on though. Now get off so we can start hunting for them.`
  """

Place.Alkenia.stories.Ch2 = Object.keys(s)
for key, value of s
  value.place = 'Alkenia'
  Story[key] = value
