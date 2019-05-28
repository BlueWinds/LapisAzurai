import Game from 'game/Game'
import Place from 'game/Place'
import Story from 'game/Story'

import {drawMap} from 'gui/map'

export KantisArrive =
  where: 'Kantis|Ch2'
  label: 'Arrival'
  blocking: true
  required: 'GameOverExploration'
  extraDays: 30
  history:
    KantisRegion3: true
  effects:
    xp:
      Natalie: 3
  text: ->"""
  || places/KantisDay
    Even from afar, Kantis was an impressive sight. Nearly surrounding a circular harbor, the city rose so smoothly out of the water that it seemed intentionally shaped, rather than a natural formation. Perhaps it had been, some time in the distant past. Most of the buildings were the same pure white stone as the streets, blinding in the sun. It was a work of art.

    A closer approach bellied the impression. If the city was a work of art, it was a disorderly one. Three different docks hailed the Lais, each vying for Natalie's attention. She shaded her eyes, and after a moment's inspection, picked the one closer to the harbor's entrance. Less crowded with ships. Further from a trio of well armed vessels flying Colinth's colors.

    The harbormaster - or dockmaster rather, since he clearly wasn't in charge of the whole harbor - fingered an amulet as they approached. ` Natalie Rowena?`

    `N That's me!` She jumped down to the dock along with the first thrown ropes, leaving James to manage tying off the ship.

    ` Welcome to Kantis.`

    `N Harbor fees?`

    ` None. You're a guest of House Apollon.`

    Natalie crossed her arms. `N Am I. What exactly does that entail?`

    ` You'll have to ask lord Elakim. All I know is that he instructed me to dock you freely. Please let me know if there's anything you might need, I'm also to provide all reasonable assistance. Have a nice stay.`
  """

export VisitElakim =
  where: 'Kantis|Ch2'
  label: 'Visit Elakim'
  required: 'GameOverPower'
  history:
    KantianSorcerer: true
  effects:
    xp:
      Natalie: 5
  text: -> """
  || places/KantisDay
    Near the water Kantis was a city like any other, but as Natalie climbed higher up the slope surrounding the harbor, there was a wall. On one side things were noisy, commercial, disorderly, as if the people were frantic to make a sale. Passing under the arch, she ran face first into a wall of silence. Instead of streets and buildings, she faced footpaths and gardens, manicured trees and open space. Two of the four gate guards came over. Four seemed a rather large number of armed men to be keeping watch in a peaceful city.

    ` Can I help you?`

    `N I'm looking for House Appolon?`

    The guard's expression flickered, and Natalie felt his friendliness evaporating. ` What's your business with them?`

    `N I have an audience.` Not entirely true, but she wasn't going to reveal her intentions when asked in that tone.

    ` Two gates east. This is House Peland.` His companion muttered something about meddling Vailians, and Natalie took her leave before they could make up  their minds to do something more than grumble.

  || places/KantisGarden
    The reception at House Appolon's gate was far more cordial, with a servant waiting to guide her to an immediate meeting with the master of the house. The way to the manor house led them through a small orchard. The estate was immense, especially nestled as it was right next to a dense city, where so many others could have profitably used the space.

    As before, she felt the presence of another mage before she saw him. Elakim Appolon was waiting for her on a patio, magic coiled around him, controlled and ready. He stood as she approached.

  || Elakim/Serious
    `Elakim Welcome to my summer estate. I'm glad to hear you landed at my pier. I hope they treated you well?` His accent was thicker than other Kantians. Probably a mark of status or nobility, Natalie decided.

    `N Very kind of you, thanks. I came to ask what exactly being your guest entails, though. Our last meeting was rather short-lived to have inspired such generosity on your part.`

    `Elakim Spoken like a true Vailian, more concerned about a few coins than about making friends in a foreign city.` He laughed, a sound she found difficult to interpret.

    `N That's what I came to find out, whether it was friendship or ulterior motives which moved you on my behalf.`

    `Elkaim Ulterior motives, of course. We lords of Kantis are no less grasping of any advantage against our peers than you, but we're accustomed to cloaking it behind noble sentiments. Many in the city find the honesty of the Vailian obsession with money and power disconcerting. Please, sit.`

    Natalie coughed politely, attempting to hide her dismay. She took a seat across from him, the freshly woven wicker chair accepting her weight without complaint. Was that how she came across, obsessed with money and power? Was that how outsiders saw the Guild? `N I suppose if I'm given the mask, I may as well wear it. What do you hope to gain?`

    `Elakim I don't know yet, but it did seem prudent to keep you out of my rivals' hands. You're potentially quite valuable, you know - and alas, also quite vulnerable. A powerful, untrained mage without heir or family? Extending my protection and patronage was the only honorable thing to do. It was a stroke of fortune that you met me in Colinth, rather than one of the other lords. I already have an heir, and he's far too young for a bride.`

  || N/Upset
    Natalie blanched at the implication. She was here alone. Why had she come alone? James - or better yet Asara - should be at her side. Whatever power the priestess held, it ought to be enough to make even a mage-lord think twice before harassing her. `N The Guild is not to be triffled with,` she forced an even tone, grasping for some manner of outside authority to hold as a shield.

    `Elakim Vailia's power may be waxing, but we are not yet overshadowed in our own home,` Elakim frowned. `Elakim You have nothing to worry about from me, and as long as you don't make yourself too tempting a target, I doubt any of the other lords will risk my wrath by troubling you. Keep your friends close, Natalie. Kantis is not a safe place without allies to watch your back. I hope that someday you will count me among them.`
  """

export KantisPots =
  where: 'Kantis|Ch2'
  label: 'Pots, Pans and Complaints'
  history:
    VisitElakim: true
  effects:
    xp:
      James: 3
  text: -> """
  || places/KantisDay
    `J Can you believe the price of this?` James hefted the pot under his arm, replacement for one lost overboard during an unfortunate scuffle between two of the crew.

    `N Hm? Seemed about fair to me.` Natalie responded absentmindedly, busy checking her notes on what the ship needed. On a larger vessel this would have been the quartermaster's job, but she and James shared that role as time allowed.

    `J About fair for a sturdy Vailian pot, sure. But feel it, the texture's wrong. That means the metal's brittle. I'll be surprised if it lasts more than six months. They probably got some ash in the ingots and...`

    `N You can take the James out of the smithy, but you can't take the smithy out of James,` she inturrupted his rant with a grin and a ringing slap on the pot. `N No complaining. If they made pots like we do, we wouldn't be making money bringing Vailian pots here. Oh, come on, stop making that face and keep an eye out for good canvas. I want to lay in a better store in case we run into another storm like that last one.`
  """

export KatsDayOut =
  where: 'Kantis|Ch2'
  label: "Kat's day out"
  history:
    VisitElakim: true
  effects:
    xp:
      Kat: 2
  text: -> """
  || places/KantisDay
    The higher one went in Kantis the nicer things became. Away from the noise and stink of the waterfront districts, the city was an entirely pleasant place. Up here the white marble was washed clean by the rain. The beggars and homeless were kept in check by patrols answering to the lords of Kantis, the mages ruling over the city from their high villas.

    Regardless of the cause, Kat found it a pleasant place to take a walk. Strangers nodded at her (even if some of them did whisper unkind things about Vailians), guards didn't hassle her, and there was quiet and space aplenty. She'd missed that since her homeless days. Life aboard a ship was constantly busy and always crowded. Now, without the poverty and constant fear that had made her childhood so unpleasant it was relaxing indeed.

    For the moment at least she was content to wander. The driving, restless spark was quiet. She imagined what the others would make of that, of manic Kat just enjoying a quiet walk by herself. James wouldn't believe it. She started making a crazy escapade to tell him. An attempted robbery, scuffle with the city guards and harrowing chase across the city roofs? She grinned. He'd totally believe that of her.
  """

export AsaraCh3 =
  where: 'Kantis|Ch2'
  label: 'Chapter 3 - Asara'
  required: 'GameOverLove'
  requiredGroup: 'Ch2Routes'
  _class: 'AsaraRoute'
  history:
    AsarasTrauma: true
  effects:
    xp:
      Natalie: 2
  cost: 0
  text: -> """
  || A/Crying
    A feeling of presence, of patient waiting filled Natalie's bedroom – someone was at the door. She rubbed bleary eyes, drawn up out of a heavy sleep by the sensation. She slipped a sweater over bare shoulders and went to open the door.

    Asara stood in the doorway, waiting in the darkness. Natalie wondered how long she'd been waiting there, saying nothing, without knocking. Silence stretched between them, and Natalie saw that Asara's cheeks were wet, eyes red and puffy. It didn't feel right to say anything, so she didn't, just stepped to the side and waited for the young woman to enter. The priestess. It was hard to know what to think of her, perched on the border between terrifying power and fragile girl, attractive equal and helpless innocent in equal measure.

    Asara closed the door behind her, leaving them alone together in the darkness, only moonlight from the small window to give shadowy form to the room's contents. Another moment of silence.

    `A Can I kiss you?`

    The words froze Natalie in place, catching her completely off guard. Her throat went dry. Her heart pounded.

    `A I'm sorry, I just...` Asara's voice came out strangled.

    <button onclick="continueWith(event, 'AsaraCh3Yes')">`N Please, don't apologize,`</button> <button onclick="continueWith(event, 'AsaraCh3No')">`N Are you sure?`</button>

    <i>Accepting her will commit you to Asara in Chapter 3, while hesitating will lock out her route. No second chances.</i>

    <hr />
  """

export AsaraCh3Yes =
  where: 'Kantis|Ch2'
  label: 'Chapter 3 - Asara'
  requiredGroup: 'Ch2Routes'
  _class: 'AsaraRoute'
  history:
    AsaraCh3: true
    AsaraCh3No: true
  effects:
    xp:
      Asara: 10
  text: -> """
  || N/Embarrassed
    `N No, please, don't apologize,` Natalie interrupted. She reached out carefully with one hand, brushing her fingertips softly across Asara's cheek. The other woman tensed, but didn't flinch back. Her cheek was cold.

    Asara gently caught Natalie's hand in both of hers, held the fingers, pressed them against her lips. Natalie felt her heart pounding so loudly that it must have been audible clear across the room. It was... she hadn't felt this nervous in... well, ever.

    Asara moved her lips down and kissed Natalie's wrist, carefully, as if afraid that it might shatter in her hands, or reach out and strike her in sudden anger. Natalie raised her other hand to touch Asara's cheek again, but the silver-eyed beauty caught it with one hand, gently lowered it back to Nat's side. She kissed Natalie's wrist again, sending shivers up her spine, and then let go her hand and stepped closer.

    For a brief moment Natalie felt lips brush across her own, a warm caress that and left her dazed. She blinked, and the feeling was gone - not only the kiss, but also the feeling of Asara's presence, the other silhouette in the darkness. Though she hadn't noticed any movement, and certainly hadn't seen the door open, she was again alone in her room.
  """
  apply: ->
    g.chapter = 'Ch3'
    g.history.Ch3Root = g.day
    Game.showOverlay('<h1>Chapter 3</h1><h3>Asara</h3>', 0, 'chapter overlay')
    drawMap()

export AsaraCh3No =
  where: 'Kantis|Ch2'
  label: 'Chapter 3 - Not Asara'
  requiredGroup: 'Ch2Routes'
  _class: 'AsaraRoute'
  extraDays: -1000
  history:
    AsaraCh3: true
  effects:
    xp:
      Asara: 3
  text: -> """
  ||
    `N Are you sure?` Natalie interrupted the confession by laying a hand on Asara's shoulder. She twitched, startled by the contact, but at least she didn't shy away. Progress. `N I like you too, Asara, I like you a great deal, and nothing would make me happier than to kiss you right now. But are you sure it's what you want? I know... I know people who have gone through what you've gone through, and I know how much it makes you want someone to hold you and protect you, and I will do that, same as I have been, but I don't want to take advantage...` The words came out in a jumbled mess, rushing out until Natalie had to stop for breath. She dropped her hand, too embarrassed to keep touching Asara's shoulder.

    Silence stretched out again. Asara was as silent as ever - even her breathing was too quiet to hear, a ghost of a person, a dark outline, yet intensely present in Natalie's awareness.

    `N Please, I'm not saying no, just... I'm confused, Asara, and I don't want to make a mistake because we both thought we knew what we wanted.` Natalie blinked. The sense of presence was gone. Though she hadn't seen the door open, certainly hadn't noticed any movement, she was alone in her room.
  """
