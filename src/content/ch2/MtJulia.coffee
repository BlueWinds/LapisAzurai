p = {}

p.NonkeniaDiplomatSailing =
  label: 'Make nice with Diplomat'
  history:
    NonkeniaDiplomat: 0
  experience:
    Natalie: 3
  text: -> """
  || bg=travel/CabinDay left=N/normal
    `N Come in, please.` Natalie shut the door behind Ameliss and gestured to the single chair, taking a seat on the bed herself.

  || left=N/normal right=Ameliss/normal
    Ameliss sat down with a flurish, sweeping her long dress to one side. Ignoring any semblance of common sense, the diplomat looked better dressed for a ballroom than moving around aboard a ship. Long icicle black hair and steel eyes, piercing lips, a smile that seemed to mean the opposite of what one should...

    `N I'm afraid Guildmaster Janos never gave me your bodyguard's name,` Natalie reached for something to talk about.

  || left=N/normal right=Ameliss/angry
    She gave a stare that made Natalie feel as though she'd burst out cussing at a formal dinner. Why would you want to talk about him when I'm so much more interesting, it seemed to say. ` He told me that you have been giving him a hard time? I didn't believe him, of course, that someone so well-regarded by the Guildmaster as yourself would begrudge him a snack...`

  || left=N/uncertain right=Ameliss/angry
    `N He is welcome to help himself to the galley, but yes, there was a bit of a scuffle when he took a piece of bread off one of the men's plates.` Natalie shrugged and tried not to smile. `N I made the two of them clean the food off the ceiling afterwards - it was only fair, since the sailor was the one who threw the soup - but can't fault him for sticking up for himself.`

  || left=N/uncertain right=Ameliss/serious
    Ameliss pursed her lips in annoyance, as though having trouble believing that Natalie would actually admit a food fight occurred on her ship. ` That is unfortunate, and I shall have to speak with him about him manners.`

    It sounded like an apology, but couldn't help but feel like the Ameliss was more annoyed at her for refusing to fault the sailor than anything. She tried not to sigh. This was going to be a long voyage.
"""

p.GatherWood =
  label: 'Gather Wood'
  history:
    Ch2: 0
  experience:
    James: 3
  text: -> """
  || bg=places/MtJuliaDay
  Mt. Julia's forested surroundings were an excellent source of timber, untamed and mostly unexploited by human hands - but only a secondary source of lumber for Vailia's growing merchant fleet. With almost no permanent inhabitants, it made only a minimal contribution to the region's industry, despite its seeming abundance.

  -- James pointed out several trees to the crew, marking them for felling and cutting into the planks and boards needed to keep the ship in good repair. Strange that no one lived here - wandering through the pleasant woodland paths, the usual explanation of "too rugged" didn't really hold up. Perhaps something else kept settlers away. James shivered and sought the Lapis out with his eyes. He already had a home, and it suddenly seemed more inviting than this far-too-perfect isle.
  """

p.ExploreForest =
  label: 'Explore Forest'
  history:
    GatherWood: 0
  experience:
    James: 5
  text: ->"""
  || bg=travel/DeckDay right=N/uncertain
    `N I don't see what you hope to find. The bartender's a little odd, sure, but outside of Vailia <i>everywhere</i> is a little odd. This place is harmless enough. Let's not go poking it with a stick to see what we can wake up.`

  || left=J/upset right=N/uncertain
    `J I'm not poking it with a stick, I'm just going to go take a look at that building around back. Knock on the door, say hello.`

  || left=J/upset right=N/embarrassed
    --> `N I suppose so. Don't go exploring just because the door 'happens' to be unlocked, though.` She sighed and waved acceptance with one hand.

  || bg=places/MtJuliaDay speed=slow

  !! Around behind the inn and at a distance from the large storage building sat a small hut, nestled back a hundred yards from the other buildings and half obscured by the forest. A little curl of smoke rose from the stone chimeny. James and one of the crew took a roundabout approach, avoiding the inn and approaching from another direction.

    After ten minutes of picking their way around trees and over logs and scrambling down and back up gulleys, they'd both noticed something wrong. Though the hut remained close enough to see, it somehow never seemed to draw any closer. James nodded, and the sailor nodded in agreement. It was strange, but they weren't ready to give up just yet.

    Slowly, much more slowly than their legs and minds reported, they began to draw nearer. More worrisome than the mere fact that they'd come at least a mile on their way to a distination only a hundred yards distant, were the changes in the forest around them. It was darker now, the trees closer overhead, the bushes more thorny and with fewer friendly leaves.

    Something was very wrong here. ` We should go back, sir. I don't like this.` The crewman hugged himself, looking around nervously.

    `N Nor I. Just a little further, we are making progress.` He gestured to the hut - by now only half as far away. They started walking again.

    The forest grew darker still, silent now, no sound of the distant ocean, which couldn't possibly actually be distant. Shadows began to flank them, something fast and preditory running through the forest in the distance, watching them. James stopped and drew his sword. When they stopped moving, the shadows also paused, watching.

    `J Ok, you're right, this was a bad idea,` James finally admitted. The sailor nodded, but didn't say anything. `J Let's turn back.`

    Thirty paces and they were at the back of the inn, the sun shining brightly overhead again and the shadows gone. The little girl who ran the tavern was out back, splitting wood.

    ` What'cha doing out back here?` She asked, struggling to swing the weight of the sledge over her shoulder. Thunk, it drove the wedge deeper into the log she was splitting. ` Wanna give me a hand? I wish my parents helped with chores sometimes.`

    James shuddered again.
  """

p.AbandonedShip =
  label: 'Encounter at Sea'
  history:
    Ch2: 0
  experience:
    Asara: 3
  text: ->"""
  || bg=travel/SailingDay
    -- `K Ship ahoy!` Kat called out from her position on the starboard side of the deck, and everyone turned to look. Natalie shaded her eyes, trying to make out anything in the bright sun.

    Drifting slowly closer, it became apparent that the other ship was abandoned, listing to one side as though it had taken on a great deal of water. The Azurai put on sail to approach more rapidly.

    It was more of a half-floating wreck than a real ship at this point, wind-slashed sails and rotting timbers. One of the crew suggested immediately that they fire the thing and be on their way – a funeral fitting an abandoned ship. Hard to say though – there might still be something valuable aboard, and even if not, some of the wood or sailcloth might still be salvageable. Not to mention curiosity for its own sake.

    -- Natalie was about to give the order to lower one of the boats when Asara spoke up. Natalie hadn't seen her arrive on deck - she spent much of her time below, hiding in Natalie's cabin or the cargo hold.

    `A The crew escaped in boats and the cargo is rotten. We should send them on their way.`

    -- `K How can you tell from here?` Kat shaded her eyes against the bright sun, leaning over the railing as though that would give her a better view of the wreck's interior.

    `A They did not all escape the storm. One of them died, and it was a full moon,` Asara nodded, as if expecting that to somehow explain everything. When everyone on deck turned to look at her, she didn't shrink away from the attention as Natalie had assumed she would.

    `A It was at sea, but the full moon is a stronger influence. This falls within my lady's domain.` Her unusual confidence under scrutiny failed, and she hunched her shoulders under the continued gaze of the crew and officers.

    Natalie took pity on her - it was more than the poor girl usually explained herself, and if it was important to her... `N James, fire arrow. Let's set it alight and we'll have a few minutes of silence.` Natalie turned back to smile at Asara, but she was already gone back below decks.
  """


p.AsarasMagic =
  label: "Asara's Magic"
  history:
    TomenoiRoute: 0
  experience:
    Asara: 5
  text: -> """
  || bg=travel/deckNight
    `A I wish to test my power.`

    Natalie tripped over her own feet, startled. She could have sworn she was alone on deck, everyone else asleep. `S Oh, Asara, make some more noise. You'll frighten me to an early grave.`

    `A Unlikely. You are my friend, and only enemies should fear me.` She said it with such a straight face that Natalie wasn't sure if it was a joke or not. She wasn't sure if Asara even knew how to joke. Natalie settled for an uncertain laugh.

    `N You, um, you aren't going to burn the ship down, are you?`

    -- `A No. That was...` she shuddered, suddenly looking very small and vulnerable. Natalie regretted asking the question, and had to stop herself before she put a hand on Asara's shoulder. `A ...I cannot do such a thing again. My sisters may be so powerful, but I am not. I will be summoning only the blessing, not the flames.`

    It did confirm, unfortunately, that Asara had been responsible for a pillar of silver flame visible from thirty kilometers away, which splintered a ship and made steel run like molasses. Not a comfortable thought. `N What is 'the blessing'?`

    `A The blessing of steel,` she gestured to her silvery eyes. They were truly colorless, sapping even the gold from reflected lantern light. `A I will become strong for a time, nothing more. I merely wished to warn you so you did not think something was amiss.`

    -- `N If all it's going to do is make you strong, how would I know?`

    `A You are a witch, are you not? Your crew calls you one. It is not magic, but you will feel it.` After weeks of near silence and monosyllables, suddenly Asara was being downright talkative. But rather than answering any of Natalie's questions, every time she opened her mouth she raised new ones.

    `N Go ahead. Thank you for the warning.`

    Asara brought out the half-melted chain that she'd been bound with when they first met – Natalie hadn't known she'd kept it. She strained at the broken manacles, tugging at the melted links. Ruined, yes, but still steel. Of course nothing happened.

    -- Then Natalie felt powers gathering, like a storm only visible to the inner mind, making her bones ache and her head pound. Nothing happened. Her head began to swim. Slowly, ever so slowly, the steel links between Asara's hands began to twist and groan, stretching and warping as though being ripped apart by a team of horses rather than in a small girl's bare hands. Natalie grasped her head with both hands. It hurt to think.

    And suddenly it was over. The manacles remained deformed, but the chain hadn't broken. The world no longer pounded nails into Natalie's head. Asara looked at her, then at the metal in her hands, pursing her lips. She threw them. It was a good throw – a plunk reached them a moment later as they landed in the water and sank.

    `A I am not yet ready.` She walked away, leaving Natalie with a million more questions than before the conversation had begun.
  """

Place.MtJulia.pages.Ch2 = Object.keys(p)
for key, value of p
  Page[key] = value
