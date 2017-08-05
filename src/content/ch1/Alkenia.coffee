s = {}
s.AlkeniaArrive =
  label: 'Arrival'
  blocking: true
  history:
    AlkeniaRoute: 0
  effects:
    xp:
      Natalie: 3
  text: -> """
  || places/AlkeniaDay
    Excited shouts and waving arms guided the Azurai into dock at Alkenia, one of Vailia's primary trading partners. Another free city, Alkenia nestled in the arms of an encircling mountain, stone bluffs trailing into the sea on either side of the city and providing protection from storms. A stream ran down the valley though the center of town fed by springs further up the slope. The Alkenians made their livings from the forest and the shore, supplying Vailia with timber in return for steady shipments manufactured goods or other items from farther afield. Without the vast and relatively safe forests, Natalie's homeland would be unable to keep a significant navy afloat against the terrible attrition of the open ocean.

    For those reasons, and others, the arrival of a ship from the east was always a welcome sight. A gaggle of children stood gaping at them as sailors hopped down from the Azurai and began to secure it to the wharf. A man bearing a clipboard and a pen waited patiently for Natalie to disembark.

    The instant he set foot on the dock James was swarmed by children. Looking somewhat bewildered as he tried to answer their queries all at once. He looked at Natalie for help, but she just waved with one hand and smiled.

    ` Name, ship name, port of origin, docking fee?`

  || N/Normal
    She rattled off the answers and pressed a coin into his palm, somewhat more valuable than strictly necessary for the docking fee. Always good to make a friend.

    ` Very well. Is there anything else I can help you with, Ms?` He nodded, unscrewing the lid on his inkwell to jot down a few notes.

    `N No, thank you. A local guide would not be amiss, but I wouldn't want to impose.`

    ` I'm sure any one of the little scoundrels harassing your husband would be happy to help.`

    `N He's not... ah, yes, thank you.` She decided it wasn't worth arguing over.
  """

s.MeetKat =
  label: 'Pickpocket'
  history:
    AlkeniaArrive: 0
  effects:
    xp:
      Natalie: 2
  text: -> """
  || places/AlkeniaDay
    Alkenia's market was a crowded place, stalls buying and selling almost every imaginable good. Though, Natalie noted, the prices were often somewhat inflated compared to what one would pay in Vailia itself. She had never before had enough money to consider most of the items on sale, or at least not had the intention to spend that much money. She was too busy saving up for her grand adventure. Now, though... now she could sample whatever she liked and call it a business expense. A merchant had to know what, exactly, they were selling, after all!

    The aroma of a spice rack drew her irresistibly towards it. Most of the scents she could at least identify, but not one that stood out.

    ` Sin-namon. You're smelling sin-namon,` the merchant smiled at her twitching nose. ` Special import. I hear tell it comes from beyond Kantis, north and east so far I didn't even recognize the name of the country. Amazing, isn't it?`

  || N/Normal
    Natalie leaned close to the jar. It had a perforated top and sat over a candle to spread the smell as far as possible. A dirty trick, but effective advertising none the less - it had certainly worked on her. `N It does smell marvelous. What is it?`

    ` Tree bark. Boil it or grind it up. 10 obols an ounce, but a little goes a long way. Limited supplies.` He gestured to a single, half empty crate behind him.

    Natalie whistled at that. Truly it must come from halfway around the world to warrant that price – or he was a con artist, and a splendid one. The smell though - she'd never scented anything like it in her life, nor heard of it. A cargo hold full of that and she'd be set for life. Vailia would eat it up. `N Interesting. Does it taste like it smells? I might consider...`

    A flash of movement caught her eye, and a sudden feeling of a breeze. She patted her pocket, and found no bundle of coins. She spun on her heels, catching another flash of motion: a young woman, disappearing into the crowd.

    `N Pickpocket!` Natalie shouted. Heads turned, a path cleared for to give chase, but too late. The girl was gone, lost somewhere in the crowd.

    Natalie stopped, shook her head in dismay, assessed the situation. It wasn't much money, all told, but still... She shook her head. She was getting careless, to let someone lift off her. `N I'm afraid that was all my pocket money. Perhaps another time.`
  """

s.MeetKat2 =
  history:
    MeetKat: 0
  effects:
    xp:
      Natalie: 3
  text: -> """
  || places/AlkeniaDay
    Wandering the market, enjoying the scene, looking for new and exotic items, Natalie was enjoying her afternoon. A slight breeze, a feeling of lightness, a...

    `N Not this time, thief!` Natalie's hand closed around a wrist, fumbled as it tried to pull away, then gripped tightly.

    She managed to catch the young woman in the side of the head with a fist. The blow dazed her, and Natalie took the opportunity to wrap an arm around her neck, bending her over and holding her firmly in place. Natalie wasn't the strongest woman, but compared to her the pickpocket might as well have been a feather.

  || K/Angry
    A feather that fought dirty. She stomped on Natalie's toes (only mildly effective through thick ship-boots), then elbowed her in the stomach (quite effective through a thin shirt), and shoved her way free in the sudden confusion.

    She made a quick run for it... straight into the stomach of a burly guard, who held onto the tiny woman with somewhat more success despite her struggles.

    `N She was... oof... taking my money,` Natalie gasped out, leaning on one arm against a nearby stone wall. `N Wasn't expecting a fight.`

  || Guard/Serious
    The girl became still, quickly realizing the futility of further escape attempts. She was younger than Natalie, probably, and though taller, skinny enough to shame a pole. Little more than skin and bones, really, with big, soulful eyes that made Natalie want to give her a hug.

    The guard shook the girl's bag. It rattled with the sound of silverware. ` If I talk to the woman selling these, am I going to find they were bought properly, Kat?` He seemed to know her, and the exasperated tone of his voice suggested this was not the first such incident. ` Is she going to be able to tell me what's in your bag better than you can?`

    "Kat" didn't say anything, just shuffled her feet and hung her head. It looked like she was going to start crying at any moment.

    ` I'm sorry for the trouble, miss.` He addressed Natalie, tightening his hold on the thief's arm even more until Natalie winced in sympathy.

    ` Not at all. Thank you for catching her. 18β in mixed coinage, primarily Valian silver, if I may.` She gestured to her purse laying on the ground where Kat had dropped it during the struggle. The guard nodded, not bothering to check the exact contents to verify that they matched Natalie's description.

    ` If you're interested, I suspect the judge has finally had enough of her shenanigans.` He shook the captive waif by the shoulder. ` Third time we've caught her, enough real trial rather than just a slap on the wrist.`

    `N I'll try to be there.` Natalie took a moment to count the money in her pouch.

  || K/Sad
    Kat started to cry silently, hiccing as the guard cuffed her ear. She aimed a dispirited kick at his shin, but he didn't much seem to notice through the heavy leggings.

    ` Don't feel too bad for her. She and her boyfriend have been terrorizing the market for months. You're just the one of the few fast enough to catch her in the act.`

    Natalie nodded and looked away. Don't feel too bad for her indeed.
  """

s.KatTrial =
  history:
    MeetKat2: 0
  effects:
    xp:
      Natalie: 3
  text: -> """
  || places/AlkeniaStorm
    Natalie arrived early at the courthouse – one of two in Alkenia, and by far the poorest and busiest. This one handled justice for those neither wealthy nor influential enough to arrange trial away from all the noise and bustle.

    She found herself packed in a waiting room with a crowd of supplicants, each waiting their turn before the judge. One could expect no more than fifteen minutes for their complaint heard, case judged, or contract enforced here. Too many waited, or dreaded, their chance at justice for any single case to take long. For someone like Kat, clearly a child of the streets and with eyewitness testimony against her, the "guilty" verdict was a foregone conclusion. The only thing still to be decided was her punishment.

  || K/Normal
    `K Hey.` Someone poked Natalie's back and spoke to her.

    Natalie turned around to see, much to her surprise, Kat rubbing her wrists, ankles bound by iron, looking entirely too pleased with herself for someone soon to face sentencing.

    `K What are you doing here? Shouldn't you be watched by a guard, or maybe in a cell?`

    `K I dunno, guess they got confused or something, forgot about me,` Kat responded with a grin, bending down and trying keys one after another on her ankle-manacles. She was pretty, when not crying. Across the crowd, a pair of guards began pushing their way through.

    Natalie couldn't help but laugh at Kat's bravado, running away then stopping to talk, still inside the courthouse, with one of her victims. `N Confused, is it?`

    `K Yep. Couldn't keep track of their own helmets if they weren't held on by a strap.` She stood up and pressed the ankle-chains and keys into Natalie's hands before she could object. She laughed at the expression it garnered.

  || N/Normal
    `N How did you even get those keys?` Natalie shoved the chains back into Kat's arms, or at least tried to. The thief was too busy grinning, and had no intention of taking them back.

    `N One guy forgot his chin strap, so I nicked his helmet, and while he was getting it back from me I grabbed his wallet, and while two of them tried to hold me down I got the keys, and when the whole group piled on, I squirmed out and... been fun, but I gotta run. What's your name?`

    `N Natalie,` she answered, bemused and wondering exactly why she wasn't stopping Kat. A thief chatting with her victim and expressing not an ounce of remorse.

    `K See you around, Nat.` Kat grinned and saluted. She pushed past, on her way to the door. Natalie spun around in time to swat Kat's hand from before it slapped her ass.

    ` There she is! Stop her!` One of the pursuing guards finally made their way close enough to catch sight of Kat ducking through the outside door. Natalie just stepped out of the way and watched with a laugh. Somehow she didn't think Kat would get caught again any time soon.
  """

s.KatMeetsJames =
  blocking: true
  history:
    KatTrial: 0
  effects:
    xp:
      James: 2
      Kat: 3
  text: -> """
  || places/AlkeniaNight
    `K Hi!`

    James turned to find the owner of the hand on his shoulder, a young woman matching his own height. She was scrawny, raggedy, her clothes fraying around the edges. `J Hello?`

    `K I'm Kat, nice to meet you.` She stuck out her hand. `K You work with Natalie, right?`

    James offered his hand skeptically, and she shook it with enthusiasm. He made sure to keep an eye on his pocket so nothing could vanish from it. She looked like that sort. `J I do. And who are you?`

  || K/Normal
    `K Oh, we spoke a few days ago, she helped me out a little. I saw you two talking down at the pier.` Kat kept glancing over her shoulder, looking out for something. `K Anyway, I gotta run. They're handing out free blankets at the church this afternoon. What's your name?`

    `J James Thadel, quartermaster.` He relaxed a little. If Natalie had helped her, she couldn't be that bad.

    `K Ooh, she's a sailor, then?`

    `J Captain,` James bristled.

    `K Captain! Wow, a big shot. Anyway, see you later.` Kat dodged past him and down an alleyway. She was quick.

    He shook his head, trying to make sense of the conversation, and gave up.
  """

s.KatStorm =
  history:
    KatMeetsJames: 0
  effects:
    xp:
      Natalie: 3
      Kat: 3
  text: -> """
  || places/AlkeniaStorm
    Though the weather had maintained a pleasant tenor all through the day, as the sun set, clouds began to blow in from the horizon. Not a dangerous storm, just a bit of nasty rain to put a damper on Natalie's plans for the evening in town.
    As she hurried back towards the ship, coat pulled close around her, a hint of movement on the mostly deserted street caught her attention. A form, legs pulled up to its chest, half-hidden in the alleyway. There were people living on the street to be sure, but this... Natalie went over for a closer look.

    It was... what was her name again? The thief. She looked absolutely miserable, huddled up in a corner by the side of the street, raggedy blanket more hole than cloth draped over hunched shoulders. Natalie couldn't blame her. Even in a waxed cloak and well-made clothing it was miserable to be outside, much less the scraps she was wearing. Natalie went over, bent against the rain and crouched down next to her.

  || K/Sad
    `K Hey, Natalie.` The woman eyed her, trying to sound cheerful but lacking the energy. A particularly brutal gust of wind showered them with freezing water. `K Don't worry, I'm not going after your purse today.`

    `N What are you doing out here?` She already knew the answer, of course. There was only one reason someone dressed like that and sat outside in a storm.

    Kat didn't answer at first, just pulled her legs in closer to her chest. `K I wouldn't say no if you happened to drop your cloak, though.` The misery in her voice at asking for something so bluntly cut straight through to Natalie's heart.

    `N No cloak, but come on. Let's get you out of the rain, at least.` She reached over and wrapped an arm around Kat's shoulder, pulling her to her feet.

    `K Where are we going?`

    `N My ship. Come on, it's not that far. You stay out here you'll die of exposure.`

    `K That would suck,` Kat managed a chuckle, declining to rest her weight on Natalie's shoulder and walking on her own. `K I've slept in storms before. Killed Sam, but I guess I'm made of pretty stern stuff, eh?`

  || travel/CabinStorm
    Kat coughed, the motion wracking her whole body. No matter how many blankets Natalie piled over her, her body still shivered while her forehead burned. More than anything else, Nat worried about food. While she'd been scrawny last time they'd met, Kat had seemed little more than a shadow as she'd peeled off soaking clothes and gotten her in Natalie's bed. She'd asked for something to eat, but fallen asleep before it could be brought.

    Natalie felt her forehead again and sat by Kat's side. It was going to be a long night.
  """

s.KatStorm2 =
  blocking: true
  history:
    KatStorm: 0
  text: -> """
  || travel/CabinDay
    `K You're a very nice lady, you know that?` Natalie woke to a hand patting her shoulder. She'd fallen asleep while tending to Kat, and now it seemed her charge had awakened first.

    `N Hmm?`

    `K You brought me here and took care of me.` Kat didn't rise, stayed laying on the bed with the blankets covering her.

    `N Anyone would do that.` Natalie covered the hand on her shoulder with own.

    `K Not anyone. Three people, and one of them's dead. No one else ever did. Can I get some of that milk?` She gestured weakly to the small jar of cream at the bedside. Someone, probably James, had left it there before she woke, along with a now cool cup of tea and a biscuit.

    `N That's cream. Here, have a biscuit instead. Tea?`

  || K/Serious
    `K I sucked on a Maiden's Tea leaf once, it was nasty. Biscuit sounds good though.` She waited for Natalie to fetch it for her. Finally biting into the biscuit, she chewed thoughtfully, her face growing into a smile. She slowly levered herself into a sitting position. `K It's good. nice and fresh. Always knew you were a big-shot. Nice cabin.`

    `N Thanks. It's not anything like that. I just have some talents The Guild finds useful.`

    `K A Vailian Guildswoman, eh? A woman of many talents. So, what do you want with the likes of me? Still trying to get that money back?`

    `N What? No! I saw you dying by the side of the road and decided to do something about it. That's all.` Natalie felt as though she should be indignant about the suggestion of her selfish motives, but really, how many times had she walked past someone in exactly the same situation?

    `N I know some people who might want some help, if you're interested.` Natalie wondered briefly who would accept a known pickpocket street-person into their employ, even one as irrepressible as Kat seemed to be, still joking around even with pneumonia.

  || K/Angry
    `K I'm not going to be a whore.` Kat shook her head without anger. `K I'm not expensive, and I've seen what happens to cheap ones. I'd rather stay in the gutter.`

    `N I don't mean whoring, there's desk work and the like,` though such an objection did rule out several of the possibilities Natalie had been considering. `N I don't suppose you can read? Anyway, there are plenty of other jobs. How are you with a mop?`

    `K Dunno. Never tried.`

    `N I suppose it's a better answer than 'no.'` Natalie laughed, drawing a smile from Kat as well. Despite nearly freezing to death, her mood didn't seem much affected. `N Let me ask around a bit today and see what I can arrange.`
  """

s.KatJoins =
  history:
    KatStorm2: 0
  effects:
    xp:
      Kat: 5
  text: -> """
  || places/AlkeniaDay
    `K Get me out of here.`

    Natalie nearly jumped out of her skin at the sudden whisper right in her ear and the weight hanging off her shoulders. She reached up, pried Kat off her back, and turned to face her. `N Hey, Kat. I just came by to...`

    `K Save me Nat, save me from the eternal repetitive workday, repetitive and boring and how do people stand having jobs?` Kat didn't look as skeletal as she had last time they spoke, but there was a glimmer in her eyes suggesting an unhealthy level of stir-craziness. `K Repetitive. Boring. Did I mention it's...`

    `N Repetitive. Yes, you did mention it. I take it being a maid isn't to your taste?`

  || K/Happy
    Kat spun around, swinging her broom as though it were a dance partner. `K Oh, no, I love sweeping! And mopping, that's the best, all grimy and disgusting. Do you know what three day old vomit smells like? I know what three day old vomit smells like. Intimately.` She spun her broom around an rapped the ground its handle.

    `N Hey, it's better than being on the streets, isn't it?`

    `K I don't know! I thought it was, during Water, but then I noticed a laundry place I hadn't seen before, with a pretty good crawlspace I could hide in, and I thought maybe it wasn't so bad after all. But I am glad to see you! You're not boring.`

    `N I suppose it's nice to be appreciated. But anyway, I just thought I'd drop by, see how you were doing.`

    `K And you've seen how I'm doing. I'm doing great! And going crazy, too, but, you know.`

    Natalie laughed at the display, and poked Kat's forehead. `N We are going to get you out of here, then, at least for the rest of the day.`

    Kat poked back with the broom handle. Natalie made a grab for it, but her hands caught only empty air, and she received a rap on the hip for her trouble. Feinting after the broom again, instead Nat lunged forward, wrapping her arms around Kat's waist and lifting, tossing the giggling girl over one shoulder like a sack of potatoes.

    `N I'm borrowing her for a bit, if you don't mind?` Natalie slapped Kat's rump, addressing her comment to the other maid, a weary grey haired man. He shrugged – not his job to make sure she worked. Kat giggled more and kicked her feet in the air as Nat carried her away.

  || places/AlkeniaNight
    It was good to spend some time away from the cares and responsibilities of captaining, and Kat certainly seemed to enjoy herself as well. They ate lunch together, wandered the city streets, built a pyramid out of bricks and ran away when the owner of said bricks tried to scold them. A good day all around.

    Taking Kat back to her home - she lived in a drafty little bit of the inn's attic - Natalie was struck by a sudden thought. She laughed. Oh, James was going to just love this.

    `K Share!` Kat commanded

    `N Well, if you're going stir crazy, I have all the stirring you could ever want. You should join my crew.`

      Kat watched her silently for a moment, and Natalie nodded to show she was perfectly serious.

    She was nearly bowled over as Kat leapt into her arms, an excited squeak and a fierce hug, legs wrapping around her waist. Natalie staggered back, trying to catch her balance, bumping against a wall. Kat kissed her, right on the mouth, then unwrapped her legs and detached herself again. Natalie laughed at the girl's sudden false-decorum as she wiped dust off her shirt and spoke formally. `K Why yes, Captain Natalie, I would be pleased to sign on.` It didn't last. She broke back into a grin.

    `N It's hard work, you know. Messing around is fine, but on the ship I brook no laziness.`

    `K Hey, don't worry about it. I kept this shitty job, didn't I? How much worse can it be?`
  """

Place.Alkenia.stories.Ch1 = Object.keys(s)
for key, value of s
  Story[key] = value
