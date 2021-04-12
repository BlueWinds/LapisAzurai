/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
export var Ch3Storm = {
  where: 'Colinth|Ch3',
  label: 'Storm',
  history: {
    Ch3: true
  },
  effects: {
    damage: 12,
    xp: {
      Asara: 3,
      James: 3
    }
  },
  text() { return `\
|| travel/DeckStorm
  The latest storm rolled off into the distance, roiling clouds covering the sky from one horizon to the other. They retreated as rapidly as they'd struck, leaving the ship clear and the Lapis' crew laying exhausted across the deck. It had been a bad one. James crawled over to Natalie where she lay passed out. It had been a very bad one. Only a curtain of shimmering electric green coating every surface of the ship had kept the hurricane winds and towering waves from smashing them to splinters. They'd been struck by lightning twice, blinding, deafening surges of light accompanied by whimpers from the ship's captain, but no visible damage to the Lapis. Nalatie likely wouldn't wake for days.

  Asara moved among the sailors on deck, checking for injuries and bringing water. She wasn't part of the crew, not really, useless with canvas and rope with no inclination to help with daily necessities, but the Lapis' passenger shone in moments of crisis. Saving lives had quieted most of the grumbling about laziness. No one who'd seen it would ever forget her running dive into a churning wall of water, nor the miracle that had brought her back on deck with the next crashing wave, dragging a spluttering man overboard back to the ship by his collar.

|| travel/DeckDay
  James thanked whatever gods were watching over them for blessing his life with the two of them, and for seeing the Lapis through another impossible storm. They weren't far from Colinth - a few hours out, or at least they had been before the squall struck. Perhaps they could get back to a friendly port to make repairs. With a groan,he pushed himself up to his feet. No rest for the weary until they made landfall. Natalie and Asara had done their parts - his turn to do his.\
`; }
};
