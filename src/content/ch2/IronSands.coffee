s = {}

s.IronSandsArrive =
  label: 'Arrival'
  blocking: true
  required: 'GameOverExploration'
  history:
    IronSandsRutter2: true
  effects:
    xp:
      James: 3
      Natalie: 3
  text: -> """
  || places/IronSandsDay
    Natalie shielded her eyes from the sun and hugged her jacket closer around her. Wind bit through the cloth, whipped her hair into her eyes, blew grit into her mouth if she opened it at the wrong moment. How a place could be both so blindingly bright and yet so cold at the same time was a mystery to her, one she had no real desire to solve. Finally, in frustration, she pulled on a storm-cap just to keep her hair out of her eyes.

    Asara lifted her arms to the breeze and closed her eyes, a pleasant half smile on her lips.

    There wasn't a single plant in sight anywhere in sight, dark sand unbroken except for a stone pier and single small warehouse sticking out into the water. Half a dozen people waited for them on there, ropes in hand to help them dock against the wind. A hundred yards back from the water rose cliffs, sheer and of the same dark tan stone as the beach, a hundred feet high. A path had been laboriously cut into the side of the cliff, narrow and treacherous switchbacks. Against the dusty sky Natalie could see buildings at the top - that must be the main camp.

    The Lapis nosed against the pier, bobbing in choppy water and gusty, unpredictable wind. While the crew tied it down with ropes tossed up from the dock, Natalie hopped over to speak with the woman in charge. Asara and James followed.

  || Cara/Normal
    The woman was rough, as tall as James and heavier, weather beaten and tanned. Her appearance reflected the whole camp, aged despite still being young. She passed off the line she was hauling on to one of her teamsters as the three officers approached, turning to greet them. `Cara Tell your crew to stay on the ship or get up on the cliffs as soon as they're done mooring. I'm Cara,` she yelled at Natalie to be heard over the wind and extended a hand to shake. Natalie waved James back to the ship to make sure everyone heard. Cara's grip was crushing. They ran for the warehouse, a good place for a short conversation before the arduous trek up the cliff.

    `Cara Now, I know you're not an idiot, no captain is, but I'm going to give you the same lecture I give all the new miners, so you can repeat it to your crew. I don't want anyone getting hurt and saying I didn't warn you, ok?`

    `N Got it. I'm Natalie Rowena, nice to meet you.`

    `Cara That's nice, now shut up and listen. The sand here eats at everything, and it gets in everywhere. It'll burn bare skin right quick. Don't walk in sand unless you have to, wear heavy boots, iron-shod is best. If I catch anyone in short sleeves, I'll throw 'em off the cliff myself. Sweep off your deck every night, and sweep out any room you're going to sleep in. It's not as bad up on the cliffs, so stay up there as much as you can. Now the nice bit is that there're no pests and no dangerous creatures, so don't worry about that even though we're awfully exposed without a wall - humans and our donkeys are the only things that can live here. Also no spirits and no demons. They don't like the sand any more than plants do. You can go anywhere you like, but you're an idiot if you go anywhere except the dock and the camp. Clear?`

    `N Sounds like hell.`

  || A/Sad
    `Cara Only if hell makes you rich. You want my advice, get what you came for and leave as soon as you can. Pretty face like yours doesn't need scars. What's she smiling at?`

    They both turned to look at Asara, who had cracked open the door and was looking outside.

    `A The spirits in the sand are very hungry.` She stepped the rest of the way outside. `A It reminds me of home. I am glad there are no demons though. How long can we stay here, Natalie?`
  """

s.IronSandsRest =
  label: 'Resting in the Bunkhouse'
  history:
    IronSandsArrive: true
  effects:
    xp:
      Kat: 3
  text: -> """
  || places/IronSandsDay
    Kat flopped onto the couch and rested her head against the padded surface. Even in here, in the bunkhouse that served as an inn for the miners, grit was everywhere, and when she'd complained about it to the proprietor, she'd only gotten a pitying look and the repeated promise that the place was swept twice a day.

    Still, it was immensely better than being outside, and the beer was decent as well as being reasonably cold. It had an odd tang to it, not entirely unpleasant. The chatter of miners eager for a new voice finally coaxed her into sharing news of home, and listened eagerly to every story she could think of, the taller the better. A better evening than many, even if she did wake up to spit out grit more than once during the night.
  """

s.IronSandsJamesFlirt =
  label: 'Flirting Cara'
  history:
    IronSandsArrive: true
  effects:
    xp:
      James: 3
  text: ->"""
  || places/IronSandsNight
    James swallowed and stared at his beer, not daring to look up. A half-occupied bunkhouse served as the tavern here in Iron Sands. He'd come for a drink, but now couldn't relax. Every time he'd looked up he was being stared at. Not by most people, happy to mind their own business, just, with unnerving intensity by...

    `Cara Cara,` she loomed over him, finally tired of simply staring. James shook her offered hand, and she sat down across from him. She had a strong grip. `Cara What're you doing in my town, cute stuff?`

    It took him a moment to realize he was being flirted with, not antagonized. James snapped his mouth shut. `J I'm first mate on the Lapis Azurai,` he finally managed.

  || Cara/Normal
    `Cara Yes, James. Natalie mentioned I might find you here. I see you've settled on imported liquor - good call. The stuff Teddy brews is fine once you're already drunk, but I'd never start with it.`

    `J It's almost like there's a bit of lime in here? I'm guessing that's the taste of the dust. Not bad, though.`

    `Cara That's a bet you'd win. But anyway, want to come back to my place and talk about it more? I've got a cabin, much nicer than a bunk on your ship.`

    `J No thanks. I, um, I don't sleep around.` James took a deep drink to hide his face for a moment. He'd almost, almost, gotten that out without stammering like an idiot.

    Cara didn't say anything, and finally he was forced to lower the cup or look even more awkward. She was studying him, an odd half-smile on her face. She lay a hand over his on the table and she shook her head. `J She doesn't like you that way, kid.` James blushed and looked down, and she removed her hand from his. `J None of my business, I know. Just make sure you're not throwing away gold looking for diamonds.`
  """

s.IronSandsAsaraTalk =
  label: "Asara's Spirits"
  history:
    IronSandsArrive: true
  effects:
    xp:
      Asara: 3
  text: ->"""
  || places/IronSandsDay
    `Cara I wanted to talk to you about those spirits of yours.`

    Asara nodded. She'd been expecting the dour leader of the small mining outpost to come speak with her. `A They're your spirits, not mine.`

    `Cara I don't have spirits, I just live here.`

    `A That makes them yours.`

    `Cara I won't argue the point. What I really want to know is what we can do about them. We could cut costs in half if the damned dust didn't eat everything. The ore's so good that we stay anyway, but it plays hell with equipment.`

  || A/Sad
    Asara nodded. `A The spirits here are very hungry. They fought a war, long ago.` She shielded her eyes and looked out into the desert, completely barren and devoid of life. `A But they fought so hard that there was nothing left. They were so hungry that they ate anything that grew here, so nothing more grew, and they became hungrier still.`

    `Cara What can we do about it?`

    `A Make them your spirits. Take them into your heart and give them names and diminish them. Eventually they will learn to be something more than hunger again.`

    `Cara Eventually?`

    Asara shrugged. `A A hundred years, a thousand, I do not know.`

    `Cara Well shit. That doesn't do us much good at all.`

    That drew a momentary sharp look from Asara, but it faded into resignation as quickly as it had come. `A The world is not so arranged for your convenience. But you are not my people, I am only passing by. Do as you will.`
  """

Place.IronSands.stories.Ch2 = Object.keys(s)
for key, value of s
  value.place = 'IronSands'
  Story[key] = value
