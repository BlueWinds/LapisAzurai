import * as images from './images';

export var Vailia = {
  name: 'Vailia',
  img: images.VailiaDay,
  paths: {
    MtJulia: 1,
    Alkenia: 'MtJulia',
    Nonkenia: 'MtJulia',
    IronSands: 1,
    Tomenoi: 1,
    Colinth: 'Tomenoi',
    Kantis: 'Tomenoi',
    Naxins: 'Tomenoi',
    Lephai: 'Tomenoi',
    Ment: 'Tomenoi',
    Crater: 'Tomenoi',
    Amandais: 'Tomenoi'
  },
  stories: {},
  jobChance: 1.2,
  goods: {
    MtJulia: ['Apples', 'Beer', 'Butter', 'Cast Iron Cookware', 'Chickens', 'Composite Bows', 'Fish Hooks', 'Garlic', 'Hatchets and Saws', 'Kitchen Utensils', 'Nails', 'Pickled Fish', 'Pickles', 'Rope', 'Salt', 'Soap', 'Spears'],
    Alkenia: ['Apple Vinegar', 'Beer', 'Brass fittings', 'Carpet', 'Cast Iron Cookware', 'Chains', 'Clockwork Machinery', 'Cloves', 'Composite Bows', 'Fine Furniture', 'Fine Wine', 'Fish Hooks', 'Fruit Jam', 'Glass Jars', 'Hatchets and Saws', 'Hats', 'Helmets', 'Honey', 'Indigo', 'Ink', 'Linen', 'Matches', 'Mustard', 'Nails and Tacks', 'Olive Oil', 'Paper', 'Rope', 'Rough Clothing', 'Soap', 'Steel Wire', 'Swords'],
    Nonkenia: ['Beer', 'Candles', 'Canvas', 'Cast Iron Cookware', 'Chickens', 'Cloves', 'Coffee', 'Composite Bows', 'Flour', 'Glass Beads', 'Glass Jars', 'Hatchets and Saws', 'Linen', 'Matches', 'Nails', 'Olive Oil', 'Rough Clothing', 'Steel Tools', 'Swords', 'Wool'],
    IronSands: ['Alchemical Reagents', 'Beer', 'Candles', 'Chains', 'Chickens', 'Garlic', 'Hatchets and Saws', 'Kitchen Utensils', 'Maiden Tea', 'Matches', 'Nails', 'Pickles', 'Rope', 'Smoked Fish', 'Soap', 'Spears', 'Steel Wire'],
    Tomenoi: ['Alchemical Reagents', 'Anchors', 'Apple Vinegar', 'Basil', 'Beer', 'Brandy', 'Candles', 'Canvas', 'Carpet', 'Chamomile', 'Cheese', 'Chickens', 'Fish Hooks', 'Garlic', 'Glass Beads', 'Hats', 'Ink', 'Linen', 'Maiden Tea', 'Matches', 'Mint', 'Nails and Tacks', 'Paper', 'Pickled Fish', 'Raisins', 'Rope', 'Sage', 'Soap', 'Steel Tools', 'Steel Wire', 'Swords', 'Walnuts'],
    Colinth: ['Anchors', 'Apple Vinegar', 'Bronze Sculpture', 'Candles', 'Carpet', 'Chains', 'Composite Bows', 'Fashionable Clothing', 'Fine Wine', 'Hats', 'Helmets', 'Ink', 'Linen', 'Maiden Tea', 'Matches', 'Paper', 'Pickles', 'Steel Tools', 'Steel Wire'],
    Kantis: ['Anchors', 'Apple Vinegar', 'Basil', 'Brandy', 'Bronze Sculpture', 'Candles', 'Carpet', 'Chamomile', 'Clockwork Machinery', 'Composite Bows', 'Fashionable Clothing', 'Fine Furniture', 'Hats', 'Helmets', 'Ink', 'Linen', 'Matches', 'Mirrors and Lenses', 'Paper', 'Raisins', 'Sage', 'Steel Tools', 'Steel Wire', 'Walnuts'],
    Amandais: ['Basil', 'Brandy', 'Candles', 'Carpet', 'Chamomile', 'Composite Bows', 'Fine Wine', 'Glass Beads', 'Helmets', 'Ink', 'Lavender', 'Lilac', 'Maiden Tea', 'Matches', 'Mirrors and Lenses', 'Paper', 'Raisins', 'Sage', 'Steel Tools', 'Steel Wire', 'Wormwood']
  }
};

export var MtJulia = {
  name: 'Mt. Julia',
  img: images.MtJuliaDay,
  paths: {
    Vailia: -1,
    Alkenia: 1,
    Nonkenia: 1,
    IronSands: 1,
    Tomenoi: 'Vailia',
    Colinth: 'Vailia',
    Kantis: 'Vailia',
    Naxins: 'Vailia',
    Lephai: 'Vailia',
    Ment: 'Vailia',
    Crater: 'Vailia',
    Amandais: 'Vailia'
  },
  stories: {},
  jobChance: 0.4,
  goods: {
    Vailia: ['Lumber', 'Maiden Tea', 'Masts', 'Smoked Fish'],
    Tomenoi: ['Lumber']
  }
};

export var Alkenia = {
  name: 'Alkenia',
  img: images.AlkeniaDay,
  paths: {
    Vailia: 'MtJulia',
    MtJulia: -1,
    Nonkenia: 1,
    IronSands: 'MtJulia',
    Tomenoi: 'MtJulia',
    Colinth: 'MtJulia',
    Kantis: 'MtJulia',
    Naxins: 'MtJulia',
    Lephai: 'MtJulia',
    Ment: 'MtJulia',
    Crater: 'MtJulia',
    Amandais: 'MtJulia'
  },
  stories: {},
  jobChance: 0.65,
  goods: {
    Vailia: ['Canvas', 'Charcoal', 'Cotton', 'Flour', 'Garlic', 'Lumber', 'Maiden Tea', 'Mint', 'Smoked Fish', 'Wax', 'Wheat', 'Wool'],
    MtJulia: ['Canvas', 'Flour', 'Oars', 'Onions'],
    IronSands: ['Charcoal', 'Flour', 'Lumber', 'Onions', 'Wax'],
    Tomenoi: ['Flour', 'Lumber', 'Onions', 'Wax', 'Wool'],
    Colinth: ['Lumber', 'Oars'],
    Kantis: ['Lumber'],
    Amandais: ['Lumber']
  }
};

export var Nonkenia = {
  name: 'Nonkenia',
  img: images.NonkeniaDay,
  paths: {
    Vailia: 'MtJulia',
    MtJulia: -1,
    Alkenia: -1,
    IronSands: 'MtJulia',
    Tomenoi: 'MtJulia',
    Colinth: 'MtJulia',
    Kantis: 'MtJulia',
    Naxins: 'MtJulia',
    Lephai: 'MtJulia',
    Ment: 'MtJulia',
    Crater: 'MtJulia',
    Amandais: 'MtJulia'
  },
  stories: {},
  jobChance: 0.5,
  goods: {
    Vailia: ['Alchemical Reagents', 'Apples', 'Bacon', 'Butter', 'Chamomile', 'Cheese', 'Feathers', 'Fruit Jam', 'Furs', 'Honey', 'Leather', 'Live Cattle', 'Maiden Tea', 'Mint', 'Mustard', 'Rope', 'Rosehips', 'Sage', 'Smoked Game Meat', 'Walnuts', 'Woad', 'Wormwood'],
    MtJulia: ['Apples', 'Bacon', 'Butter', 'Cheese', 'Fruit Jam', 'Honey', 'Smoked Game Meat'],
    IronSands: ['Apples', 'Bacon', 'Butter', 'Cheese', 'Fruit Jam', 'Leather', 'Rope', 'Smoked Game Meat']
  }
};

export var IronSands = {
  name: 'Iron Sands',
  img: images.IronSandsDay,
  paths: {
    Vailia: -1,
    MtJulia: -1,
    Alkenia: 'Vailia',
    Nonkenia: 'Vailia',
    Tomenoi: 'Vailia',
    Colinth: 'Vailia',
    Kantis: 'Vailia',
    Naxins: 'Vailia',
    Lephai: 'Vailia',
    Ment: 'Vailia',
    Crater: 'Vailia',
    Amandais: 'Vailia'
  },
  stories: {},
  jobChance: 0.5,
  goods: {
    Vailia: ['Decorative Stone', 'Iron', 'Lead', 'Mercury', 'Tar', 'Tin'],
    MtJulia: ['Cast Iron Cookware', 'Tar'],
    Alkenia: ['Cast Iron Cookware', 'Iron'],
    Nonkenia: ['Cast Iron Cookware', 'Decorative Stone']
  }
};

export var Tomenoi = {
  name: 'Tomenoi',
  img: images.TomenoiDay,
  paths: {
    Vailia: -1,
    MtJulia: 'Vailia',
    Alkenia: 'Vailia',
    Nonkenia: 'Vailia',
    IronSands: 'Vailia',
    Colinth: 1,
    Kantis: 1,
    Naxins: 'Colinth',
    Lephai: 'Colinth',
    Ment: 'Colinth',
    Crater: 'Colinth',
    Amandais: 1
  },
  stories: {},
  jobChance: 0.8,
  goods: {
    Vailia: ['Alchemical Reagents', 'Coffee', 'Copper', 'Cork', 'Cumin', 'Dates', 'Decorative Stone', 'Expensive Pottery', 'Flour', 'Indigo', 'Iron', 'Lemons', 'Olive Oil', 'Olives', 'Oranges', 'Peanuts', 'Red Pepper', 'Tar', 'Tea Leaves', 'Veined Marble'],
    MtJulia: ['Coffee', 'Onions', 'Oranges'],
    Colinth: ['Anchors', 'Apple Vinegar', 'Beer', 'Brandy', 'Canvas', 'Chains', 'Ink', 'Maiden Tea', 'Matches', 'Mint', 'Nails', 'Paper', 'Steel Wire', 'Swords'],
    Kantis: ['Apple Vinegar', 'Brandy', 'Chains', 'Chamomile', 'Glass Beads', 'Ink', 'Linen', 'Maiden Tea', 'Matches', 'Mint', 'Nails', 'Paper', 'Sage', 'Steel Wire', 'Swords', 'Walnuts'],
    Amandais: ['Brandy', 'Chamomile', 'Glass Beads', 'Ink', 'Maiden Tea', 'Matches', 'Mint', 'Nails', 'Paper', 'Sage', 'Steel Wire', 'Swords']
  }
};

export var Colinth = {
  name: 'Colinth',
  img: images.ColinthDay,
  paths: {
    Vailia: 'Tomenoi',
    MtJulia: 'Tomenoi',
    Alkenia: 'Tomenoi',
    Nonkenia: 'Tomenoi',
    IronSands: 'Tomenoi',
    Tomenoi: -1,
    Kantis: 1,
    Naxins: 1,
    Lephai: 1,
    Ment: 'Lephai',
    Crater: 'Lephai',
    Amandais: 1
  },
  stories: {},
  jobChance: 0.6,
  goods: {
    Vailia: ['Apricots', 'Chalk', 'Iron', 'Lead', 'Lemons', 'Limestone', 'Mulberries', 'Oranges'],
    Tomenoi: ['Apricots', 'Decorative Stone', 'Iron', 'Lemons', 'Onions', 'Oranges'],
    Kantis: ['Cast Iron Cookware', 'Decorative Stone', 'Fish Hooks', 'Fruit Jam', 'Iron', 'Lemons', 'Masts', 'Mulberries', 'Nails', 'Oranges', 'Smoked Fish'],
    Amandais: ['Cast Iron Cookware', 'Fruit Jam', 'Iron', 'Nails', 'Salt']
  }
};

export var Kantis = {
  name: 'Kantis',
  img: images.KantisDay,
  paths: {
    Vailia: 'Tomenoi',
    MtJulia: 'Tomenoi',
    Alkenia: 'Tomenoi',
    Nonkenia: 'Tomenoi',
    IronSands: 'Tomenoi',
    Tomenoi: -1,
    Colinth: -1,
    Naxins: 1,
    Lephai: 1,
    Ment: 'Lephai',
    Crater: 'Lephai',
    Amandais: 1
  },
  stories: {},
  jobChance: 0.9,
  goods: {
    Vailia: ['Carpet', 'Dates', 'Fashionable Clothing', 'Fine Furniture', 'Flour', 'Honey', 'Olive Oil', 'Olives', 'Peanuts', 'Silver', 'Stone Sculpture', 'Veined Marble'],
    Tomenoi: ['Canvas', 'Chickens', 'Dates', 'Flour', 'Garlic', 'Hatchets and Saws', 'Helmets', 'Olive Oil', 'Olives', 'Peanuts', 'Rope', 'Veined Marble', 'Wheat'],
    Colinth: ['Anchors', 'Beer', 'Canvas', 'Dates', 'Flour', 'Hatchets and Saws', 'Honey', 'Olive Oil', 'Pickles', 'Rope', 'Silver', 'Wheat'],
    Amandais: ['Beer', 'Carpet', 'Clothing', 'Hatchets and Saws', 'Honey', 'Linen', 'Olive Oil', 'Olives', 'Salt', 'Self Bows', 'Veined Marble']
  }
};

export var Naxins = {
  name: 'Naxins',
  img: '',
  paths: {
    Vailia: 'Colinth',
    MtJulia: 'Colinth',
    Alkenia: 'Colinth',
    Nonkenia: 'Colinth',
    IronSands: 'Colinth',
    Tomenoi: 'Colinth',
    Colinth: -1,
    Kantis: -1,
    Lephai: 1,
    Ment: 'Lephai',
    Crater: 'Lephai',
    Amandais: 1
  },
  stories: {},
  jobChance: 0.4
};

export var Lephai = {
  name: 'Lephai',
  img: '',
  paths: {
    Vailia: 'Colinth',
    MtJulia: 'Colinth',
    Alkenia: 'Colinth',
    Nonkenia: 'Colinth',
    IronSands: 'Colinth',
    Tomenoi: 'Colinth',
    Colinth: -1,
    Kantis: -1,
    Naxins: -1,
    Ment: 1,
    Crater: 'Ment',
    Amandais: 1
  },
  stories: {},
  jobChance: 0.1
};

export var Ment = {
  name: 'Ment',
  img: '',
  paths: {
    Vailia: 'Lephai',
    MtJulia: 'Lephai',
    Alkenia: 'Lephai',
    Nonkenia: 'Lephai',
    IronSands: 'Lephai',
    Tomenoi: 'Lephai',
    Colinth: 'Lephai',
    Kantis: 'Lephai',
    Naxins: 'Lephai',
    Lephai: -1,
    Ment: 1,
    Crater: 1
  },
  stories: {},
  jobChance: 0.3
};

export var Crater = {
  name: 'Crater',
  img: '',
  paths: {
    Vailia: 'Ment',
    MtJulia: 'Ment',
    Alkenia: 'Ment',
    Nonkenia: 'Ment',
    IronSands: 'Ment',
    Tomenoi: 'Ment',
    Colinth: 'Ment',
    Kantis: 'Ment',
    Naxins: 'Ment',
    Lephai: 'Ment',
    Ment: -1,
    Crater: 'Ment'
  },
  stories: {},
  jobChance: 0.1
};

export var Amandais = {
  name: 'Amandais',
  img: images.AmandaisDay,
  paths: {
    Vailia: 'Tomenoi',
    MtJulia: 'Tomenoi',
    Alkenia: 'Tomenoi',
    Nonkenia: 'Tomenoi',
    IronSands: 'Tomenoi',
    Tomenoi: -1,
    Colinth: -1,
    Kantis: -1,
    Naxins: -1,
    Lephai: -1,
    Ment: 'Lephai',
    Crater: 'Lephai'
  },
  stories: {},
  jobChance: 1.3,
  goods: {
    Vailia: ['Alchemical Reagents', 'Allspice', 'Almonds', 'Amber', 'Bronze Sculpture', 'Camphor', 'Carpet', 'Cashews', 'Cloves', 'Coffee', 'Coral', 'Cork', 'Cumin', 'Decorative Stone', 'Eucalyptus', 'Feathers', 'Figs', 'Frankincense', 'Gold', 'Gold Jewelry', 'Indigo', 'Ivory', 'Jasmine', 'Lemons', 'Liquorice', 'Myrrh', 'Nutmeg', 'Opal', 'Pearls', 'Pepper', 'Rubber', 'Ruby', 'Safflower Oil', 'Saffron', 'Sandalwood', 'Sapphires', 'Stone Sculpture', 'Sulfur', 'Tea Leaves', 'Topaz', 'Turmeric', 'Vanilla', 'Wood Carvings'],
    Tomenoi: ['Coffee', 'Cork', 'Cumin', 'Decorative Stone', 'Indigo', 'Lemons', 'Papyrus', 'Pepper', 'Tea Leaves'],
    Kantis: ['Chickens', 'Cloves', 'Cork', 'Cotton', 'Leather', 'Lemons', 'Live Goats', 'Papyrus', 'Pepper', 'Safflower Oil'],
    Amandais: ['Allspice', 'Almonds', 'Carpet', 'Cashews', 'Coffee', 'Cork', 'Figs', 'Gold Jewelry', 'Leather', 'Lemons', 'Liquorice', 'Pepper', 'Safflower Oil', 'Saffron', 'Vanilla']
  }
};
