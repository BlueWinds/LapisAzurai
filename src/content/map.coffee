Place.Vailia =
  name: 'Vailia'
  img: 'places/VailiaDay'
  paths:
    MtJulia: 1
    Alkenia: 1
    Nonkenia: 1
    IronSands: 1
    Tomenoi: 1
    Colinth: 'Tomonoi'
    Kantis: 'Tomenoi'
    Amandais: 'Tomenoi'
  stories: {}
  goods:
    MtJulia: ['Apples', 'Beer', 'Butter', 'Cast iron cookware', 'Chickens', 'Composite Bows', 'Fish hooks', 'Garlic', 'Hatchets and Saws', 'Kitchen Utensils', 'Nails', 'Pickled fish', 'Pickles', 'Rope', 'Salt', 'Soap', 'Spears']
    Alkenia: ['Apple Vinegar', 'Beer', 'Brass fittings', 'Carpet', 'Cast Iron Cookware', 'Chains', 'Clockwork Machinery', 'Cloves', 'Composite Bows', 'Fine Furniture', 'Fine Wine', 'Fish hooks', 'Fruit Jam', 'Furs', 'Glass Jars', 'Hatchets and Saws', 'Hats', 'Helmets', 'Honey', 'Indigo', 'Ink', 'Linen', 'Matches', 'Mustard', 'Nails and tacks', 'Olive Oil', 'Paper', 'Rope', 'Rough Clothing', 'Soap', 'Steel Wire', 'Swords']
    Nonkenia: ['Beer', 'Candles', 'Canvas', 'Cast Iron Cookware', 'Chickens', 'Cloves', 'Coffee', 'Composite Bows', 'Flour', 'Glass Beads', 'Glass Jars', 'Hatchets and Saws', 'Linen', 'Matches', 'Nails', 'Olive Oil', 'Rough Clothing', 'Steel Tools', 'Swords', 'Wool']
    IronSands: ['Alchemical Reagents', 'Beer', 'Candles', 'Chains', 'Chickens', 'Garlic', 'Hatchets and Saws', 'Kitchen Utensils', 'Maiden Tea', 'Matches', 'Nails', 'Pickles', 'Rope', 'Smoked Fish', 'Soap', 'Spears', 'Steel Wire']
    Tomenoi: ['Alchemical Reagents', 'Anchors', 'Apple Vinegar', 'Basil', 'Beer', 'Brandy', 'Candles', 'Canvas', 'Carpet', 'Chamomile', 'Cheese', 'Chickens', 'Fish Hooks', 'Garlic', 'Glass Beads', 'Hats', 'Ink', 'Linen', 'Maiden Tea', 'Matches', 'Mint', 'Nails and Tacks', 'Paper', 'Pickled Fish', 'Raisins', 'Rope', 'Sage', 'Soap', 'Steel Tools', 'Steel Wire', 'Swords', 'Walnuts']
    Colinth: ['Anchors', 'Apple Vinegar', 'Bronze Sculpture', 'Candles', 'Carpet', 'Chains', 'Composite Bows', 'Fashionable Clothing', 'Fine wine', 'Hats', 'Helmets', 'Ink', 'Linen', 'Maiden Tea', 'Matches', 'Paper', 'Pickles', 'Steel Tools', 'Steel Wire']
    Kantis: ['Anchors', 'Apple Vinegar', 'Basil', 'Brandy', 'Bronze Sculpture', 'Candles', 'Carpet', 'Chamomile', 'Clockwork Machinery', 'Composite Bows', 'Fashionable Clothing', 'Fine Furniture', 'Hats', 'Helmets', 'Ink', 'Linen', 'Matches', 'Mirrors and Lenses', 'Paper', 'Raisins', 'Sage', 'Steel Tools', 'Steel Wire', 'Walnuts']
    Amandais: ['Basil', 'Brandy', 'Candles', 'Carpet', 'Chamomile', 'Composite Bows', 'Fine wine', 'Glass Beads', 'Helmets', 'Ink', 'Lavender', 'Lilac', 'Maiden Tea', 'Matches', 'Mirrors and Lenses', 'Paper', 'Raisins', 'Sage', 'Steel Tools', 'Steel Wire', 'Wormwood']

Place.MtJulia =
  name: 'Mt. Julia'
  img: 'places/MtJuliaDay'
  paths:
    Vailia: -1
    Alkenia: 1
    Nonkenia: 1
    IronSands: 1
    Tomenoi: 1
    Colinth: 'Tomenoi'
    Kantis: 'Tomenoi'
    Amandais: 'Tomenoi'
  stories: {}
  goods:
    Vailia: ['Lumber', 'Maiden Tea', 'Masts', 'Smoked Fish']
    Tomenoi: ['Lumber']

Place.Alkenia =
  name: 'Alkenia'
  img: 'places/AlkeniaDay'
  paths:
    Vailia: -1
    MtJulia: -1
    Nonkenia: 1
    IronSands: 'Vailia'
    Tomenoi: 'Vailia'
    Colinth: 'Vailia'
    Kantis: 'Vailia'
    Amandais: 'Vailia'
  stories: {}
  goods:
    Vailia: ['Canvas', 'Charcoal', 'Cotton', 'Flour', 'Garlic', 'Lumber', 'Maiden Tea', 'Mint', 'Smoked Fish', 'Wax', 'Wheat', 'Wool']
    MtJulia: ['Canvas', 'Flour', 'Oars', 'Onions']
    IronSands: ['Charcoal', 'Flour', 'Lumber', 'Onions', 'Wax']
    Tomenoi: ['Flour', 'Lumber', 'Onions', 'Wax', 'Wool']
    Colinth: ['Lumber', 'Oars']
    Kantis: ['Lumber']
    Amandais: ['Lumber']

Place.Nonkenia =
  name: 'Nonkenia'
  img: 'places/NonkeniaDay'
  paths:
    Vailia: -1
    MtJulia: -1
    Alkenia: -1
    IronSands: 'Vailia'
    Tomenoi: 'Vailia'
    Colinth: 'Vailia'
    Kantis: 'Vailia'
    Amandais: 'Vailia'
  stories: {}
  goods:
    Vailia: ['Alchemical Reagents', 'Apples', 'Bacon', 'Butter', 'Chamomile', 'Cheese', 'Feathers', 'Fruit Jam', 'Furs', 'Honey', 'Leather', 'Live Cattle', 'Maiden Tea', 'Mint', 'Mustard', 'Rope', 'Rosehips', 'Sage', 'Smoked game meat', 'Walnuts', 'Woad', 'Wormwood']
    MtJulia: ['Apples', 'Bacon', 'Butter', 'Cheese', 'Fruit Jam', 'Honey', 'Smoked game meat']
    IronSands: ['Apples', 'Bacon', 'Butter', 'Cheese', 'Fruit Jam', 'Leather', 'Rope', 'Smoked Game Meat']

Place.IronSands =
  name: 'Iron Sands'
  img: 'places/IronSandsDay'
  paths:
    Vailia: -1
    MtJulia: -1
    Alkenia: 'Vailia'
    Nonkenia: 'Vailia'
    Tomenoi: 'Vailia'
    Colinth: 'Vailia'
    Kantis: 'Vailia'
    Amandais: 'Vailia'
  stories: {}
  goods:
    Vailia: ['Decorative Stone', 'Iron', 'Lead', 'Mercury', 'Tar', 'Tin']
    MtJulia: ['Cast iron cookware', 'Tar']
    Alkenia: ['Cast Iron Cookware', 'Iron']
    Nonkenia: ['Cast Iron Cookware', 'Decorative Stone']

Place.Tomenoi =
  name: 'Tomenoi'
  img: 'places/TomenoiDay'
  paths:
    Vailia: -1
    MtJulia: -1
    Alkenia: 'Vailia'
    Nonkenia: 'Vailia'
    IronSands: 'Vailia'
    Colinth: 1
    Kantis: 1
    Amandais: 1
  stories: {}
  goods:
    Vailia: ['Alchemical Reagents', 'Coffee', 'Copper', 'Cork', 'Cumin', 'Dates', 'Decorative Stone', 'Expensive Pottery', 'Flour', 'Indigo', 'Iron', 'Lemons', 'Olive Oil', 'Olives', 'Oranges', 'Peanuts', 'Red Pepper', 'Tar', 'Tea leaves', 'Veined marble']
    MtJulia: ['Coffee', 'Onions', 'Oranges']
    Colinth: ['Anchors', 'Apple Vinegar', 'Beer', 'Brandy', 'Canvas', 'Chains', 'Ink', 'Maiden Tea', 'Matches', 'Mint', 'Nails', 'Paper', 'Steel Wire', 'Swords']
    Kantis: ['Apple Vinegar', 'Brandy', 'Chains', 'Chamomile', 'Glass Beads', 'Ink', 'Linen', 'Maiden Tea', 'Matches', 'Mint', 'Nails', 'Paper', 'Sage', 'Steel Wire', 'Swords', 'Walnuts']
    Amandais: ['Brandy', 'Chamomile', 'Glass Beads', 'Ink', 'Maiden Tea', 'Matches', 'Mint', 'Nails', 'Paper', 'Sage', 'Steel Wire', 'Swords']

Place.Colinth =
  name: 'Colinth'
  img: 'places/ColinthDay'
  paths:
    Vailia: 'Tomenoi'
    MtJulia: 'Tomenoi'
    Alkenia: 'Tomenoi'
    Nonkenia: 'Tomenoi'
    IronSands: 'Tomenoi'
    Tomenoi: -1
    Kantis: 1
    Amandais: 1
  stories: {}
  goods:
    Vailia: ['Apricots', 'Chalk', 'Iron', 'Lead', 'Lemons', 'Limestone', 'Mulberry', 'Oranges']
    Tomenoi: ['Apricots', 'Decorative Stone', 'Iron', 'Lemons', 'Onions', 'Oranges']
    Kantis: ['Cast Iron cookware', 'Decorative Stone', 'Fish Hooks', 'Fruit Jam', 'Iron', 'Lemons', 'Masts', 'Mulberry', 'Nails', 'Oranges', 'Smoked Fish']
    Amandais: ['Cast Iron cookware', 'Fruit Jam', 'Iron', 'Nails', 'Salt']

Place.Kantis =
  name: 'Kantis'
  img: 'places/KantisDay'
  paths:
    Vailia: 'Tomenoi'
    MtJulia: 'Tomenoi'
    Alkenia: 'Tomenoi'
    Nonkenia: 'Tomenoi'
    IronSands: 'Tomenoi'
    Tomenoi: -1
    Colinth: -1
    Amandais: 1
  stories: {}
  goods:
    Vailia: ['Carpet', 'Dates', 'Fashionable Clothing', 'Fine Furniture', 'Flour', 'Honey', 'Olive Oil', 'Olives', 'Peanuts', 'Silver', 'Stone Sculpture', 'Veined marble']
    Tomenoi: ['Canvas', 'Chickens', 'Dates', 'Flour', 'Garlic', 'Hatchets and Saws', 'Helmets', 'Olive Oil', 'Olives', 'Peanuts', 'Rope', 'Veined marble', 'Wheat']
    Colinth: ['Anchors', 'Beer', 'Canvas', 'Dates', 'Flour', 'Hatchets and Saws', 'Honey', 'Olive Oil', 'Pickles', 'Rope', 'Silver', 'Wheat']
    Amandais: ['Beer', 'Carpet', 'Clothing', 'Hatchets and Saws', 'Honey', 'Linen', 'Olive Oil', 'Olives', 'Salt', 'Self Bows', 'Veined marble']

Place.Amandais =
  name: 'Amandais'
  img: 'places/AmandaisDay'
  paths:
    Vailia: 'Tomenoi'
    MtJulia: 'Tomenoi'
    Alkenia: 'Tomenoi'
    Nonkenia: 'Tomenoi'
    IronSands: 'Tomenoi'
    Tomenoi: -1
    Colinth: -1
    Kantis: -1
  stories: {}
  goods:
    Vailia: ['Alchemical Reagents', 'Allspice', 'Almonds', 'Amber', 'Bronze Sculpture', 'Camphor', 'Carpet', 'Cashews', 'Cloves', 'Coffee', 'Coral', 'Cork', 'Cumin', 'Decorative Stone', 'Eucalyptus', 'Feathers', 'Figs', 'Frankincense', 'Gold', 'Gold jewelry', 'Indigo', 'Ivory', 'Jasmine', 'Lemons', 'Liquorice', 'Myrrh', 'Nutmeg', 'Opal', 'Pearls', 'Pepper', 'Rubber', 'Ruby', 'Safflour', 'Saffron', 'Sandalweed', 'Saphires', 'Stone Sculpture', 'Sulphur', 'Tea leaves', 'Topaz', 'Tumeric', 'Vanilla', 'Wood Carvings']
    Tomenoi: ['Coffee', 'Cork', 'Cumin', 'Decorative Stone', 'Indigo', 'Lemons', 'Papyrus', 'Pepper', 'Tea leaves']
    Kantis: ['Chickens', 'Cloves', 'Cork', 'Cotton', 'Leather', 'Lemons', 'Live Goats', 'Papyrus', 'Pepper', 'Safflour']
    Amandais: ['Allspice', 'Almonds', 'Carpet', 'Cashews', 'Coffee', 'Cork', 'Figs', 'Gold Jewelry', 'Leather', 'Lemons', 'Liquorice', 'Pepper', 'Safflour', 'Saffron', 'Vanilla']
