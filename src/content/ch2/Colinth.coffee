s = {}

s.ColinthArrive =
  label: 'Arrival'
  blocking: true
  required: 'GameOverExploration'
  history:
    KantisRegion3: true
  effects:
    xp:
      Kat: 3
  text: -> """
  || places/ColinthDay
    For the first time since taking possession of the Lapis Azurai, Natalie was reminded of exactly how <i>small</i> of a ship it was. While Colinth's docks teamed with fishing boats, cutters, and other ships of the Lapis' class, all of them moved around several hulking giants, clearly ships of war. Catapults mounted on deck, triple banks of oars, high fore and aft castles with arrow slits... Vailia had nothing like them.

    Not that Vailia <i>needed</i> anything like them. She could see James shaking his head, and thought he was agreeing with her estimate - a waste of good timber. They looked fearsome, surely and no other ship would dare stand before them, but their sails would be too small for long journeys on the open ocean, and the castles made it too heavy to survive a storm on the open sea.

    `K What are you two looking so morose about?` Kat nearly scared Natalie out of her skin, popping up behind her without warning.

    `N Warships. And they can't sail the open ocean, which means they're only good for bullying neighbors,` Natalie shook her head. `N I don't like it.`

    `K They're not all from Colinth,` Kat pointed. `K See, the sailors on that one are dressed differently.`

    Nat squinted and shielded her eyes from the sun with one hand, but couldn't make out anything more than 'there are people there' on the ship Kat pointed to, still distant. `N I suppose so. It would match with what I heard - Kantis and Colinth in an uneasy peace, taking turns dominating the region as the balance of power sways. Janos thinks it's unstable and will turn into a war soon.`

    Kat muttered darkly, but shook her head when Natalie asked. `K Don't worry about it. So, what are we here for?`
  """

s.ColinthAmulets =
  label: 'Magical Amulet'
  required: 'GameOverPower'
  requiredGroup: 'Ch2Routes'
  history:
    ColinthArrive: true
  effects:
    xp:
      Natalie: 2
  cost: 2
  text: -> """
  || places/ColinthDay
    Natalie winced and rubbed her forehead. Something in the air around here felt miserable, a constant low buzzing. It had begun when she'd entered the shop, and Kat had only shaken her head, not feeling anything, when Nat had asked her. `N I'm sorry, what I got distracted. What was that?` She tried to refocus on the conversation.

    The merchant repeated his offer, a rather good price on fresh mulberries, but Natalie found her attention drifting again even as he went through the terms again for her. He had a most interesting amulet - a red gem of some kind on a silver chain. With a start, Natalie realized it was the source of the buzz that was distracting her so. It was magic. She wrenched her attention back to the business deal. `N Um, yes. I can take a small load first, see how well they sell in Vailia. The ones I've seen before haven't traveled well, but it's possible a faster ship like the Lapis might make the difference. You'll have to cover 50% of the cost though - I can't afford all the risk, even for a small sample run. Acceptable?`

    While he mulled it over, Natalie realized why the amulet hurt - it was tugging on her own power, and she'd reflexively raised it to protect herself. Using her own magic always brought pain. No wonder Kat hadn't felt anything.

  || K/Happy
    `K You like it?` Kat leaned close and whispered in her ear, apparently noting the way she was staring at the amulet.

    `N No! It hurts. It's magic.` She wanted to flick Kat's cheek, wipe off the speculative look that crossed her face, but instead had to turn attention back to the merchant. With the amulet. Which hurt to think about. `N I can't go lower than 50%, but I can certainly cut you in for half of the profit if it does go well. I'm looking to hedge the risk here, and that shouldn't be an issue if you're confident they'll keep properly on the voyage.` She fell back into haggling while Kat continued to stare at the amulet in a way that Nat tried to convince herself <i>didn't</i> mean she was going to steal it later.
  """

s.ColinthAmulets2 =
  label: 'Magical Amulet'
  history:
    ColinthAmulets: true
  effects:
    xp:
      Kat: 3
  cost: 0
  text: -> """
  || travel/CabinNight
    `N You didn't.`

    `K I totally did. Here.` Kat swung the amulet by its chain, staring at the stolen jewelry. She liked the red stone.

    `N You should give it back. I don't like it.` Natalie was rubbing her head the same way as she had been in the shop before.

    Kat grinned at her, giving her best 'I'm not sorry and you can't make me be' look, the one that Natalie found both exasperating and endearing. She opened her mouth to chide her crew member more, but Kat shut her up by tossing the amulet to her. `K I want to know what it is, before you make me give it back to him.`

    Reflexively, Natalie caught it. White-hot light blazed from the captain's hand, and she whimpered. The light grew brighter, and Natalie screamed.

    Kat grabbed the pendant out of her hand, and the light vanished. Natalie slumped in her chair, breathing heavily. `K What was that?!`

    `N Take it back to him,` Natalie managed. Kat leaned forward, accidentally bringing the amulet close again. Natalie whimpered and pulled her knees up to her chest.

    Kat hesitated a moment, torn between the impulses, then firmed her resolve and ran to do as she was told.

  || travel/DeckNight
    Her own breath was catching now, hoping against hope that Natalie was ok, wondering if it was ok to just leave her alone, cursing her own self-absorption... she nearly ran into Asara, who was running in the opposite direction, towards Natalie's cabin. Her first impulse was to shove the amulet into Asara's hands, tell her to deal with it, but even half panicked, she remembered that it might hurt Asara too, if it didn't like magic, and...

    A grip like iron descended on her shoulder, bringing her thoughts to a screeching halt. `A Who does it belong to?`

    `K I, it... it's the third house on the left, the big avenue eastward from the fish market, and...`

    The amulet didn't react when Asara took it from Kat's hand. Asara just shook her head, examining it. `A I will return it. You should not interfere with things you do not understand.`

    Kat raised her head, a sudden surge of annoyance that Asara would continue to remain mysterious when Natalie's life was one on the line, but there was no one to shout at. She was alone on the deck again, Asara already gone.

  || travel/CabinNight
    `N I'm fine,` Natalie greeted her as she returned to the room. A little quiver remained to give lie to her words, but still, it was a big improvement from curled up in a ball. `N It stopped hurting as soon as you took it out of the room.`

    `K What was it?` Kat hugged her arms across her chest, uncertain voice barely above a whisper.

    `N I don't know. It just... it tried to taste my magic or something, and I resisted, which hurt. My power read that as an attack, and hit back, which hurt more, and it was too dumb to back down and too strong to smash, and well, ouch.` She rubbed her forehead, then seeing the non-comprehension on Kat's face, `N I'm not sure why, but it's always hurt to use my powers. Usually it's under my control, so I'm expecting it and can brace myself, but...` She shrugged helplessly. `N Honestly, I'm not even sure the amulet was hostile. I think my lack of skill just caused a vicious cycle which spiraled out of control.`

    `K That's...` Kat hesitated, then threw her arms around Natalie, burying her head in the other woman's neck. `K I was so scared.`
  """

s.Muggers =
  label: 'Muggers'
  required: 'GameOverViolence'
  requiredGroup: 'Ch2Routes'
  history:
    ColinthArrive: true
  effects:
    xp:
      Asara: 3
  text: -> """
  || places/ColinthNight
    `A I do not like this place.` Asara kept close to Natalie as they walked.

    Natalie nodded agreement, and quickened her pace. There was nothing to say, since she agreed with the sentiment. Colinth had seemed bright and friendly by daylight, but now that the sun had set, it was far less welcoming. The streets were clean, but poorly lit. Not enough people stayed out past evening. Everyone hurrying home as soon as the sun set worried Natalie. She tried to put a comforting hand on Asara's shoulder, but the smaller woman ducked out form under the touch, and her hand brushed only empty air.

    She turned a corner, and suddenly there was a heavy hand on her shoulder. Natalie didn't scream, nor did she try to pull away or ask what was happening. She just drove a knee forward, aiming for a stomach or groin. She made contact, drawing a heavy oof from the man. He didn't go down. A second hand descended on her waist, and before she could slip the grip, he just shoved her sideways into the wall. It was all too fast to think.

  ||
    Natalie's head bounced off the brick wall.
    She saw stars.
    She tasted blood.
    She saw nothing.

  ||
    Blood. Moonlight. Pain. Slowly Natalie returned to consciousness. She moved her head and her vision swam, drawing a gasp of pain. Bracing herself with one hand she managed to sit up.

    Asara was the only one standing. Silver moonlight streamed around her, lighting her hair like a halo and glinting off the sword in her hand. Drip. Drip. In reflected off the pools of rivulets of blood surrounding her, slowly making their way along the cracks in the cobblestone. Nothing else moved. Natalie couldn't breathe. Asara stayed motionless a moment longer, then flicked her blade, sending a flight of red droplets scattering. She wiped her sword on a piece of cloth and sheathed it at her hip. That action accomplished, Asara returned to stillness, as though waiting for something more to happen.

    Natalie broke the tableau by groaning. She gingerly felt the painful spot on her head - it wasn't wet. Good. No lump yet either, which meant she'd only been out a moment. She inched up the wall towards standing. She stepped away without wobbling. Doubly good.

    `N What... you killed them?`

  || A/Sad
    Asara turned slowly. The light was too dim to actually see, but Natalie could imagine the haunted, dead look of Asara's eyes. Nat had seen that look enough for a lifetime from when they'd first rescued Asara from the wreckage on the beach. `A They tried to touch me with ill intent.` Her voice was completely flat. Then, in a whisper, `A Never again.`

    `A We should go.`

    `N I... you know, I don't really want to explain this to the authorities. You're right.`

    `A There are no witnesses. A woman across the street closed her shutters a moment before it began.`

    `N You killed them all?` Natalie didn't really need to ask. Her eyes slid around the three unmoving... slid around things, but no one lay that still if they were still breathing. `N I need to think about this.`

    `A What is there to think about?` The dead voice was back again. `A They hurt you and I killed them. Killing your enemies is how you stop them from hurting you more.`

    `N Let's... let's just go.`
  """

s.KantianSorcerer =
  label: 'Sorcerer'
  required: 'GameOverPower'
  requiredGroup: 'Ch2Routes'
  history:
    ColinthArrive: true
  effects:
    xp:
      Natalie: 3
  cost: 2
  text: ->"""
  || places/ColinthNight
    Natalie stood in the storm, luxuriating it the feel of wind and lightning and rain untamed. The region around Kantis felt somehow different from that around Vailia - wilder, less controlled. Perhaps it was the lack of Lady Meghan. Without a supremely powerful sorceress drawing the elements into her orbit, they were free. For once Natalie's magic didn't hurt. She let the power flow through and around her, ignoring the chill seeping steadily through her bones and rivulets of water finding their way underneath her cloak.

    Immersed in magic as she was, she became aware of another presence approaching long before he was visible through the pouring rain. A man. Not as strong as herself, but confident and wary, his presence as tightly wound as a coiled watch spring.

  || Elakim/Normal
    His physical appearance matched that impression. Blue jacket and sharply pressed sleeves, water sleeting around him but leaving him untouched. His retinue wasn't so lucky. The manservant following behind with a pair of heavy bags looked miserable, and even the two soldiers keeping the way clear ahead of him seemed worse for the wear. Or at least they would have been keeping the way clear if anyone else were so foolish as to stand out in the storm.

    Natalie stepped aside as he approached, but rather than passing by, he stopped in front of her. `Elakim Who are you?` His accent was so thick that even Natalie, not a native of these parts, could tell he want from Kantis rather than Colinth.

    `N Natalie Rowena. Vailia. And you?`

    He studied her a moment in silence. The rain continued to fall over them in a heavy blanket, comforting her with its wild power and avoiding him entirely. `Elakim Elakim, of house Apollon. Welcome to Colinth.` He lapsed into silence again, studying her.

    `N Forgive me if I've said something improper. Vailia is far, and I've never met a Kantian sorcerer before.`

    `Elakim No, forgive me for staring. I was not aware that Vailia had more than one sorcerer. And your power is... unusual.` His continued appraising stare was at odds with the apology of his words.

    `N Unusual in what way?`

    `Elakim I am sure you must have your reasons for keeping it as you do. Please feel free to visit the Apollon estate if you are ever in Kantis. I will swear a guest oath and entertain you properly.` He gave a little half bow and turned to continue on his way.

    As much as she wanted to call him back and ask him to explain more, Natalie didn't think it go over well with Elakim. She watched him departing for a moment, then hugged herself and stepped back inside the inn. The storm no longer felt quite so welcoming.
  """

s.AsarasTrauma =
  label: "Asara's Trauma"
  required: 'GameOverViolence'
  requiredGroup: 'Ch2Routes'
  history:
    Muggers: true
    AsaraTalkSisters: true
  cost: 2
  text: ->"""
  || travel/CabinNight
    `N Please, sit down.`

    Asara glanced between Natalie sitting on her bed and the chair she was gesturing to, then shook her head. Natalie sighed.

    `N No, please, sit.` She tried to put kindness and frustration frustration and desire to help into her voice, and it must have worked, because after a moment, Asara did take the seat.

    `N Thanks.` Natalie cradled her head in her hands for a moment, trying to compose her next words. She knew what to say. She'd decided this had to be done. She'd rehearsed it a hundred times in her mind. Why was it so hard to make the words come out?

    `N Asara, I want to help you. But I can't because I don't know anything about you, and you won't open up to me. You've told me things... but they're so incomplete, so fragmented, I can't make sense of you. I want to help you so much." Natalie laid a hand on Asara's shoulder, flinching a little in sympathy when Asara flinched from the touch. She didn't let go though, and Asara made no move to shrug her off.

    Silence.

  || A/Crying
    Then... a hiccing little sob. Barely noticeable, it wasn't repeated. Asara was always so quiet - even her breathing was inaudible.

    ` Asara... will you tell me what happened to the ship you were on before I met you?`

    `A I... I'm on a mission. My home... my sister Antinua. She's in Vailia. We need her home again. She's so strong, and I'm so weak, and... I was coming to find her. A pirate ship. I killed them, and killed them, and killed them, but the Kantians pay so much money for one of the priestesses that they kept me alive when everyone else on the ship was dead.` The dead, lifeless tone she used sent shivers down Natalie's spine, and she drew her hand back. She wished Asara would cry - that would have been so much better than hearing her emotionless and bleeding like a stone.

    `A They... they kept me alive. My wounds would have killed anyone without the blessings of the goddess. They did horrible things to me, and kept me drugged, and wouldn't kill me. I healed from... from things, and I wanted to die, and then they started again.`

    `A Finally, after nearly a week, I summoned the will to call upon my blessings. I burned the drugs out of my system. I burned the men standing over me. I burned the room. I burned everything and everyone.`

    `A And then you found me. And I still want to die, but I can't because I need to find Antinua.`

    Natalie folded Asara in a hug, hiding the young woman from the world in the folds of her shirt. It tore at her heart the way Asara shivered at the touch and shrunk away, but slowly the the shudders gave way to silent sobs. Natalie held her tightly.

    `N Ssh, ssh, it's alright, you're with me now, I won't let anyone hurt you...`
  """

Place.Colinth.stories.Ch2 = Object.keys(s)
for key, value of s
  value.place = 'Colinth'
  Story[key] = value
