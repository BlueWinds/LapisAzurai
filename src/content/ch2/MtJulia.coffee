export NonkeniaDiplomatSailing =
  where: 'MtJulia|Ch2'
  label: 'Make nice with Diplomat'
  cost: 0
  history:
    NonkeniaDiplomat: true
  effects:
    xp:
      Natalie: 3
  text: -> """
  || Ameliss/Normal
    `N Come in, please.` Natalie shut the door behind Ameliss and gestured to the single chair, taking a seat on the bed herself.

    Ameliss sat down with a flourish, sweeping her long dress to one side. Ignoring any semblance of common sense, the diplomat looked better dressed for a ballroom than moving around aboard a ship. Long icicle black hair and steel eyes, piercing lips, a smile that seemed to mean the opposite of what one should...

    `N I'm afraid Guildmaster Janos never gave me your bodyguard's name,` Natalie reached for something to talk about.

    She gave a stare that made Natalie feel as though she'd burst out cussing at a formal dinner. Why would you want to talk about him when I'm so much more interesting, it seemed to say. ` He told me that you have been giving him a hard time? I didn't believe him, of course, that someone so well-regarded by the Guildmaster as yourself would begrudge him a snack...`

    `N He is welcome to help himself to the galley, but yes, there was a bit of a scuffle when he took a piece of bread off one of the men's plates.` Natalie shrugged and tried not to smile. `N I made the two of them clean the food off the ceiling afterwards - it was only fair, since the sailor was the one who threw the soup - but can't fault him for sticking up for himself.`

    Ameliss pursed her lips in annoyance, as though having trouble believing that Natalie would actually admit a food fight occurred on her ship. ` That is unfortunate, and I shall have to speak with him about his manners.`

    It sounded like an apology, but couldn't help but feel like Ameliss was more annoyed at her for refusing to fault the sailor than anything. She tried not to sigh. This was going to be a long voyage.
"""

export GatherWood =
  where: 'MtJulia|Ch2'
  label: 'Gather Wood'
  history:
    Ch2: true
  effects:
    xp:
      James: 3
  text: -> """
  || places/MtJuliaDay
    Mt. Julia's forested surroundings were an excellent source of timber, untamed and mostly unexploited by human hands - but only a secondary source of lumber for Vailia's growing merchant fleet. With almost no permanent inhabitants, it made only a minimal contribution to the region's industry, despite its seeming abundance.

    James pointed out several trees to the crew, marking them for felling and cutting into the planks and boards needed to keep the ship in good repair. Strange that no one lived here - wandering through the pleasant woodland paths, the usual explanation of "too rugged" didn't really hold up. Perhaps something else kept settlers away. James shivered and sought the Lapis out with his eyes. He already had a home, and it suddenly seemed more inviting than this far-too-perfect isle.
  """

export ExploreForest =
  where: 'MtJulia|Ch2'
  label: 'Explore Forest'
  history:
    GatherWood: true
  effects:
    xp:
      James: 3
  text: ->"""
  || N/Upset
    `N I don't see what you hope to find. The bartender's a little odd, sure, but outside of Vailia <i>everywhere</i> is a little odd. This place is harmless enough. Let's not go poking it with a stick to see what we can wake up.`

    `J I'm not poking it with a stick, I'm just going to go take a look at that building around back. Knock on the door, say hello.`

    `N I suppose so. Don't go exploring just because the door 'happens' to be unlocked, though.` She sighed and waved acceptance with one hand.

  || places/MtJuliaDay
    Around behind the inn and at a distance from the large storage building sat a small hut, nestled back a hundred yards from the other buildings and half obscured by the forest. A little curl of smoke rose from the stone chimney. James and one of the crew took a roundabout approach, avoiding the inn and approaching from another direction.

    After ten minutes of picking their way around trees and over logs and scrambling down and back up gullies, they'd both noticed something wrong. Though the hut remained close enough to see, it somehow never seemed to draw any closer. James nodded, and the sailor nodded in agreement. It was strange, but they weren't ready to give up just yet.

    Slowly, much more slowly than their legs and minds reported, they began to draw nearer. More worrisome than the mere fact that they'd come at least a mile on their way to a destination only a hundred yards distant, were the changes in the forest around them. It was darker now, the trees closer overhead, the bushes more thorny and with fewer friendly leaves.

    Something was very here. ` We should go back, sir. I don't like this.` The crewman hugged himself, looking around nervously.

  || J/Upset
    `J Nor I. Just a little further, we are making progress.` He gestured to the hut - by now only half as far away. They started walking again.

    The forest grew darker still, silent now, no sound of the distant ocean, which couldn't possibly actually be distant. Shadows began to flank them, something fast and predatory running through the forest in the distance, watching them. James stopped and drew his sword. When they stopped moving, the shadows also paused, watching.

    `J Ok, you're right, this was a bad idea,` James finally admitted. The sailor nodded, but didn't say anything. `J Let's turn back.`

    Thirty paces and they were at the back of the inn, the sun shining brightly overhead again and the shadows gone. The little girl who ran the tavern was out back, splitting wood.

    ` What'cha doing out back here?` She asked, struggling to swing the weight of the sledge over her shoulder. Thunk, it drove the wedge deeper into the log she was splitting. ` Wanna give me a hand? I wish my parents helped with chores sometimes.`

    James shuddered again.
  """

export AsarasMagic =
  where: 'MtJulia|Ch2'
  label: "Asara's Magic"
  required: 'GameOverLove'
  history:
    TomenoiRoute: true
  effects:
    xp:
      Asara: 5
  text: -> """
  || travel/DeckNight
    `A I wish to test my power.`

    Natalie tripped over her own feet, startled. She could have sworn she was alone on deck, everyone else asleep. `S Oh, Asara, make some more noise. You'll frighten me to an early grave.`

    `A You are my friend. Only enemies should fear me.` She said it with such a straight face that Natalie wasn't sure if it was a joke or not. She wasn't sure if Asara even knew how to joke. Natalie settled for an uncertain laugh.

    `N You, um, you aren't going to burn the ship down, are you?`

    `A No. That was...` she shuddered, suddenly looking small and vulnerable. Natalie regretted asking the question, and had to stop herself before she put a hand on Asara's shoulder. `A ...I cannot do such a thing again. My sisters may be so powerful, but I am not. I will be summoning only the blessing, not the flames.`

    It did confirm, unfortunately, that Asara had been responsible for a pillar of silver flame visible from thirty kilometers away, which splintered a ship and made steel run like molasses. Not a comfortable thought. `N What is 'the blessing'?`

  || A/NormalFull
    `A The blessing of steel,` she gestured to her silvery eyes. They were truly colorless, sapping even the gold from reflected lantern light. `A I will become strong for a time, nothing more. I merely wished to warn you so you did not think something was amiss.`

    `N If all it's going to do is make you strong, how would I know?`

    `A You are a witch, are you not? Your crew calls you one. It is not magic, but you will feel it.` After weeks of near silence and monosyllables, suddenly Asara was being downright talkative. But rather than answering any of Natalie's questions, every time she opened her mouth she raised new ones.

    `N Go ahead. Thank you for the warning.`

    Asara brought out the half-melted chain that had bound her wrists when they first met. Natalie hadn't known she'd kept it. She strained at the broken manacles, tugging at the melted links. Ruined, yes, but still steel. Of course nothing happened.

    Then Natalie felt powers gathering, like a storm only visible to the inner mind, making her bones ache and her head pound. Nothing happened. Her head began to swim. Slowly, ever so slowly, the steel links between Asara's hands began to twist and groan, stretching and warping as though being ripped apart by a team of horses rather than a delicate pair of hands. Natalie grasped her head with both hands. It hurt to think.

    And suddenly it was over. The manacles remained deformed, but the chain hadn't broken. The world no longer pounded nails into Natalie's head. Asara looked at her, then at the metal in her hands, pursing her lips. She threw them. It was a good throw – a plunk reached them a moment later as they landed in the water and sank.

    `A I am not yet ready.` She walked away, leaving Natalie with a million more questions.
  """

export JamesUpsetMagic2 =
  where: 'MtJulia|Ch2'
  label: 'James is Upset'
  required: 'GameOverTrust'
  requiredGroup: 'Ch2Routes'
  _class: 'JamesRoute'
  history:
    JamesUpsetMagic: true
  effects:
    xp:
      Natalie: 3
      James: 3
  cost: 0
  text: ->"""
  || travel/CabinNight
    A hesitant knock. That could only mean one thing. James never hesitated to address business, no matter how bad the news. He must finally want to discuss whatever has been bothering him. Natalie took a moment to compose herself before opening the door. `N Yous?`

    `J Can I come in?`

    She gestured to the bed, the only other place to sit in the room besides her chair, but he remained standing, closing the door behind him.

    `J Why didn't you tell me?`

    Straight to the point – it caught her off guard. How much time must he have spent agonizing over that question, to work up the nerve to ask her straight out?

    `N I've never told anyone, James. Until the... the storm, there were precisely three people in the world who knew: me, the Guildmaster, and the hedge wizard he hired to teach me, with an unbreakable seal upon his mind to keep his silence.`

  || J/Upset
    `J That's not a reason. I would protect your secrets with my life, Nat, you know that.`

    `N That's exactly the problem!` She punched his leg – not playfully, but with genuine anger. He didn't flinch. `N With your life! I don't want your life on the line.` She slumped back in her chair, hating herself for the sudden display. `N Do you know what happens to a childless sorceress of my power and inexperience and age?`

    `J I... that's not fair...`

    `N There aren't any.`

    `N There aren't any. They all learn to use their magic to defend themselves, or they have a child with someone powerful who can protect them. If that secret got out, do you think a little girl without family wouldn't just disappear? Even in Vailia? In a heartbeat.`

    She stood up from her chair. Natalie couldn't tower over him, but she could certainly press him back against the door with her unfair words. `N I was eight, when I learned. Could you have kept that secret for me? Not even hinted at it to your parents, when you were eight fucking years old?`

    James didn't get angry. He just looked uncomfortable and hurt, and somehow that only fueled Natalie's anger. She screamed something and punched his chest, unable to find any better way to express herself. She tried to hit him again, but rather than taking this one, he caught her fist in one hand. She struggled a moment trying to free it, but his grip was too strong, and he pulled her into a hug.

    `J I would have, Nat, even at eight I would have died rather than betray your trust.`

  || N/Upset
    She burst into tears. Sobs wracked her body as she stopped struggling and clung. He let go her hand and wrapped his other arm around her, supporting them both as she sagged against his chest. She wailed and shook in his arms, letting out a tiny portion of two decades of uncertainty and fear.

    It didn't take long for Natalie to cry herself out. She was too self-aware to let loose for long, and she quickly quieted and stilled. She'd hurt him, even if her fist hadn't connected.

    She tilted her head up to look into his eyes, green and green meeting in a quick and mutually aborted glance. They both blushed and stepped back to conversational distance. His own glance downward suggested that yes, he'd suddenly become as intensely aware of the way her breasts pressed against him as she had.

    `N I'm sorry. Please, lets talk another time.`

    He nodded and made a hurried escape from her room.

    Natalie slumped against the wall and rubbed her eyes with the heel of her palms. He deserved a better apology. She deserved a brick to the head. She sniffled and hugged her chest.
  """
