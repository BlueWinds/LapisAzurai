p = {}
p.KatShowsSamsGrave =
  history:
    JamesUpsetMagic: 0
  experience:
    James: 3
    Kat: 4
  text: ->"""
  || bg=places/AlkeniaDay
  James jerked and rubbed the side of his head, looking around for the source of the sting. Kat. Sitting on the roof at the edge of the market, she gave him a cheerful wave and hucked another pebble at his head. This one missed, stinging the back of another shopper. James muttered an apology on her on her behalf and went to see what she wanted.

  -- By the time he reached the edge of the market, she was back on the ground. `J Oww," he greeted her.
  `K I want to show you a thing.`
  `J Weren't you supposed to be running inventory in the cargo hold today?`
  `K Yeah, but I want to show you a thing. Come on.`
  James glanced back longingly at the crowd and the errand he was supposed to be running on Natalie's behalf, and by the time he looked back Kat was disappearing around a corner down the alley. He sighed and followed.

  -- Through back ways and hidden shortcuts she led with an ease of long familiarity that left him panting to keep up, and finally up over a poorly maintained wooden fence. On the other side was a surprise in the middle of the grimy city - a small oasis of verdant green, two trees shading a pleasant square of grass and flowers. Walls rose on all sides, none of them sporting doors - the only way in was hopping the fence as they'd done. Half covered with grass, white stone tiles inlaid the ground in a lose pattern. The mood was pleasant, but Kat's sudden stillness and silence lent the place a solemn air as he took in the scene. He waited for her to speak. Eventually she did.

  -- `K You don't like me, and that's ok. Lots of people don't like me. But I want you to trust me more than you do.`
  `J I don't...` he started to object, but her silence and solemnity, so uncharacteristic, stilled his words. He let the objection die. `J What is this place?`
  She hunted a moment in the grass, then gestured him over and knelt by one of the stones, brushing dirt and grass away to reveal the surface. James crouched next to her.
  ` For Sam, 15 Ascending Air 1217. Kat honors his memory.` chiseled into the stone in small careful letters. Only a few months old. Kat blew the dust away reverently.

  `K One of the priests makes them for us, since none of us can read.`
  James brushed off another stone - another name, a different date, but the same formula. `J Us who?`
  `Kids on the street. The guards always take care of the bodies, so there's nothing to bury.`
  They sat in silence. The early afternoon sun was still hidden by the buildings around them, leaving the little cemetery in shade.

  -- Finally James nodded and stood.
  Kat remained kneeling for another moment, then popped up to her feet, the movement seeming more nervous than energetic. `K I know I'm a joke. But... I wanted you to see that's not all I am. I hope you can do better than I did, and that maybe you'll let me help.`
  `J I understand.` He put a hand reassuringly on her shoulder, the muscles tense beneath his touch. `J Let's go back to the market. Thank you for showing me this.`
  """

p.AlkeniaWeaponsRunning =
  label: 'Forestry'
  history:
    Ch2: 0
  experience:
    Natalie: 3
  text: ->"""
  || bg=places/AlkeniaDay
    ` The biggest danger is raiders from Nonkenia,` the lumberjack spat the name. ` They have some devilish pact or other that keeps 'em hidden in the forest until too late. You take my advice, miss,` he leaned against his burden, a section of tree trunk almost as big around and tall as as she was, ` you won't go out there without a nice big group to keep you safe.`

  || left=N/normal
    `N I'm not planning on going myself, but thanks for the tip. Mostly I was wondering if there's anything you need?` Alkenia supplied most of Vailia's lumber - the small island nation didn't have large forests, and better to build the fleet with wood from the forested mainland. Some contacts in the industry would be an advantage for a rising young captain. Thus Natalie, here, at the edge of the forest, talking with the owner of one of the larger lumber companies. She hadn't been expecting to find him out here, carrying logs and a formidable axe himself, but it was a pleasant surprise. He seemed straightforward and easy to deal with.

    -- ` Hah, a Vailian looking to help, there's a new one. You said you were a captain? Not much use to me, then. We already have an exclusive contract with charter company for forest products. Kind of you to ask, though.` With a grunt he heaved the log back to his shoulder, getting ready to leave. Then he paused, turning back to her, and she had to duck the swing of his beam. ` Well actually, maybe there is something. Bring me a dozen bows with spears and knives to match and I might start thinking you mean it about wanting to help. good Vailian ones, not the dreck we make here. That's what we need - help defending ourselves, not the pretty promises you'd prefer to give.` He laughed at her expression. That much weaponry was, not to put too fine a point on it, rather expensive.

    Maybe she could work something out. `N I can bring you a load at-cost if you'll front 50% of the price.` Natalie winced. It was a huge risk, and if something went wrong, it could almost break her books. Quality arms weren't cheap, and her budget was always tight.

    ` Possible. And more generous than I was expecting, to be honest. Take a seat, let's talk.` He dropped the log with a tremendous thud, and gestured her to the impromptu bench. She sat.
  """

p.AlkeniaWeaponsRunning2 =
  label: 'Weapons Running'
  history:
    AlkeniaWeaponsRunning: 0
  experience:
    James: 3
  text: ->"""
  || bg=travel/CabinDay left=J/upset right=N/normal
    `J Are you sure we should be doing this, Nat?` James kicked the cask. Compared to the beating it'd take during loading or unloading, a stray kick was nothing. It did waft the scent of the pine oil and honey in Natalie's direction, one sealing the contents against saltwater in case the hold flooded and the other hinting at the contents. Most deals were primarily in goods - far easier for a company to find spare stock than hard cash, and easier for the merchants as well. Only large companies had enough cash to outright purchase enough cargo to fill a ship. `J I don't like being an arms merchant.`

    `N Alkenia's a next door neighbor. It's not like we're selling them to some bloodthirsty warlord. He's just a lumberjack. All he wants is hunting gear anyway, bows and spears and knives, rather than swords and armor.` The lantern swayed in her hand, casting dancing shadows across the interior of the cargo hold.

    'J It's not hunting gear, Nat. This is too expensive for putting food on the table - you only pay this much money when you're killing people.` He sighed. `J I know, I know the deal you made wasn't evil or anything. It just feels like a foot in the door. Once you do this, you're the sort of person who does it, you know? Just... as a favor to me. Take these back and pay the penalty for non delivery.`

  || bg=travel/CabinDay left=J/upset right=N/uncertain
    She laid a hand on Jame's forearm with an encouraging smile. `N We won't be those sorts of people.` She closed her eyes and calculated. The fine for breaking contract, the cost of another days wages to unload everything and find another job, the hit to her reputation as reliable... James didn't need to know. Two months ago this would have bankrupted her. Today... she could do it. He spoke softly, but she could tell how much turning him away would hurt. `N I'll... it'll be close, but I can eat the cost.` Literally. He didn't need to know if she skipped a few meals this week to cut expenses.

    James tilted his head with a little hmph sound. `J I didn't think you'd actually listen. Huh. That can't be the first time you've taken my advice...` His surprise turned into a pleased smile, and he patted her hand where it still lay on his arm. `J No, I think it <i>is</i> a first. Thank you.`
  """

p.AlkeniaRaid =
  label: 'Nonkenian Raid'
  history:
    NonkeniaHunters: 0
  experience:
    Asara: 5
  text: ->"""
    || bg=places/AlkeniaStorm
    !! An alarm beat in the distance, brass gong barely audible over the crash of waves in the harbor. Asara shielded her eyes, trying to keep the driving rain out of them long enough to see something useful, but to no avail. Alkenia looked quiet as ever, the same buildings huddling together for shelter and same empty streets washing storm water down to the harbor.

    Another alarm, still distant. She and Natalie had heard them a few times in the city, warnings that attackers were in the area. Usually the Alkenians mustered quickly, and a show of force and a few quick arrows were be enough to scare away the small raiding party. A lumber mill would be set fire, a house looted - small damages, mostly meant to reassure the city that the Nonkenians had neither forgotten nor forgiven them.

    It was easy to see how the attackers had penetrated so far into the city today without being confronted. Asara had to keep a hand on the rail to prevent being tossed about by powerful gusts of wind, and she shuddered to imagine trying to direct a military force in brutal conditions like these.

    Time to get moving. They'd have to defend themselves if the Alkenians were too busy hiding from the storm.

    `A That's far enough,` Asara held up an empty hand, the other resting on the sword at her hip. She should have had to shout to make herself heard, but her quiet voice carried over the gusting wind. `A You may not come here.` The sailors behind her held steady, forming a grim line with James at the center.

    The raiders stopped. Half a dozen women, each with the same barbed vine painted across their left cheek and running down their necks, slowly smudging as rain washed them clean, each with the same vicious looking dagger in one hand. They didn't say anything. The silence was more terrifying shouting would have been.

    No one moved. A gust of wind made everyone present stagger.

    Without warning they swept forward again, seeming to move with a single mind. Asara smoothly drew and parried the wicked dagger aimed at her chest. Beside her, one of the crew screamed and fell, tangled with a vine-woman, but Asara had her own problems to attend to. Her attacker ducked slid under her probing counter-stroke and came at her again.

    It was over in an instant, too quickly to think. One of Natalie's crew bled on the ground, and two of the Nonkenians lay dead at Asara's feet. The remainder fled as silently as they'd come, one clutching an injured arm where James had used his own blade. Asara contemplated further violence, but it wasn't necessary. Natalie was still here. She needed to stay with Natalie.

    She wiped her blade on a dead man's shirt, wiped water from her eyes. It had been sloppy, letting them get past her to hurt one of Natalie's crew. Behind her the others tended to the sailor, but caring for the wounded was not her task. Asara kept her ears on the war drums, and her eyes on the streets.
  """


p.DeliciousFood =
  label: 'Delicious Food'
  history:
    AsaraJoinsCrew: 0
  experience:
    Kat: 3
    Asara: 3
  text: -> """
  || bg=places/AlkeniaDay
    `K Asara. This is the best, come on, try it.` Kat dragged the reluctant woman by one wrist, pulling her towards one of the many street food venders lining Vailia's streets on a market day.

    `A I...`

    `K Come on. She'll have a sticky bun,` Kat announced to the portly man behind the counter, she waited while Asara fumbled with her coin purse.

    Money produced and exchanged for "her" order, Asara stared nervously at the sticky confection in her hands. She took a bite. Stared. Took another one. Smiled slightly.

    `K It's pretty good, right? If you nick stuff from the rich folks in Alkenia you can get stuff this good, but I hardly ever got away with that. They didn't like sharing imports... hey, are you going to eat it all?`

    Asara looked at the last few bites. Tasty. She shrugged forlornly and handed them to Kat.

    `K You're the best, thanks. Hey, have you ever had a corn dog before?`
  """

p.KatBringsToys =
  label: 'Vailian Toys'
  history:
    KatShowsSamsGrave: 0
  experience:
    Kat: 3
  text: -> """
  || bg=places/AlkeniaDay
    Kat huffed as she dropped the heavy canvas bag. It had been a long hill, and she almost wished she'd accepted James' offer to come with her. Almost. This was still a thing better done alone.

    `K Come on you silly, it's me. Go find the others,` she laughed at the silent pair of eyes that stared at her from an alley way. Little Grace seemed to have grown inches since last time Kat had seen her. Soon they'd have to find a new nickname for her. Grace disappeared, and Kat took a seat leaning her back against the wall of a shop while the girl gathered the rest of the kids Kat had grown up with.

    -- Cautiously they began to appear. Kat didn't wait for everyone to gather, but began handing out her gifts as soon as their recipients arrived. Shark got a knife - he'd always complained about the nearly worn away blade on his current one. A new dress for Grace - she could wear it until she grew too big, then sell it for better rags to match her new size. She had a blanket for Tom, shoes for Natty, and a set of needles for Susan. Her old friends gathered around her as she dispensed gifts, looking at their new possessions with awe. Vailian make, all of them, and even the cheap rough cloth Kat had bought there was sturdy and weather proof.

    `K Hah, you should see the kind of money <i>Natalie</i> makes. Makes all this look like spare change,` she tried to shrug off her own generosity. `K Yes, I eat twice a day, every day. Never go hungry,` she patted her belly in response to a disbelieving question.

    -- It felt unreal, in some strange way, to be back among her old friends and companions. The worries were so different, the worlds so far apart they didn't seem to fit together. Seeing the light on a little boy's face as he got shoes that didn't leak was almost painful - she'd forgotten that particular discomfort entirely, constant companion though it had been only a few months ago, and good riddance.

    She'd planned to spend the rest of the day with them, but ultimately, it was too uncomfortable. They devoured her stories and listened raptly to her tales of far away ports, but ultimately it was too uncomfortable for Kat to stay longer. This was no longer her world. By sheer chance, she no longer belonged - and by sheer chance her friends remained stuck, hungry and cold. She fled back to the Lapis, and back to her new life.
  """

Place.Alkenia.pages.Ch2 = Object.keys(p)
for key, value of p
  Page[key] = value
