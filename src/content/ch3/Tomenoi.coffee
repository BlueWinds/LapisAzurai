s = {}

s.KatsReservations =
  label: "Kat's Reservations"
  cost: 0
  history:
    ElakimAudience: true
  effects:
    xp:
      Natalie: 2
      Kat: 2
  text: ->"""
  || travel/CabinDay
    `K What's on your mind, cap'n?` Kat lay sprawled across Natalie's lap, belly down, feat beeting an idle rythem against the wall of the cabin. Natalie sat on her bed, in theory reviewing the Lapis' accounts, but in reality staring at the page without seeing it.

    `N Sorry, distracted.`

    `K You've been distracted ever since meeting with the fancy Kantian lord.` Kat rolled overonto her back. She wasn't wearing anything except pants, and the sight was rather distracting itself. `K So what'cha thinking about?`

    `N Fame and fortune, the acquisition thereof.` She set the ledgeraside, wiggled Kat's head into a more comportable position on her lap.

    `K Daydreaming's my thing.You're supposed to be the level headed and practical one.`

    `N Not daydreaming. Elakim offerefed my partial ownership of the UTC.`

    `K Huh. You-tea-sea?`

    `N The company that owns the amulets. Major trading consortium in Kantis. It's where the mage-lords' wealth comes from.`

    Kat whistled. `K Big stuff. So why you?`

    `N Magic. I help power the amulets, they give me a share of the profits.`

    Kat was silent for a moment, and Natalie filled the silence by stroking Kat's cheek. She nuzzled the hand and spoke. `K I don't like those.`

    `N Why not?`

    `K One hurt you just by being in the same room.`

    `N I think that was me, not the amulet.`

    `K Then you might hurt yourself again.`

    `N I think I know how to avoid that.`

    `K Seems like a raw deal for anyone who isn't a mage.`

    `N I think it's not that mucgh worse than the Guild, and we're pretty fair, all things considered.`

    `K That's three 'I think's in a row.`

    `N I did say I was still thinking about it.`

    `K Well, stop brooding and start looking for answers. Running off half-baked is my thing, and brooding is Asara's. So go get your answers before you say yes and let me and Asara get on with your business.`

    `N I thought you didn't like the amulets?`

    Kat rolled to her side and pulled her knees up, curling around Natalie's midriff. `K I don't, but that doesn't mean you shouldn't get all rich and stuff.` She squeezed Natalie's torso in a hug. `K I mean, you're not gonna leave behind your loyal crew, right cap'n?`

    `N Mercenary.` Natalie laughed. `N I'm not leaving you anywhere.`
  """

Place.Tomenoi.stories.Ch3 = Object.keys(s)
Place.Tomenoi.stories.Ch3.push('AsaraCh3Yes')
for key, value of s
  value.place = 'Tomenoi'
  Story[key] = value
