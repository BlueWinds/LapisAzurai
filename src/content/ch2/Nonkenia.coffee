export NonkeniaArrive =
  label: 'Arrival'
  blocking: true
  required: 'GameOverExploration'
  extraDays: 50
  history:
    NonkeniaRoute: true
  effects:
    xp:
      Natalie: 3
  text: ->"""
  || places/NonkeniaNight
    The Lapis arrived late at night, slipping silently into the sheltered bay that Natalie's maps insisted was the center of Nonkenia. It was hard to believe that this empty expanse of sand, much like hundreds of others they'd already sailed past, was something special.

    The signs were there, though; obvious enough to careful eyes as the crew lowered the anchors. There was no dock, but the beach was broken with ridges and piles of sand, as though heavy objects had been dragged over it recently. And the forest was thinner, less overgrown. Natalie would bet good money that trails leading inland would be visible in the morning.

    Lowering a boat into the water, Natalie felt as if eyes were twinkling at them from the edge of the forest, a feeling confirmed as soon as they set foot on the beach, when an old man emerged from his hiding place to greet them.

    ` Good evening. May I request an hour of your time before you enter the forest? It is dangerous at night.` Cracked and wizened with age, Natalie found his voice disturbing, threatening even, but pushed down her reaction and forced a smile.

    `N Of course. I'm Natalie, this is James, and...`

    ` Stop! Do not share your names so freely. Some might think you tried to ensnare them into reciprocating. Not me, of course. I am used to the ways of foreigners and know you mean no harm.` He gave a dry chuckle, and Natalie bit her tongue to avoid saying anything unfriendly. ` What brings you to the shores of Nonkenia?`

  || N/Embarrassed
    `N We come seeking opportunity for trade and mutual profit. I have a cargo hold full of things I think you might be interested in. But I was expecting a city, and all I see is an empty beach?`

    He chuckled again, and she couldn't help feeling like she was being mocked. ` Of course you do. I'd be a fool to expect anything else from a Vailian. It's too much to hope that you'd come to visit one of our grand temples, or repent for some devilry or other...` He continued to mutter as he took a jar at his hip and popped off the lid. Dipping a finger in, he reached towards her, something sticky looking - honey perhaps - dripping from his finger. ` Bend down. There's a good girl. I'm not as tall as I used to be.`

    She did as he asked, and he left a sticky dot on her forehead. He swatted away her finger when she reached up to wipe it away.

    ` There you go, girl. The forest isn't dangerous anymore. For you. As long as you take the left trail, then left fork, then right. Got that? Left, left, right.` Another dry chuckle, a sound Natalie was beginning to thoroughly loathe. ` Anyone else who feels like walking to the city, come and take your turn. You can wipe it off once you're between buildings, but make sure you get anointed again before you try to return to the ship. It'd be a shame if some of you didn't make it back.`
  """

export NonkeniaDiplomatDelivery =
  label: 'Deliver the "Diplomat"'
  cost: 0
  history:
    NonkeniaDiplomatSailing: true
  effects:
    xp:
      Natalie: 3
      James: 3
  text: -> """
  || places/NonkeniaDay
    Sploosh.

    `N Bye-bye!` Natalie waved cheerfully at the rippling ocean as an irate bodyguard bobbed to the surface, shot Natalie a dirty look, and began swimming for shore.

    `J ...`

    `J ...I didn't think you'd really do it.`

  || N/Excited
    Natalie grinned and turned to Ameliss, the diplomat she was being paid to deliver. `N I'll be getting paid now, if you don't mind.` She held out her hand, and when Ameliss hesitated, began tapping a foot on the plank she'd rigged in order to make the bodyguard walk it.

    ` Treachery! Piracy! Filthy backstabber!` The normally composed diplomat backed towards the rail, hissing insults and clutching the bag of money Janos had given her to pay Natalie with. ` I'll make you pay for this, see if I don't!`

    Natalie rolled her eyes and sighed. `N Can't take a joke, can you? Oh well. Come on boys, lower the boat and we'll take Ms. Not-going-for-a-swim ashore along with her luggage.`
  """

export AsaraTalkEyes =
  label: 'Talk with Asara - Silver Eyes'
  required: 'GameOverPower'
  requiredGroup: 'Ch2Routes'
  extraDays: 80
  _class: 'AsaraRoute'
  history:
    AsarasMagic: true
  effects:
    xp:
      Asara: 3
  text: ->"""
  || places/NonkeniaNight
    `N Your eyes, you pointed to them when you mentioned the 'blessing of steel'?` Natalie decided to press for some answers. She had many more questions, but this seemed safer than the others for the moment.

    `A They are a symbol. Like my hair and my skin,` Asara gestured to her straw-blond hair and fair skin, shrugging, `A they set me and my sisters apart from my people. Are not all Azaraki tribes-women the color of sand, dusky eyed and dusky haired? I am, and I am not.`

    `N Azaraki?`

    `A North of Kantis. And north again.`

    Natalie shook her head in wonder. Kantis was at the far edge of Vailia's sphere of influence, thousands of miles distant on the other side of the equator. To be so far beyond... truly she had an exotic guest. ` I'd like to hear more about your home, if you want to share,` Natalie hoped her interest would be taken positively, rather than as a bother by the reserved young woman.

    `A It is dry, and far away.` Apparently there were some subjects she didn't feel like talking about yet.
  """

export AsaraTalkSisters =
  label: 'Talk with Asara - Sisters'
  required: 'GameOverPower'
  requiredGroup: 'Ch2Routes'
  _class: 'AsaraRoute'
  history:
    AsaraTalkEyes: true
  effects:
    xp:
      Asara: 3
  text: ->"""
  || places/NonkeniaDay
    `N You've mentioned your sisters a couple of times. Not biological sisters, I gather?` Natalie asked, curious to see if Asara would continue talking about herself. The young woman never volunteered information, only answered questions, but somehow it didn't feel like Natalie's intrusions were unwelcome.

    `A There are seven of us. Well, perhaps six now. Or five,` she added a little sadly, then shook her head and quickly went on. `A We may pass on our power to a daughter, blood or adopted. Or if one dies without passing on her power, our goddess chooses another. That has happened too often of late.` A sad tone suggested that further inquiries into the matter would not be answered.

    `N Your goddess? Which one?`

    `A Azaraki. We are her chosen people.` Natalie wracked her brain trying to remember anything about the name other than that Asara had used it to refer to her people before. It was odd – the gods and goddesses worshiped didn't vary much throughout all the cultures Vailia had encountered – it was hard to debate exactly who belonged in the pantheon and who didn't when divine influence was quick to correct such matters on a personal level. Only so many false idols could be struck by lightning before people stopped worshiping them. Curious, then, that Natalie had never heard of a goddess potent enough to grant her priestesses such power. There were certainly no temples in Vailia.

    `N Tell me more about her?`

    Asara shook her head. Many of their conversations recently seemed to be going fine, then suddenly, a wall. Natalie didn't understand it, but pressing Asara only resulted in the small woman shying away, withdrawing into herself, or bursting out into tears. She sighed and let the subject drop.
  """

export JamesConfusion =
  label: 'Tension'
  history:
    JamesParents: true
  effects:
    xp:
      James: 3
  cost: 0
  text: -> """
  || travel/DeckDay
    `N Look, are you going to jump me or not?` Natalie finally expressed her frustration straight to James' face. Those deckhands who happened to be in the area were wise enough to clear out immediately. He gaped at her, turned a bright shade of red. Though he worked his mouth, nothing came out.

    `N I feel in when we hug, and the way you look at me when you think I'm not paying attention. I want it, you want it, so why have you been avoiding me instead of visiting my room in the evening with a bottle of wine? Hell, I've got wine, all you needed was to show up with a smile.`

    `J I can't just... that's not... no I'm not going to 'jump you!'` he finally managed, backing up a step as though he found her physically intimidating.

    `N Then stop blushing like a virgin every time you look at me,` she replied in a frustrated voice. `N You're making me self-conscious. What do you want, then, if you don't want sex?`

    It seemed she'd scared the words right out of him again, because he just kneaded the rope he'd been wrapping around a split board and looked about ready to melt out of his own skin.

    `N Well, fine, just so you know the option's open,` she poked his shoulder with one finger, then pressed a gold coin in his hand. `N Visit a brothel next time we make landfall. Might at least help ease the tension, if you're not going to fuck the girl you really want.`
  """

export NonkeniaHunters =
  label: 'Hunters'
  history:
    NonkeniaArrive: true
  extraDays: 30
  effects:
    xp:
      Asara: 3
  text: ->"""
  || places/NonkeniaStorm
    Blinking, Asara stepped back into the bushes from which she had just come. Half a dozen men and women stood in the clearing just ahead, gathering at the front door of a hut and applying paint to each other's faces. Each of them was armed with a spear, and two little girls walked around passing out javelins.

    Uncertain that she should interfere with a private ceremony, Asara was about to turn back for the ship when a hand tugged at her pants. She he looked down to find a trio of young boys looking up expectantly. ` You have to go into the hut.`

    `A What's in the hut?` She found herself oddly relaxed. This felt familiar. The Nonkenian children were more like her own people than the noisy Vailians had been. She examined the stone structure where a war party was gathering.

    ` The hunt-fire. Since you're here, you have to bow to it and say the rite, or they won't catch anything.`

    Asara nodded. It had looked like a war party to her, but a hunting party was better. She had no qualms about helping to bless them. Given the recent troubles between Alkenia and Nonkenia, she wasn't sure if Natalie would have approved of her wishing them success.

    ` You saw them before they came back, so now you have to pray.` The boy tugged at her pants again impatiently while his friends ran ahead. She followed.
  """
