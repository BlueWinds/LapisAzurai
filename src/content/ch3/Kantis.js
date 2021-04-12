/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
export var AsaraSleepTogether = {
  where: 'Kantis|Ch3',
  label: 'A late night knock',
  history: {
    AsaraToVisitSister: true
  },
  effects: {
    xp: {
      Natalie: 2,
      Asara: 3
    }
  },
  text() { return `\
|| travel/CabinNight
  Natalie was drifting off to sleep when a tentative tapping on the door woke her. Asara. They'd grown more sensitive to each other's presence recently, mage and priestess, two wells of magic on an otherwise mundane ship. There was also the matter of the kiss. It hadn't been repeated, or mentioned, but it had hung between them.

  She shook her head awake and stood, letting Asara in wordlessly and closing the door behind her. It was dark, only a small hooded candle on Natalie's desk in case she needed to light a lantern. Asara always seemed more comfortable in the dark, so she didn't move to change anything, just waited for the priestess to speak.

  \`A There's a crate in my corner.\`

  Natalie pondered that cryptic statement. Yes, they'd just taken on fresh supplies forthe next leg of the journey, but... Ah. Of course Asara would be sleeping in the cargo hold. Natalie hadn't seen any signs of it, but of course the skittish young woman would prefer solitudo over the close-bunked crew, eschewing warmth and comfort in favor of privacy. Something must have been stacked in her favorite corner. She could just pick another, though, unless... \`N Ah. You want to sleep here, is that it?\`

  She saw a nod in the dim light, reached out the touch Asara's shoulder, ran her touch down Asara's arm, across the back of a hand, let it drop. \`N Did you want the floor, or...?\`

|| A/NormalFull
  \`A If... if you don't mind?\` Asara sat gingerly on the edge of the bed.

  \`N No, please.\` Concious of her thin shift, Natalie sat beside the other woman, wondered if she should touch Asara again. She decided not, kept her hands to herself as she slid back under the covers. \`N Sorry I'm not too talkative, was just about asleep wheny ou knocked,\` she added to fill the silence. She turned her back to the room, lay on her side facting the wall in case it would help Asara relax.

  She lay silently for a while, unable to drift towards sleep with Asara sitting next to her, stiff and unmoving. Finally the other woman removed her boots, shed a jacket, hesitated, left her blouse and leggings on. She slid under the covers without touching Natalie. It was an impressive feat considering the small size of the bed.

  Her thoughts raced. Should she turn over, touch shoulders? No, better to let Asara decide what contact, if any, occurred. Perhaps she should... her train of thought was interrupted by Asara curling up against her back. It felt nice. Natalie held still, afraid to disturb anything. She wondered at the courage it must take for Asara to let anyone near her while she slept. If the priestess was going to get any sleep tonight. Natalie doubted she would.\
`; }
};

export var ElakimAudience = {
  where: 'Kantis|Ch3',
  label: "House Appolon's Offer",
  history: {
    AmuletsEverywhere: true
  },
  effects: {
    xp: {
      Natalie: 3
    }
  },
  text() { return `\
|| places/KantisDay
  Gaining and audience with Elakin was surprisingly painless. Natalie merely sent one of the of the crew to request it, and recieved an immediate response that she was welcome to visit the Appolon estates, and time day or night, and that the Lord would be pleased to receive her as soon as he was available. Again Natalie had cause to wonder just why she rated such treatment when even Janos had only met with representitives. The mage-lords of Kantis were legendarily aloof. She was spooked.

  This time she didn't go alone. Kat and James accompanied her up the winding streets. The former chatted gaily about nothing in particular, while the latter walked beside and half a pace behind. Bodyguard. It made a difference in how people reacted to her, making way even in heavy traffic.

|| places/KantisGarden
  The guards at Elakim's gate parted for them wordlessly, and Natalie spotted a child running for the manor, doubtless carrying word of their arrival. Natalie and her companions followed at a more sedate pace. The quiet and grandure of manicured greenry finally silenced Kat, who fell into place behind her captain.

  A steward met them at the front doors of the manorhouse, and with welcoming words led Natalie and her companions to a waiting room, informing them that Lord Appolon would be with them shortly.

  \`K Lord Appolon, eh? Moving up in the world, captain.\` Kat elbowed her with a silly grin as they sat down.

  \`N Hardly. Janus is already as high as you can get, and I threw up on her shoes once when I was sick. I was only seven,\` she answered James' aghast look. Natalie's smile drew down into a more serious expression. \`N Speaking of which, let me do the talking. The Guildmaster enjoys antics and silliness, but I doubt Elakim would approve. Kat,\` she caught the other woman's eyes and held them, \`N <em>do not touch anything.</em>\`

|| K/Normal
  Kat puffed out her cheeks. \`K I can do serious.\`

  \`N Than do it, starting now.\`

  Kat nodded and settled down, accepting the rebuke. Natalie gave her hand a squeeze, and received one in return. A minute later the thief was up again, examining a painting on the wall, a watercolor rendition of Kantis as seen from a distance on a foggy day. She held her hands behind her back though, and was still and respectiful and Natalie could have asked.

  They only had to wait a few minutes longer before the steward returne and indicated that Lord Appolon would see her now, and would her guests care for any refreshments, perhaps a tour of the grounds while they waited? Natalie nodded at Kat's hopeful look. A better place for her by far  than waiting here in an empty room. James indicated with a shake of his head that he'd remain close by. She patted his shoulder and stood.

  Across the hall and two doors down, James came to a rest facing two Kantian guards. Natalie continued through the door into Elkaim's study.

|| places/GuildOffice
  \`Elakim Ms. Rowena, welcome. To what do I owe the pleasure?\` He didn't stand, gestured her to any empty armchair across from him. He helf a closed book on his lap. Staged, she decided. He wouldn't have left her waiting if all he'd been doing was reading. His magic confirmed it, swirling around him in pleased curls, alert and active.

  \`N Since you've been so gracious a host so far, I wondered if you would indulge my curiosity in a small matter.\`

  Lord Appolon smiled at her words. Not her usual tone, but given his emphasis on Kantian politeness versus Vailian directness last time, it cost her nothing to play the game in a way he might appreciate. \`Elakim Indeed I might. What has piqued your interest?\`

  \`N Amulets. I gather they mark one as a representative of one of the noble houses, but beyond thet I'm unsure their other functions.\`

|| Elakim/Normal
  \`Elakm I'm surprised you didn't ask one of the bearers.\`

  She had, and learned nothing for her trouble. \`N It seemed rude to go anywhere but the source.\` She arched an eyebrow, a deft expression tha whose precision would have done Janos proud. Perhaps he'd heard of the questions. How much interest did these lords put in her ordinary actions? In Vailia she was no one - here, though... she wasn't sure.

  He smiled appreciatively. A good answer, it seemed. \`Elakim Indeed. I had wished to broach the subject with you eventually, so this is as good a time as any. The Universal Trading Concern would welcome your participation. The amulets in question are badges of membership.

  The UTC. Kantian equivelent to the Guild, the name brought up memories. Wend, crazy as a fox but mind to match Janos underneath; the first Guild Child, closest thing Natalie had to a mother. She'd been mother to all those the Guild had adopted after her. Wend's partner, a member of the UTC. Their scrabble to pay off a debt, their sudden departure to seek fortune abroad. Natalie had been only eight. Were they still in Kantis somewhere? She should seek them out.

  \`Elakim I see you're familiar. May I ask where the frown comes from?\`

||
  \`N Memories, unrelated. I captain for the Guild, though. I hope you won't take it amiss that I've no intention of changing alligence.\`

  \`Elakim Of course not, nor have I any interest in asking. The offer is for a lord's seat, much the same as I hold. The UTC is as much a set-spell as it is a trading company. We lords supply magic and direction, and reap the profits. Not being Kantian, you would of course require a sponsor.\`

  \`N You, naturally.\`

  \`Elakim Naturally.\`

  \`N And I would thithe you a portion of my profits in return, of course.\`

  \`Elakim Of course. The standard contract is a tenth of your magic, with shares and profits proportional to your contribution to the total strength of the spell. I should expect a quarter of that, and half your votes on the Council of Lords.\`

  \`N How much would my power earn, do you suppose?\`

  \`Elakim Unfurl your magic to its full extent, if you would?\`

  Natalie hestitated. Did she really wish to show Elakim exactly how powerful she was? He did seem friendly, and now that she knew his interest, perhaps she should trust him a little. She didn't. Instead she pushed outward with only part of her strength, enough to give her a headache, a dull throb tingling through her fingers, but not nearly the effort she expended when opening a passage through a storm for her ship to slip through.

  \`Elakim Well. If we assume that's half of what you're actually capable of,\` Elakim smiled as Natalie cursed herself. He was a far better mage than she, of course he would know. \`Elakim It puts you almost on par with House Nemasi. She's the weakest of the six Great Houses. You'd likely be entitled to, say, a 7 percent share. Dividends are paid out twice per year, equating to roughly...\`

|| N/Embarrassed
  Her mind blanked as he mentioned an astronomical sum. Natalie had seen the Guild master ledgers, gone over them with Janus when she was a child working her way through lessons in accounting. The UTC was as wealthy as the Guild. Did Janus know how extensive it was? Of course he had to. She took a deep breath, tried to calm her thoughts.

  \`N That is quite a lot to consider, the offer is very generous. Is the contract fairly standardized?\`

  \`Elakim It is not, but I can show you parts of my own House's agreement with the UTC. All details subject to negatiation. This technically requires a full meeting of the lords to make an offer of this magnitude, but,\` he chuckled at something, \`Elakim now that there are only six great houses, I'm reasonably certain they will see my point of view.\`

  Riches handed to her on a silver platter, too good to be true. Where was the catch? A tenth of her magic? She couldn't use the full extent without hurting herself, she wouldn't miss it.  Handing Elakim more voting rights on the council? She didn't understand Kantian politics well enough to know the consequences. She'd need that knowledge before she agreed to anything.

  \`Elakim Please think it over. I'm afraid I'm expecting company soon - perhaps we can continue the discussion another time? I'll have a copy of portions of my own contract delivered to your ship.\` Natalie doubted there was any company inbound, but she was not about to decline the polite fiction that gave her time to think things through.

  \`N Yes, of course. Thank you for taking time to speak with me.\` Natalie nodded asd stood as he did. A few more polite words and she made her escape.\
`; }
};

export var NotBurningCity = {
  where: 'Kantis|Ch3',
  label: 'Relief',
  history: {
    AsarasDuel: true
  },
  effects: {
    xp: {
      Natalie: 2,
      Asara: 2
    }
  },
  text() { return `\
|| travel/CabinDay
  \`N I admit, I'm actually kind of relieved we're headed to Naxins,\` Natalie murmured, setting aside the brush. Asara had short enough hair that it wasn't necessary, but she enjoyed it and Natalie wasn't abount to argue with anything that could make the priestess sigh happily at her feet.

  \`A Why?\`

  \`N Ever since your duel I've had this horrible image of Antinue just... burning down Kantis. The whole city. She could, couldn't she.\` Natalie had felt the mercenary's presence ever since she came on board, a sensation on the back of her neck. Through walls, wakeful or asleep, her power was a palpable presence, so much stronger than Asara, as though there were a fire just a little too warm making her hairsstand on end.

  \`A ...Yes. Maybe. I'm not sure even she could stand against all the Mage Lords at once. One or two certainly, but not all seven. It's why they send soldiers and amulets to invade our land, rather than coming themselves.\`

  \`N So what are the two of you going to do?\`

  \`A North, into the desert. Four.\`

  \`N Four?\`

  \`A Though it breaks all tradition, Antinua will bring along Hathawa. If tradition is already broken...\` She craned her neck to look up over her shoulder at Natalie, then looked away agin quickly.

  She squeezed Asara's shoulder and kissed the top of her head. \`N Of course I'll come.\`\
`; }
};
