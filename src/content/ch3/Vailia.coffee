import {expirationDate} from 'game/Story'

export Ch3Root =
  where: 'Vailia|Ch3'
  label: 'Non-route Ch3 Root'
  history:
    AsaraCh3Yes: true
    JamesCh3Yes: true
    KatCh3Yes: true
  extraDays: ->
    max = Math.max(expirationDate('AsaraCh3Yes'), expirationDate('KatCh3Yes'), expirationDate('JamesCh3Yes'))

    # g isn't defined in EventGraph.html or other strange places
    unless g?
      return 0

    if g.history.AsaraCh3Yes
      return expirationDate('AsaraCh3Yes') - max
    else if g.history.KatCh3Yes
      return expirationDate('KatCh3Yes') - max
    else
      return expirationDate('JamesCh3Yes') - max
  text: -> '''
  ||
    Placeholder event to serve as 'root' for non-route ch3 events. If you're seeing this in-game, it's a bug.
  '''

export NonkeniaDiplomatConclusion =
  where: 'Vailia|Ch3'
  label: 'Diplomatic Delivery - Conclusion'
  cost: 0
  history:
    Ch3Root: true
  effects:
    xp:
      Natalie: 3
  text: -> '''
  || places/GuildOffice
    ` Hey, did you hear?`

    Natalie abandoned her purposeful stride across the Guild hall to go speak with the boy at the reception desk. `N Have I heard what?`

    ` Nonkenians killed out envoy's bodyguard, stole all her stuff and sent her back with a really rude note.`

    Natalie sighed. It was about what she'd expected, really. What in the world had Janos been thinking?

    ` I hear the Alkenians were really fed up with her handling of the 'peace talks' and sent a separate rude letter.` He laughed at her eye roll and frustrated sigh. She didn't blame them, if her interactions with Ameliss - the envoy - had been any indication. ` I know, right?`

    `N Did you know I nearly made her walk the plank once?`

    He leaned in and grinned, eager for a good story.
  '''

export ExploreKantis =
  where: 'Vailia|Ch3'
  label: 'Deeper into Kantian Waters'
  history:
    Ch3Root: true
  effects:
    xp:
      Natalie: 3
  text: ->"""
  || places/GuildOffice
    `Guildmaster We have before us an amazing opportunity,` Janos had come to visit Natalie, rather than the other way around - a first, in all their long years of acquaintance. She was used to seeing him in the highest circles of the city - the Guild headquarters, parties for the high-and-mighty, paying visit to the other movers and shakers of a city-turned-naval-power. He seemed out of place, sitting in the chair in her cramped cabain aboard a ship only just returned from sea and still smelling of too long occupation by too many people.

    `N You want me to open up trade with more of the Kantian sea.`

    `Guildmaster Sharp as always. It was a stroke of luck that opened sea routes to the east thirty years ago, a stranger washed up on our shore. Wend opened up the opportunity, and I seized it. Your position is similar. Your unique acquaintance with Asara, your contacts with the UTC... it's an opportunity to expand our reach again.`

    The economics were clear. Vailian ships were the only ones fast and sturdy enough to brave the blue-water passage between Vailia and the eastern continent, turning Tomenoi from a barely inhabited island into a thriving waypoint of the rapidly expanding trade between West and East. A trade route controlled exclusively by Vailia. By the Guild. Vailia had been changed as well. Ideal placement, the secrets of superior shipbuilding and a twist of fate had turned a sleepy liesure-city into the center of a growing commercial empire.
  || N/Upset
    `N You want me to steal a rutter for the Kantian sea.` A statement, not a question. Kantis had kept its dominant position over the densly populated east by dint of the fact that Vailian captains had no maps, no sense for the currents, winds, weather and landmarks. Perhaps in another couple decades they could develop their own, but until then, Kantis' charts were a secret worth killing for, not for sale for any price.

    The Guildmaster nodded solemly. `Guildmaster Acquire, however you can. Wend was a very wealthy woman when she left our shores with her partner.`

    `N I'll see what I can do.`
  """

export AboutAntinua =
  where: 'Vailia|Ch3'
  label: "Seeking Meghan's Help"
  history:
    AsaraToVisitSister: true
  effects:
    xp:
      Natalie: 3
  text: -> """
  || N/Normal
    `N I have a favor to ask.`

    Lady Meghan Vailia nodded, gestured Natalie to come in. Her house was even more filled with books than last time Natalie had visited, and Meghan had to move a pile of them off the couch to make room for her guest to sit. `Meghan Ask.`

    `N I'd like to know more about Antinua Vanyavanadar and her sisters.` She sat carefully, and steadied some books on the other end of the couch so the motion didn't disturb them.

    `Meghan What makes you think I know more about her than you? She worked for the Guild for years, after all.`

    `N You're smart, you're powerful and you're protective of the city. Of course you keep tabs on anyone who can level buildings with her bare hands.`

    `Meghan Is that how powerful you think Antinua is.` One corner of Meghan's mouth twitched downward.

    `N Well, I've felt Asara's magic from a distance as she shattered a ship, and she says Antinua's stronger, so...` She trailed off in the face of Meghan's frown.

  || Meghan/Serious
    `Meghan You do need to know more. Very well then.` Meghan sat in her own chair, well used, overstuffed, and free of books. Her brow burrowed for a moment, then relaxed as she nodded to herself, perhaps deciding how to explain things. `Meghan Mages, you and I, we inherit the full measure of our parent's power when we're born. It doesn't become active right away, but it's always there, a steady hum of magic that neither grows nor shrinks. You know all this, yes?`

    Natalie nodded. Janos had told her something similar when she gained her power - or when it became active, rather, as Meghan was now explaining - but it was nearly impossible to find sources of information on the subject, and she was eager to learn more.

    `Meghan Antinua and Asara though, are not mages. They're closer to... champions, I suppose. They inherit shards of divine power. Their connection begins weak, but grows with time. The one on your ship? I've felt her becoming more powerful each time you visit, but slowly. Comparing human and divine magic isn't really fair in either direction, but if I had to, I'd say she's unlikely to ever surpass you.`

    Natalie cocked her head, confused by the assertion. `N I'm pretty sure Asara could twist me into a pretzel with one hand.`

  ||
    `Meghan Apples to oranges, as I said. Their gifts flow in a more martial direction, and it would probably kill you to draw on your full strength. Something's broken with your magic, I'm not entirely sure what. Regardless,` Meghan shrugged, `Meghan not my point. My point is that you and Asara are a good match. Antinua operates more at my level.` A long pause as she let that sink in. `Meghan I don't know where she comes from. I don't know why she's here. I do know that we have an understanding, and that I will be most annoyed if you start a fight you can't finish inside my city.`

    Natalie nodded slowly, goosebumps running up her arms. `N Thank you for the warning. I'll be careful.`

    Meghan ran a hand through her hair, sighed. `Meghan I never wanted this sort of responsibliity. But I have it, so I'm warning you now. I like you, and it'd be a shame to attend your funeral. That's what'll happen if you upset Antinua, because I won't protect you and Janus can't. Now go, I have things to do.`

    Natalie thanked her again and took her leave. On her way back to the Lapis she clasped her hands behind her back to keep them from shaking.
  """

export AsarasChallenge =
  where: 'Vailia|Ch3'
  label: "Asara's Challenge"
  cost: 60
  history:
    AboutAntinua: true
  effects:
    xp:
      Natalie: 2
      Asara: 2
  text: ->"""
  || A/Sad
    ` Asara.`

    The priestess in question tensed at the unfriendly tone.

    ` I didn't expect the goddess to pick you, sister.`

    `A I've changed, Antinua.` Asara held her chin up as the older woman approached and circled around her. This was Antinua's home, a modest stand-alone house in one of the nicer parts of the city. Modest by the standards of the circles Antinua was moving in these days, of course. The wealthy. The powerful. It was a far cry from the tents both of them had grown up in, moving every few months with only the possessions they could carry on their backs.

    ` You have indeed. I approve. Why are you here?`

    Asara admired the way Antinua slid into the chair. Poised. Confident. Aware of her own power, but not afraid of it. Dangerous. Asara was dangerous too, of course, but there were matters of scale, and of will. She relaxed her shoulders, relaxed her body. This too was a battle, and being tense served her no better here than it did in a physical confrontation. She was here. She was going to do this. `A I'm here to bring you home.`

    ` This is my home.`

    `A You have a duty as protector of our people...`

    ` I gave that duty to Alanda.` Antinua cut in, firm but not angry, as though duty were something that could be laid aside like a debt that had been discharged.

  ||
    `A Alanda's dead.`

    ` Amaria.`

    `A Amaria's dead. Anema's dead.` Asara took a shuddering breath. `A Aselia is leading our clan north, beyond the crater. Arada holds the southern front with volunteers from the northern clans, if she hasn't fallen yet. I'm here to find you. We are the only four.`

    Antinua sat impassivly under the verbal onslaught, revealing nothing. ` There should be seven.`

    `A There should be, but we <em>ran out of candidates.</em> Soon we'll have no choice but to call for a jihad. It's better than the line being broken.` Chest heaving, Asara wiped water out of her eyes with a sleeve. So much for her resolve. So much for being relaxed.

    ` You can't do that. Do you know what happens when we go to war?` Antinua's eyes widened briefly, a moment of horror before she clamped back down, expressing returning to neutrality.

    `A I'm a priestess, Asara. I know my history.` Her words were hoarse at the prospect. She'd been to Kantis, visited Lephai. She liked the cities. The people living there didn't deserve what would their leader's actions would bring them if the clans united in a holy war.

    ` It's not my problem any more.` Despite the flicker of horror before, the unreadable face had set to stone, now completely unyielding.

  || A/Scared
    `A We need you,` came out a whisper. Her throat was too choked up for more.

    ` You want horror, Asara? How many have you killed? A few? Dozens? Hundreds have died by my hand. I killed and I killed and I killed for the goddess, and not a thing changed. It's not worth it. Go north. Let them have their patch of sand.` Antinua had risen as she spoke, pacing quickly back and forth in front of the priestess. Her face was still frozen in severity, but now Asara could hear the pain behind the mask, pain given and pain received. ` I've built a new life here. I won't go back.`

    Asara forced herself to breathe again, forced her hand up, cevered with dancing silver flames, forced her mouth to form the words. `A Then I challenge you. You may have given up the title, but you still weild the Goddess' power. You cannot refuse.`

    The sisters locked eyes. ` Very vell. The full moon is in two days. I'll see you then.`
  """

export AsarasChallenge2 =
  where: 'Vailia|Ch3'
  label: "Asara's Challenge"
  blocking: true
  history:
    AsarasChallenge: true
  effects:
    xp:
      Natalie: 2
      Asara: 2
  text: ->"""
  || A/Angry
    `N You challenged her to a duel.`

    `A No! Asara flinched at the vehemence of her own denial. `A It's a test, a... a comparison powers before  the judgment of the Goddess.`

    `N That sounds like almost exactly the sort of thing Lady Meghan asked me not to do, starting a fight I can't finish.`

    Asara held her chin up. `A No one can deny me this right. It's what I came here to do, and I've done it.`

    Natalie sighed and laid a hand on Asara's shoulder. `N No, I don't mean it like that. I'm just... worried, I guess.` She touched Asara's chin with her other hand, but Asara turned her head away, denying the sought after reassurance that this "test" was nothing to worry about. `N Tell me about it.`

    The priestess hesitated a moment before she answered. `A We hold hands and invoke the fire. The Goddess judges, and we are burned by the rightness of the other's cause.`

    `N She's going to kill you, isn't she.` Natalie hugged Asara's head against her chest, stroked the fine blonde hair.

    No answer. She hugged Asara harder and kissed the top of her head.
  """

export AsarasDuel =
  where: 'Vailia|Ch3'
  label: 'Moonlit Confrontation'
  blocking: true
  history:
    AsarasChallenge2: true
  effects:
    xp:
      Natalie: 2
      Asara: 2
  text: ->"""
  || places/NonkeniaNight
    Chill wind whipped over treacherous cliffs, ruffling what little grass was hardy enough to find purchase on cracks in the stone, and stinging Natalie's eyes with salt spray from the ocean below. This was a seldom visited part of the island, and a reminder that Vailia, like all other human construction, merely clung to the surface of the world. These cliffs faced directly out towards hundreds of miles of open water, and unlike the sheltered bay Vailia centered around on the southern end of the island, they had nothing to protect them from the full force of wild storms.

    Natalie hugged her coat around her and sheltered in James' lee. The moon hung heavy and full, watch over the proceedings. Beside them stood Hathawa Cheong, hair tied in a tight braid. The cold and with bothered Antinua's lover not at all. She was from the far south, Natalie knew, said to be covered insnow all year save a fleeting few summer months.

    A dozen yards away, hair seeming to glow silver in the moonlight, Asara and Antinua approached each other. Natalie had expected some ceremony, an exchange of ritual words or promises, perhaps, but they said nothing. Asara held out her hand. It was too dark to see her expression from this distance. Antinua took it.

    Silver flames stuttered into existence, licking at their hands without burning them. Pale and wan at first, they gathered strength swiftly, illuminating the sisters. One face was determined and defiant, jaw set and eyes as passionate as Natalie had ever seen them. The other was unreadable, pursed lips and furrowed brow.

  || travel/SilverFire
    Asara winced as the flames doubled, then doubled again, leaving them standing in the midst of a bonfire, the color of moonlight and Asara's eyes rather than red and gold. Dimly Natalie could feel the unfolding of ancient power, magic older and less human even than that of a storm. She could ride storms, channel the wild and fearsome power through her own hands and out into her ship, but this was untouchable. The impressions came to her through a veil, a thick fog, denied her inspection and turned inward towards the sisters invoking it.

    ` I spoke with Antinua,` Hathawa had to step closer to Natalie and James to be heard over the growing roar. ` She doesn't always listen to me. I'm sorry.`

    James made an angry noise, ready to object, but Natalie put a hand on his arm. She could feel the change coming a moment before the flames pulsed and grew again. Asara staggered and went to her knees. Natalie had to shield her eyes from the light in order to make out Asara's grimace, still holding Antinua's hand. Where before the power had been balanced, coming from each equally, now the elder sister's magic dominatied. Antinua's expression was grim, almost pitying as Asara struggled back to her feet. The younger priestess found reserves from somewhere, pushed harder, increased her own power to balance the magic again.

  ||
    The three witnesses had to retreat from the heat, stepping back from the now towering bonfire. Natalie tried to find something to say to Hathawa, couldn't. She gripped James' arm harder, tried to keep her breathing steady. She wanted to rush forward and drag Asara out, "purpose" be damned, but she was helpless, rooted in place by fear and lack of power. This was beyond her.

    ` She should give up.` Hathawa hugged her arms across her chest, looking almost as thoroughly miserable as Natalie felt.

    Natalie shook her head. `N She won't.` Her eyes watered from staring into the flames.

    ` Antinua will hate herself for this.`

    `N I think that's  the point. It's a poor trade.`

    Further conversation became impossible as they stumbled back from another redoubling of the flames. The two women at the center of the conflagration were impossible to see anymore except as darker blots in the midst of roaring silver and white fire. One figure stood unmoved, the other lay curled up at her feet. The heat was painful on Natalie's face, but she refused to back up any further from Asara despite James tugging at her hand. Asara's magic made up only a fraction of the magic now, and muffled as it was, mere proximity nearly had Natalie collapsing in pain herself. Tears streamed down her face.

    There was nothing she could do. She felt Antinua's power building for another exansion of the flames, stumbled back a few steps betrayed by her body's desire to live and James' tugging, braced herself for a life without Asara in it...

  ||
    The flames died, leaving afterimages burned into Natalie's eyes. Antinua stood, fists clenched, teeth clenched. Asara lay curled on the ground. Her ragged sobs wracked with pain were the only sound, echoing in the silence left behind by the sudden death of the moonlit inferno. Antinua whirled and stalked towards the observers, stopping in front of Natalie and Hathawa.

    ` I can't do it.` She an uneven breath. ` She won. Ready your ship.` She strode past them without looking back.

    Hathawa tried to say something, but Natalie wasn't listening. She ran to Asara's side. There was no smoke, little ash, just a circle burned completely clean all the way down to rock, and at the center, Asara laying on her side sobbing. Natalie fell to her knees, hesitated. Asara's clothing was untouched,  pale skin looking unburned.  Hard to tell, with Natalie still seeing spots and still adjusting to the darkness. No, she'd hesitated before, and almost lost Asara because she'd been afraid to say anything, afraid to challenge her decision and risk the trust they'd built. No hestiating now. Natalie gathered Asara in her arms, hugged her fiercely.

    Asara clung to Natalie like a drowning woman, sobbing slowly drawing to a close, ragged breaths easing as pain subsided. Neither of them spoke. Glass smouldered around the edges of the burned circle.
  """

export AboutUTC =
  where: 'Vailia|Ch3'
  label: "Seeking Meghan's Help"
  blocking: true
  history:
    ElakimAudience: true
  effects:
    xp:
      Natalie: 2
      Asara: 2
  text: ->"""
  || N/Normal
    `N I have a favor to ask.`

    Lady Meghan nodded and stepped aside, inviting Natalie into her home. It was, if possible, even more crowded with books than on the captain's last visit. Meghan had to clear a stack off the couch to open space for her guest. Natalie steadied a pile of books with one hand as she sat.

    `Meghan What sort of favor?`

    `N I need to know about the UTC.`

    Lady Meghan, sitting in her overstuffed armchair, leaned forward, resting her chin in her hands. `Meghan What makes you think I know anything about that? They're the Guild's competitors, after all. Go ask Janos.`

    `N The Guild's competitors who are ruled by mages, and rely heavily on enchanted amulets for reasons I don't understand. You must keep tabs on them.`

    Meghan leaned back, folded her hands in her lap with a simle. `Meghan Why the sudden interest?`

    `N They've invited me to join. I'm considering it.`

    `Meghan Are you.` Given the flat tone, she was not impressed. `Meghan Considering giving up your magic?`

    `N A tenth of it, yes.`

  || Meghan/Serious
    `Meghan You do need to know more, then.` Her mouth drew into a line as she thought for a moment. `Meghan A demonstration, I think. This will not be pleasant, but I can guide you to a similar experience if you would know what it feels like.`

    Given the shift in tone, Natalie hesitated before agreeing. She nodded. `N I should know.`

    Meghan's posture changed subtly, chin tilted up a fraction, shoulders more relaxed. `Meghan Ok. Expand your power, slowly. Imagine a formless mist, filling the room. Don't shape it.` She closed her eyes as Natalie began to do so, lips opening in a soft sigh. `Meghan Good. Faster. I'll tell you when to stop.`

    Natalie's experience was less pleasant. As always, rousing her magic brought with it pain, a pressure in her skull that grew worse as she drew on more power. The current was deep. She'd never explored exactly how deep her power ran, but deep enough for any task she'd ever set it.

    The mist of unshaped magic exponded through the room, encouraged occasionally by Mehgan's whispered `Meghan keep going` or `Meghan stop shaping it.` If Natalie relaxed the pressure the began to dissipate immediately, unravelling back into mundane reality. Each increase in volume was paid for with increasing discomfort, growing from the headache into a pins-and-needles sensation expanding from her shoulders down her back.

  ||
    Finally Meghan called a halt. `Meghan Enough. Hold there. That's a tenth of your power. No, relax, don't start making it do something. You'll feel like this all the time. It'll get a bit easier as you get used to it, but the sensation will never go away.`

    Natalie took a deep breath and closed her eyes. More bearable. She let go the power. Slowly the pain began to disipate, leaving behind on and unpleasant memory and lingering tightness across her skin. It was nothing compared to when she blazed a path for her ship through a storm, but unpleasant none the less.

    `Meghan For most mages, magic is joy. To give up a portion of their pride, their freedom to do as they will, is a hard choice.` Meghan filled the silence. `Meghan Your magic is broken. I don't know why, don't ask. Giving away power would be worse for you.`

    `N That was...Thanks.` Natalie leaned back against the couch, rubbed her arms vigorously, rubbing away the pins and needles memory. `N I'm glad I came to see you.`

    `Meghan I am too. Will you stay a while? I was just about to make lunch.`

    `N Of course.`
  """
