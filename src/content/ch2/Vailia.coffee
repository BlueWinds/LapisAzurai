s = {}

Place.Vailia.stories.Ch1.push('Ch2')
Story.Ch2 =
  label: 'Chapter 2 - Kantis'
  history:
    MeetMeghan: 0
  effects:
    xp:
      Natalie: 3
  text: -> """
  || places/GuildOffice
    Natalie grinned and waved at the young man at the front desk, but didn't stop – no time to chat, only time to pause and shake water out her hair. Without James here to tug at her wrist she was running rather late, despite having given herself plenty of time to arrive. She hurried along the familiar corridors towards Janos' office.

    She hesitated at his door - voices inside. She knocked smartly. The voices paused a moment, then resumed. Apparently he meant to finish whatever business he was attending before inviting her in. Natalie sighed and went over to a window. The view was impressive, looking down over the city. The Lapis was just barely visible from here. She tapped her foot on the polished wood floor, ran her finger along the windowsill (not as spotless as she'd kept it, when cleaning this office had been her job), and waited.

    Ten minutes later the door opened, and a weary looking Guildmaster held it for his guests. A stern looking older woman nodded as Natalie as she brushed past, decked in a foreign and formal dress. Janos' knuckles whitened on the door frame, and he didn't so much as glance at Natalie as he watched the woman move sedately down the long hallway.

  || Guildmaster/Skeptical
    Finally, once she had turned out of sight he nodded to Natalie, and gestured with one hand for her to enter. While she made herself comfortable in her usual chair, he sat down behind the desk with a sigh.

    `Guildmaster Don't get old, Natalie. Or at least retire when you do.` He massaged his temples with one hand.

    `N Any time you want to feel young again, I'm sure there's dozens of women who'd be happy to help. Not me though, I don't like geezers,` she stuck out her tongue.

  || N/Excited
    He laughed and leaned across to ruffle her hair.

    `Guildmaster You always know the right thing to say. I miss Wend sometimes, and now with you gone... none of the other Children have quite the same spark. I'm going to become boring.` He slapped his hands on the desk, wiping the happy expression off his face, business-like demeanor returning. `Guildmaster I hear you've been spending some time in Alkenia recently.

    `N Alkenia, yes sir. Would you like me to tell you about it?` She had guessed his intentions correctly, and he nodded. `N It's doing well. They're clearing land for farming, starting to spread out beyond the city walls. Steel tools are everywhere. And weapons. They're terribly afraid of the forest.`

    `Guildmaster They have every right to be. Lady Meghan assures me that...` he shook his head doubtfully. `Guildmaster They should be safe enough these days, if Nonkenia will leave them alone. The forest spirits are afraid of steel.`

  || Guildmaster/Thinking
    Natalie pondered his words, nodded. It fit with what she'd felt from the people there. Everyone seemed worried that the floor was going to drop out from under them. It hadn't been an entirely pleasant. `N Is there anything in specific you'd like to know?`

    He grilled her briefly on the prices of various goods, quantities and qualities that she'd seen for sale. It was amazing the way he seemed to soak up information, fitting new facts into some sort of masterful puzzle only he could see. Finally, he gestured her to silence while he pondered the way the pieces fell together.

    `Guildmaster You've done good work. It's time to send you beyond the borders, as it were. I will prepare a letter tonight, and have it sent to your ship. Please deliver it to Saottica. One of Kantis' outlying ports.`

    She sat up straight, grinned, uncrossed her legs. `N Aye aye sir!`

    `Guildmaster Stop it, you're making me feel old again,` he grumbled, but his smile said the opposite of his words.

    Natalie stood and saluted, garnering another grumble, and turned to leave.

    `Guildmaster Take some glass blowing tools with you. The price in Kantis won't disappoint.` Though it seemed an afterthought, the delivery was too timely and smooth. The advice was, she could guess, to be her means of payment for the mission. That, and a rutter to Kantis. A book showing the sea-lanes, tides, locations and details of a distant land was a secret worth many times what it would cost to have a different captain deliver the message. A promotion, effectively.

    `N Aye aye sir!` She saluted again, and danced out before he could object.
  """
  apply: ->
    g.chapter = 'Ch2'


s.TomenoiRoute =
  label: 'Route to Kantis'
  history:
    Ch2: 0
  effects:
    xp:
      Asara: 3
  text: ->"""
  || places/GuildOffice
    `A Natalie sent me.`

    `Guildmaster Ah! Who are... who let you in?`

    Asara frowned uncertainly. `A The door was open.`

    `Guildmaster You didn't speak with the person at the front desk?`

    `A He seemed busy. I did not wish to be rude.`

    Janos sat back down heavily in his chair. `Guildmaster Sorry, you gave me quite a fright. Who are you?`

  || A/Normal
    `A Natalie sent me.`

    `Guildmaster You must be Asara, right. One of Natalie's new officers. Do you know why she sent you instead of James?`

    Asara looked unhappy at the mention of her name. `A You are her commander, are you not?`

    `Guildmaster Something more like her father.` He saw the subtle widening of her eyes at that, quickly suppressed. He smiled. Though he'd been the one startled when she'd seemed to appear from thin air, now that he'd had a minute to observe her, he could see that she was practically vibrating with tension. `Guildmaster Please do not be so nervous. Any friend of Natalie's is a friend of mine, and your name is safe with me, I won't repeat it further.`

    `A Thank you.` She waited silently, giving nothing more.

    `Guildmaster I'd have thought you were from Kantis, except for the hair and the eyes. Sorry, I shouldn't pry.` He gave up on the idea of a proper conversation and instead just handed her a leather bound notebook. `Guildmaster This is what I wanted to give Natalie. Directions to Tomenoi. It's a halfway point between Vailia and Kantis, neutral ground. Natalie can buy a map of Kantis from there herself - with so many competing interests, they can't keep their maps secret enough to even charge a fair price. Please give her my regards.`

    Asara gave a little half bow, and she was gone. Janus shook his head and tried not to glance at the door. Natalie had chosen a strange companion.
  """
  apply: ->
    g.reputation.Tomenoi = 0

s.JamesUpsetMagic =
  label: 'James is Upset'
  history:
    Ch2: 0
  effects:
    xp:
      James: 3
  text: ->"""
  || travel/CabinNight
    `N So, when're you going to say something?`

    `J What do you mean?` James didn't look in her direction, instead continuing his tallying of numbers.

    `N You're kidding me. What ever's got you so knotted up you look me in the eyes. Spit it out.`

  || J/Upset
    `J I don't want to talk about it. Let's just finish this.` James leaned over to check her numbers – they matched, arrived at independently.

    Natalie stole the pen out of his hand before he could use it to mark his paper and set it on the desk out of easy reach. `N Let's not. Let's talk.`

    `J I'm keeping my secret for now.` He stood and walked out.

    She considered catching him at the door, chasing him out onto the deck, running after him... he was gone down the gangplank and into the city while she still sat at her desk, considering what to do.
  """

s.NonkeniaRoute =
  label: 'Nonkenia Rutter'
  history:
    TomenoiRoute: 0
  effects:
    xp:
      Asara: 3
  text: -> """
  || places/GuildOffice
    Asara stood silently in the lobby of the Guild hall. No one approached her. No one met her eyes. It was unnerving, having so many people passing by and not one of them cared about her presence. The lack of attention - positive or negative - was unnerving. She was here on Natalie's business. She'd spoken with the ruler of this place, the one they called Guildmaster. Someone should have known why she was here and taken care of it without prompting.

    It was... sloppy. Disorganized. It was <i>loud.</i>

  || A/Normal
    She gave up hoping someone would approach her and finally went over to the desk set up to greet visitors. She waited for the clerk to recognize her. They'd never met, but he must have been given a description of her, surely...

    He grew nervous under her silence. With an internal shrug, Asara gave up hope of getting through this without having to speak to anyone. It wasn't a big deal, she tried to convince herself. Vailia was different from home, and she'd have to accept that if she wanted to make her way in Natalie's world. She could do this.

    `A Natalie Rowena's package.`

    ` Um! You're not allowed to just take anyone's mail, you know. But maybe... let's see...` He shuffled through several pieces of paper and began reading one of them, muttering to himself as he did so. ` Natalie, Kat, James... 'a blonde woman who doesn't speak much.'` He chuckled nervously. ` I suppose that would be you. But why is your name not on here? You weren't on the list of people approved to take packages for her last week when I checked, and the lists change so infrequently I didn't think to look...` He realized he was babbling and shut up. He held out the package for her.

    Asara let out a tense breath and took the package. She hated being babbled at. A curt nod to the clerk and she turned to leave. She didn't hate the city. Really, she didn't. It was just... she wanted to be back on the ship. Fewer people. People who knew her. She couldn't relax around strangers. She ignored the clerk's attempt to make more conversation and fled with all possible haste short of actually running.
  """
  apply: ->
    g.reputation.Nonkenia = 0

s.NonkeniaDiplomat =
  label: 'Diplomatic Delivery'
  history:
    NonkeniaRoute: 0
  effects:
    xp:
      Natalie: 3
  text: -> """
  || places/GuildOffice
    `N Guildmaster Janos,` Natalie grinned and sauntered into his office unannounced. It had cost her an obol at the front desk to see him on the quiet, but the look of surprise on his face as she sat herself down across from him was worth it.

    ` Ah, welcome. I didn't know your ship was back already. Doing well, I hope?`

    `N Things are going well. Even found a few trustworthy officers. I also wanted to thank you for the route to Nonkenia - that was unexpected, and quite generous. Not sure what I did to earn that one. But that isn't why I'm here. I'm here because you need me to deliver something irreplaceable to Alkenia.`

    He quirked an eyebrow. ` I'm curious how you know that. I've only told one person, whom I'm sure you've never met.`

    `N Easy. <i>You</i> wanted to see me when I got back, which means you want something moved. You wanted to see <i>me</i> when I got back, which means you can't afford to have it lost at sea. You wanted to see me when I <i>got back</i>, which means it has something to do with Alkenia, since I've had a lot of dealings there recently.`

  || Guildmaster/Serious
    ` Very good, but wrong on two counts. Nonkenia is the destination, which answers why I gave you the rutter to get there. Also, it's a 'them' I want delivered, not an 'it.' You are certainly correct that I would very much prefer to trust them to your care compared to someone else's, though.`

    ` This feud between Alkenia and Nonkenia is doing no one any good. A war right in our backyard is bad business. While the prince, and thus Vailia, certainly has made a policy of non-interference in foreign politics, as a private individual I have somewhat greater freedom of action.` He smiled at the irony in those last words. The prince did what the Guild asked him to. "Private individual" indeed.

    ` Please don't make that face. All I'm going to do is attempting to start peace talks, nothing objectionable. I wish you to carry a pair of diplomats to Nonkenia to arrange things, with all possible haste. You will, of course, be paid.`

    He didn't need to ask if she'd do it. Any number of reasons would have been sufficient alone - money, loyalty the man who was not far from a father, a desire to do good for the people of both cities, earning favor from the Guild. She just nodded.

    ` Excellent. I'll tell Ameliss to meet you at your ship this afternoon.`
  """

s.TrainCombatNat =
  label: 'Lessons for Natalie'
  history:
    Ch2: 0
  effects:
    xp:
      Natalie: 3
  text: -> """
  || places/VailiaDay
    `N Hey! I heard you teach people weapons?` Natalie squatted down in front of the man drinking from a clay pitcher. He was rough-faced, at least six feet tall, and wore a broadsword strapped to his back. There was no denying that this was Torril, one of the more famous mercenaries in Vailia, now retired. Sitting and drinking in the rain, for some reason, rather than under the awning only a few steps behind him.

    ` I do. I take it you're interested?`

    `I captain a vessel and figured it would behoove me to know a thing or two more about this than I do.` She popped back to her feet and went over to the rack of wooden practice weapons, staying dry under the awning. She settled almost immediately on a narrow wooden blade. It felt ungainly and awkward in her hand.

    Torril stood up slowly, unfolding his bulky six feet, shaking his head and sending drops scattering from his hair. ` I have literally never had to tell someone which end of a sword was which before. Here, that's the grip on the other end...`
  """

s.TrainCombatJames =
  label: 'Lessons for James'
  history:
    TrainCombatNat: 0
  effects:
    xp:
      James: 3
  text: -> """
  || places/VailiaDay
    `J I need some help.` James presented himself to Torril, a retired mercenary captain.

    ` What sort of help?`

    `J Help with fighting. I thought I was decent, but...` James shook his head. The way Asara had to tossed him around like a rag doll had been unnerving.

    ` Why?`

    `J I'll be traveling dangerous places, and I need to protect people.`

    ` Good reason. Here, let's see what you know.` Torril tossed him a wooden practice blade.
  """

s.TrainCombatKat =
  label: 'Lessons for Kat'
  history:
    TrainCombatNat: 0
  effects:
    xp:
      Kat: 3
  text: -> """
  || places/VailiaDay
    Kat slumped her way into the courtyard, managing to look as though she was being dragged even though no one was anywhere near her. `K I'm supposed to learn how to fight,` she addressed the retired mercenary.

    ` Ah, you must be Kat. Natalie told me about you. I hear you're quick like a demon and lazy like one too.`

    `K That wasn't very nice of her.` Kat stuck out her tongue. `K Accurate though,` she chuckled at her sally.

    ` Well, we'll soon work that out of you. Do you know any weapons work?`

    `K I can throw a half-brick pretty well. Usually kill a rat on the first try,` she grinned proudly.

    Torril rubbed his forehead. Today was going to be a long day.
  """

s.TrainCombatKat =
  label: 'Lessons for Asara'
  history:
    TrainCombatNat: 0
  effects:
    xp:
      Asara: 3
  text: -> """
  || places/VailiaDay
    `K I believe you can help me,` Asara spoke to the mercenary captain without preamble or introduction.

  He stared at her, then slowly shook his head. ` If you are who you look like, then I think you could teach me, miss, rather than the other way around. Natalie didn't mention anyone like you on her crew.`

  `A Not the sword.` She shook her head, grey eyes closing sadly for a moment. `K I have heard that you worked with one of my sisters. I would like to hear about her.`

  Torril nodded. ` I was her captain for six months. Does Antinua know you're looking for her?`

  `A No, and do not tell tell her. I'm not ready to face her yet.`
  """

s.IronSandsRutter =
  label: 'Route to Iron Sands (part 1)'
  history:
    JamesUpsetMagic: 0
  effects:
    xp:
      Kat: 3
  text: -> """
  || places/GuildOffice
    `Guildmaster Come in. Kat, is it?`

    Kat stepped into the office quietly. She'd been in a place this swanky several times before - usually when something very bad was about to happen. She perched on the edge of the offered seat and folder her hands in her lap.

    `Guildmaster I wonder why Natalie sent you. It's usually James' job to pick up sensitive documents.`

    Kat tried not to fidget.

    `Guildmaster She sent you here so that I could meet you. Do you know why she'd do that?`

  || K/Serious
    Kat shook her head.

    `Guildmaster It's because she likes you. Natalie's like a daughter to me, and if she likes you, then it's my pleasure to make your acquaintance.`

    `Guildmaster Oh, come now, I'm not that scary, am I?` Janos' smile faltered slightly at Kat's continued nervous shifting.

    `K Well... there are stories, you know? That you're the richest man in Vailia.`

    `Guildmaster I am.`

    `K And that The Guild has grown twofold since you took over.`

    `Guildmaster It has.`

    `K And that you`re a super powerful wizard.`

    `Guildmaster You made that up.`

    `K And that you eat babies.`

    `Guildmaster Delicious.`

  || K/Happy
    Kat grinned and offered her hand. `K Ok, you're not so bad.`

    Rather than shake, Janos put a slim leather-bound folio in her hand. `Guildmaster I see that sticky-paper on your hand, miss. You'll have to clean that prank off the rutter before you give it to Natalie. Please thank her for her good work in Kantis.`
  """

s.IronSandsRutter2 =
  label: 'Route to Iron Sands (part 2)'
  history:
    IronSandsRutter: 0
  effects:
    xp:
      Kat: 3
  text: ->"""
  || travel/CabinDay
    `N Kat, did you ever visit Janos? I've been so busy it slipped my mind. It didn't sound like anything urgent.`

    `K What? Yes, I did. Let's see... he said he's really rich, and the Guild is doing well, and he's not a super powerful wizard, and also he eats babies.`

    Natalie shook her head and took a deep breath. Of course that's what Kat had decided to talk with him about.

    `K Oh, and I guess he gave me a book to give to you. One sec, I'll grab it from my bunk.` She popped out of Natalie's cabin, returning a moment later bearing a leather folio pressed with the Guild emblem on the back, held closed by twine. "Natalie Rowena's eyes only. Deliver immediately" was written on a slip of paper hiding the cover, and a date.

    `N #{g.day - g.history.IronSandsRutter} days. It says deliver immediately, and you hang onto it for #{g.day - g.history.IronSandsRutter} days.`

  || K/Serious
    `K How was I supposed to know that?` Kat crossed her arms defensively over her chest.

    `N It says that right here on the cover!`

    `K Well I can't read, now can I?`

    Natalie collapsed back in her chair. `N You can't read?`

    `K Of course not. Why'd I know how to do something like that?`

    `N Because the free schools... oh. In Vailia. Where you're not from. Sorry.` Natalie unwrapped the folio and flipped it open. It was a rutter to Iron Sands, a recently opened mining colony on the coast. The location was a closely guarded Guild secret. Janus had established it somewhere to the south, selling the iron and steel it produced at a staggering loss to undercut Alkenian sources. It had been a master stroke, costing a fortune but consolidating the Guild's hold on its foreign cities. That had been before she was born, but she'd studied the economics of it closely. It had been a master stroke.

    `N Sorry I yelled at you, Kat. Please don't forget about things like this - when I send you on jobs, they're always important, or I'd just have the crew do them.`

    Kat nodded guiltily. `K Yes ma'am. I'll do better next time.`

    She leaned over and kissed Natalie on the cheek. `K thanks for sending me to meet your dad. Even if he does eat babies.`

    `N He's neither my dad nor does he... hey, come back here!`
  """
  apply: ->
    g.reputation.IronSands = 0

s.AsaraTalkFlames =
  label: 'Talk with Asara - Flames'
  history:
    AsarasMagic: 0
  effects:
    xp:
      Asara: 3
  text: ->"""
  || places/VailiaDay
    `N Hah, caught you!` Natalie spun around, pointing dramatically at Asara still several paces away, ghosting in her direction.

    `A I made more noise, like you asked me to.`

    `N Oh. Well, thanks.` Disappointing, that she'd only heard Asara because she was <i>intentionally</i> making noise. `N Someday.`

    `N You called that silver fire, what was it, 'the flames'? You can't do it again?` Natalie seized on the chance to ask one of the many questions that had been bothering her since the night when Asara had decided to ` test her power.`

    `A Please do not be afraid. I would never harm you.`

    Natalie blinked, blushed, clamped her mouth shut. `N Oh, um, well, that's good.` Had she really been that transparent?

  || A/Upset
    Asara just seemed confused by Natalie's reaction. She went on. `A The Flames are one of the blessings my sisters and I may call upon. We are not as versatile as witches, but we do not need to be.` She grew reflective for a moment, then looked guilty. `A I have spoken too much, embarrassed you.`

    `N No, it's quite alright. You...`

    She was speaking to empty air. Asara had already disappeared.
  """

s.AsaraTalkNotMagic =
  label: 'Talk with Asara - Magic'
  history:
    AsarasMagic: 0
  effects:
    xp:
      Asara: 3
  text: ->"""
  || places/VailiaNight
    `N You said that your blessings weren't magic?` Natalie popped one of the questions that had been on her mind ever since the night when Asara had demonstrated the strength to bend steel with her bare hands. Even ignoring the time when she'd reduced a large vessel to burned splinters while handcuffed. This night was similar - cloudless sky, calm water, a sense of quiet waiting.

    Asara nodded, not considering the question of much interest. `A They are blessings from my goddess, not magic drawn from the elements like witches use. They grow greater with strength of will and with practice.`

    Now Natalie was genuinely curious. Everything she'd ever read suggested that, for humans, power came with birth, present or absent in set quantity from the moment when a potential sorcerer drew their first breath. Seeing her interest, Asara went on.

  || A/Normal
    `A We are not witches. My sisters and I are priestesses. Guardians? Holy soldiers. I do not know a good word for it in Vailian, forgive me. Your birth defined you, but I was defined by a choice.`

    `N A choice?` Natalie prompted her to go on, leaning in closer. Asara was finally opening up a little - and beneath the sharp exterior there was something as fascinating as Nat has known there would be.

    `A I was five when my mother asked if I wished to join her on Azaraki's path, when I accepted the sword and the silver.` She shook her head at Natalie's horrified expression. `A I have seen the way you Vailians coddle your children. It's a wonder your city survives such indulgence.`
  """

s.AsaraTalkWitch =
  label: 'Talk with Asara - Witch'
  history:
    AsaraTalkNotMagic: 0
  effects:
    xp:
      Natalie: 3
      Asara: 2
  text: ->"""
  || travel/CabinStorm
    `N Why do you keep calling me a witch?` Natalie looked up from her her reading and quirked her head, finally asking one of the many questions that had been bothering her. The room rocked gently, no more sign of the storm's fury reaching them in her cabin than the creaking of wood and an occasional draft of damp air.

    Asara looked up from her own task - sharpening her sword - then back at the ground. She wrung her hands like she'd been caught steeling from the cookie jar, looked at Natalie again, then back to her sword. `A It's... what we call people who use magic who do not follow Azaraki's path. Those who will not use their powers to serve the people are at least distrusted, if they are not banished.`

    `N Oh.`

    `A I trust you completely.` If anyone else had used such a cheesy line she'd have hit them and laughed it off, but Asara let the statement drop with so much earnestness, not a drop of guile in it that, Natalie couldn't help but blush and look away herself.

    `N I, um, I have to go help James in the cargo hold.`
  """

s.JamesParents =
  label: "James' Parents"
  history:
    JamesUpsetMagic2: 0
  effects:
    xp:
      James: 3
  text: ->"""
  || places/VailiaDay
    James raised a hand to knock, hesitated, lowered it again. The weather beaten door was the same as ever, but not the same at all. Scarred and blackened with soot, he traced a finger along a groove where the boards were coming apart. His mother had wanted to replace it for years, but James agreed with his father - it was a piece of family history, as irreplaceable in its own way as the anvil upon which three generations had made their living.

    The roar of the forge and billows of soot from the chimney above showed him what he'd find if he went inside - his father shirtless and sweating, his mother shoveling charcoal into the furnace. That had been her job before James had been old enough, and doubtless was again since he'd run off with Natalie.

    He could smell it too, and not only in his imagination. Hot metal, smoke, sweat, warm winters and blazing summers nestled alone in the attic above the shop. The heat and smells were benefits - better clean industry than effluent odors from the street, and they never worried about staying warm, unlike so many others. There were worse lots in life, and he had only to turn around to be reminded of that. smithies[D[D[D[D[D[D[D[D[D[C[S clustered in the poorest part of Vailia not because they were themselves poor, but because no one else would tolerate the noise.

    James remembered his father, loud and angry that he would abandon his apprenticeship and family history, and his mother, jaw set grimly and glancing every few minutes towards the distant sea. It had claimed both her mother and her fist husband.

    He turned away and left without knocking. They be happier without the reminder of his presence.
  """

s.JamesParents2 =
  label: "James' Parents"
  history:
    JamesParents: 0
  blocking: true
  effects:
    xp:
      James: 2
      Natalie: 2
  text: ->"""
  || travel/DeckNight
    `N You didn't speak with them.` Natalie came up behind James and rapped him on the back of his head.

    `J Why do you say that?` James lay down the rope he was splicing together, having cut out the frayed patch. He tried to turn to look at her without standing up, but she shifted around to stay out of his sight.

    `N You are transparent.` Natalie waved a hand in front of his face. `N I can see my fingers though your skull, that's how transparent you are.` She jammed a rolled up piece of paper against his chest as he finally stood and turned to face her. `N And because your father wrote to me.`

    `J Neither of my parents know how to write.`

    `N They hired someone. They want us to come to dinner tomorrow. I think we should.`

    James sat back down and picked up his rope. `J We were going to set sail in the morning, weren't we?`

    `N We can stay here another day to see your parents.`

    `J No, if we're ready to leave, we should leave. We can have dinner some other time.`

    She rapped him on the back of the head with her knuckles again. `N You're an idiot about some things, James Thadel. I'll let you get away with it this time if you promise to write them a letter.`

    He sighed and bowed his head.
  """

s.TomenoiHistory2 =
  label: 'History'
  history:
    TomenoiHistory: 0
  effects:
    xp:
      Kat: 3
  text: ->"""
  || places/VailiaDay
    `Meghan Natalie, welcome. And you are...`

    `K Kat. Pleased to meetcha.`

    `Meghan Please, come in,` Lady Meghan swept the door the rest of the way open and stepped aside. Her house was entirely out of place with its surroundings, a tiny little cot nestled among tremendous mansions, only two blocks from the palace itself. The inside was even more out of place - crammed with books, doodads and trinkets, it looked like it hadn't seen the hand of a maid in... well, ever. `Meghan I'm glad you came. I've had about all I can stand of dealing with Janos for the moment. You're not here on his business, are you?` She looked suddenly suspicious.

    `N No, not at all. What business is that?`

  || Meghan/Serious
    `Meghan If you don't already know, don't badger me about it. Would you like some tea?`

    Kat was too busy staring around the apartment to answer, but Natalie agreed. With a negligent wave of one hand, Meghan set the kettle to whistling, hot steam piping from it atop an unlit stove. It was... where had all the energy for that <i>come from</i>? To draw that much power internally would have left Natalie half-delirious with magical strain, and Lady Meghan had done it idly, without thought. Natalie was impressed.

    `K I'm sorry to bother your ladyship,`
    `Meghan Just Meghan, please.`
    `K ...to bother your Meghanship, but I found something interesting, and was hoping you could tell me more about it.` When their host came back gripping three mugs of tea, Kat traded one of them for a slip of paper.

    ` ...flow eternally, as a symbol of our dedication that this may never happen again.
      - Rheia Vailia
      8th of Ascending Fire, year 23 of the new era`

  || K/Normal
    `K I found it on a stone in Tomenoi. The top half was broken off, but I got to wondering, and Natalie didn't know who Rheia was, and she has your last name, so here we are.` Kat shut up when it became apparent that Meghan wasn't listening to her stream of words - she was busy digging through one of her bookshelves. She found her book, and began flipping through it. Kat and Natalie waited in silence.

    `Meghan Ah, here we are. Rheia Vailia. Yes, she'd just survived the end of an age. That was a bad turning.` Meghan shook her head and replaced the book on her shelf.

    `K Your family was around 1200 years age?` Kat leaned forward curiously, and Natalie had to laugh. The woman wasn't much for books, but this sounded like a <i>story</i>, and she loved stories.

    Meghan laughed. `Meghan That stone's more like 3000 years old. It wasn't <i>this</i> era she's talking about. And my family is older than that stone by far.`

    `K How old?`

    `Meghan Old.`

    `K How o...`

    Natalie put a hand over Kat's mouth, muffling the rest of her words. They wrestled briefly, accompanied by Meghan's laughter. Finally Kat stopped struggling, and Natalie removed her hand.

    `N Heh, sorry about that. Drink your tea Kat, and let's not antagonize the world-shakingly powerful wizard.`

    `Meghan Quite alright. So, tell me about Kantis? I've always wanted to travel.` She steered the conversation in a lighter direction, and Natalie accepted the change, despite Kat's occasional sullen poke in the ribs and whisper that she wanted to know more. A pleasant afternoon.
  """

s.MeghanSuitors =
  label: "Lady Meghan's Problem"
  history:
    MeetMeghan: 0
  effects:
    xp:
      Natalie: 2
      James: 2
  text: ->"""
  || places/VailiaNight
    `N James. Stop fidgeting and stand still. Yes, I know. It's too fancy for you. But stop fidgeting anyway, because you're here now and I'm not leaving until I've made my rounds.` Grasping him firmly by the upper arm - without appearing to do so, because actually needing to drag her date around by the arm was too embarrassing to contemplate - Natalie made her way to the next noble she wished to speak with.

    Before she could get there though, Janos swept in and took her other arm, tugging her away. `Guildmaster Oh, Natalie, just the person I was looking forward to seeing tonight.` Natalie flashed James an apologetic look for leaving him alone, and let the Guildmaster pull her away.

    `N Having a pleasant evening, sir?`

    `Guildmaster Oh yes, just excellent.` He leaned in closely and lowered his voice. `Guildmaster I worked rather hard to get you this invitation, and while James is a fine young man, his nervousness is not improving your presentation.`

    Natalie sighed and glanced around. It was certainly true that, while she fit in perfectly well - cocktail dress, exotic hors d'oeuvres, fancy drinks, nobles and wealthy merchants and the highest ranks of the Guild - James was entirely out of place. `N I had hoped... well, I forget sometimes that he's the son of a blacksmith. But actually, why <i>did</i> you get me an invitation?`

    Janos quirked an eyebrow at her, as if the answer should be obvious. `Guildmaster Lady Meghan reaches the age of majority today.` He stopped, as though it should be obvious to her why that was important.

  || N/Upset
    Natalie said nothing.

    `Guildmaster Every fine young man in the city is here aiming for her affection.`

    Natalie pursed her lips.

    `Guildmaster Don't look at me like that, I'm not trying to marry you off against your will. I just thought...`

    Natalie frowned at him.

    `Guildmaster ...`

    `N I appreciate all you've done for me, sir, but I'll having no more truck with this particular plan of yours than she will.` Natalie gestured towards the center of the garden, where a regular flock of smartly dressed young men clustered around a thoroughly miserable Lady Meghan.

    With one last poisonous look at Janus Natalie pulled her arm out of his hand and spun smartly, dress whirling around her. She went to go find James.

    `N Come on, back to the ship with you.`

    `J I thought I had to stay and...`

  || N/Angry
    She shushed him with a finger to his lips. `N I'm about to make a scene, and I don't want you caught up in any backlash.`

    `J That's... have I mentioned recently how much I admire you, Nat? Anything I can help with?`

    `N I'm Janos' protege - I can get away with this. You though, they'd hang you out to dry. You can watch, but go back to the ship afterwards and don't stop to talk to anyone. Especially not the Guildmaster.` She took the drink he'd acquired from his hand and drained it in one gulp.

    James nodded, eyes shining, and took the glass back from her, stepping back into the crowd and leaving her alone.

    Natalie took a deep breath, then stepped towards the crowd surrounding Meghan.

    She cleared her throat. Meghan looked at her, and slowly the suitors turned in her direction.

    `N Lady Meghan Vailia.` She caught Meghan's eye - Natalie couldn't wink, with all eyes on her, but she tried to make her tone sparkle, and hoped the lady would play along.

    `Meghan Yes, Natalie Rowena?`

  || Meghan/Angry
    Natalie wanted to sag to her knees in relief, but held herself still instead. Meghan's twinkling eye reassured her that she'd read the situation right. If Meghan hadn't decided to play along, this would have resulted in Natalie making a fool of herself. With the other young woman's help, though, she could make a fool of everyone else here instead.

    `N I have proposition to discuss.` Stunned silence rippled across the party.

    `Meghan I would be delighted to hear it.` She held out her hand in courtly fashion, and taking swift strides across the path that had opened for her, Natalie took it with a bow.

    `N Shall we retire to your apartment, my lady?` She kissed Meghan's fingers.

    `Meghan Please.`

    Natalie hadn't thought the silence could grow more complete, but it had. She no intention of actually proposing marriage, but almost ruined the whole thing by bursting out laughing at the stunned expressions on almost every face. Even the Guildmaster had the decency to look nonplussed.

    Escorting the maiden in whose honor the party had been thrown, Natalie made her exit to the sound of a pin dropping.
  """

s.MeghanSuitors2 =
  label: "Lady Meghan's Problem"
  blocking: true
  history:
    MeghanSuitors: 0
  effects:
    xp:
      Natalie: 3
  text: -> """
  || places/VailiaNight
    `N I can't believe I got away with that,` Natalie burst into nervous giggles as soon as the door to Meghan's tiny little house closed behind them.

    `Meghan That was magnificent. I wish I could do that,` Meghan's gave was admiring, and Natalie was suddenly bashful.

    `N You're the most powerful wizard in the world, you could totally do that. Also one of the most politically influential people in Vailia, and smart, and...`

    Meghan shook her head. `Meghan And all I really want is to read my books and be left alone. They,` she gestured vaguely at the door, indicating the rest of the world, `Meghan just assume I'm going to marry some guy. I mean, yes, I'll have a child eventually. Continuing the magic unbroken is more important than my preferences, but, just... <i>eventually.</i> Not now.`

    `N You like girls, then?`

  || Meghan/Serious
    That got Natalie a sour look. `Meghan I don't like girls either, so don't think...`

    Nat held up her hands. `N Sorry, sorry, I didn't mean it like that. Promise I'm not trying and get in your pants, I just wanted to make all those expectant looks sod off, and it seemed like you did too, so...` she trailed off hopefully.

    Meghan nodded, accepting the apology. `Meghan Let's talk about something else. Um... have you read Treatise on Historical Storm Patterns?`

    Natalie relaxed and gave a tentative smile. `N I think he's wrong about the causes, but...`
  """

Place.Vailia.stories.Ch2 = Object.keys(s)
for key, value of s
  Story[key] = value
