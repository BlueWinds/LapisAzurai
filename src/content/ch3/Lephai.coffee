s = {}

s.AsaraToVisitSister =
  label: 'Desert Horizons'
  history:
    AsaraCh3Yes: true
  effects:
    xp:
      Asara: 3
  text: ->"""
  ||
    Asara stared out over the flat desert, so intent on the horizon that Natalie wasn't sure her approachhad been noted until, without looking, Asara reached out to catch her hand. She was surprised by the affectionate gesture, even more surprised when Asaro squeezed her hand, seeking reasurance. Natalie returned the gesture.

    `A I have to go.`

    `N Go where? Why?`

    `A Being here, seeing my home... out there,` she clarified with a nod, indicating the open desert rather than the small town they stood at the edge of. `A I've neglected my purpose.`

    `N Asara.! Natalie took her shoulder, ignoring the small flinch the action garnered. `N What purpose? Where do you need to go?` When the priestess still hestiated, Natalie turned Asara to face her, rather than the open expanse of dust and parched shrubs. `N Tell me. I won't hurt you.`

    `A I...` She shook her head, not in denial. `A I... must seek out my sister. But I'm scared of her. Antinua is so strong, and I'm not.`

    `N Wait, Antinua? You don't mean Antinua Vanyavanadar, do you?`

  || A/Scared
    Asara nodded, eyes widening. `A You know of her?`

    `N Of course. We meet every time there's a high society event. She's Hathawa's partner.` Seeing the blank look that garnered, Natalie went on. `N Hathawa Cheong. She's a princess from one of the southern regions. Very rich. Very important. Caused quite a scandal when she took a barbarian lover. Antinua's a mercenary, yes? Blonde hair, strange accent, silver eyes...` Natalie smacked her forehead and cursed herself for being so slow to see the obvious connection. `N ...just like you,` she finished lamely. Being at sea must have dulled her social instincts. Janos would be giving her <em>such</em> a look if he could see her now.

    Asara's brow furrowed, her voice completely flat. `A Mercenary.`

    `N Well, former mercenary. She worked for the Guild for a while, but I think she stopped when Wend and her partner left for Kantis. Never did learn what that was all about. I think she and Hathawa...` Natalie trailed off, seeing that Asara was no longer listening.

    One hand had strayed to the hilt of her sword, knuckles white around the pomel. `A I've delayed far too long. No more weakness.`
  """

s.AmuletsEverywhere =
  label: 'Another Amulet'
  history:
    KatCh3Yes: true
  effects:
    xp:
      Kat: 3
      Natalie: 2
  text: ->"""
  ||
    `K Captain, he's got one of those amulets.`

    `N I know, I can feel it.` Natalie ignored Kat's anxious tug on her sleeve. `N I've gotten more sensitive to them since you dropped one in my lap. There's one other in the marketplace here, and the harbor master has one as well.`

    They stepped aside to let someone else enter, catching a glimpse inside as the door swung closed. Among the dirty and weary village of shepherds and ranchers, this building stoop out. White marble, Kantian styel, it held the largest reseller of Lephian goods in the area. And the owner, like every well-placed businessman in the Kantian region it seemed, had a magical artifact.

    `N Creepy.`

    `K Definitely.`

    `N Well, in we go. No point darkening his doorstep when there's deals to be made.`
  """

Place.Lephai.stories.Ch3 = Object.keys(s)
for key, value of s
  value.place = 'Lephai'
  Story[key] = value
