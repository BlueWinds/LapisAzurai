import Cargo from 'game/Cargo'
import Place from 'game/Place'

export startingGame =
  version: 0
  day: 0
  scroll: 0
  chapter: 'Ch1'
  cargo: []
  damage: 0
  availableCargo: []
  jobFocus: ''
  jobSearch: {}
  showHelp: true
  map:
    from: 'Vailia'
    to: ''
    distance: 0
    delay: 0
  lastTravelEvent: 0
  lastStorm: 0
  reputation:
    Vailia: 5
  people:
    Natalie:
      xp: 0
      skills: {}
    James:
      xp: 0
      skills: {}
  history:
    Intro: 0

Cargo.goods =
  'Alchemical Reagents': [12, 7]
  'Allspice': [8, 6]
  'Almonds': [3, 3]
  'Amber': [5, 8]
  'Anchors': [2, 2]
  'Apples': [2, 3]
  'Apple Vinegar': [4, 4]
  'Apricots': [3, 3]
  'Bacon': [4, 3]
  'Basil': [7, 7]
  'Beer': [4, 5]
  'Brandy': [6, 7]
  'Brass fittings': [5, 8]
  'Bronze Sculpture': [12, 4]
  'Butter': [4, 2]
  'Candles': [4, 9]
  'Camphor': [6, 6]
  'Canvas': [4, 3]
  'Carpet': [5, 3]
  'Cashews': [4, 4]
  'Cast Iron Cookware': [3, 10]
  'Chains': [3, 8]
  'Chalk': [4, 4],
  'Chamomile': [9, 5]
  'Charcoal': [8, 4]
  'Chickens': [3, 2]
  'Cheese': [5, 4]
  'Clockwork Machinery': [3, 10]
  'Clothing': [3, 4]
  'Cloves': [8, 6]
  'Coffee': [9, 10]
  'Composite Bows': [5, 12]
  'Copper': [2, 4]
  'Coral': [2, 5]
  'Cork': [6, 6]
  'Cotton': [2, 3]
  'Cumin': [3, 10]
  'Dates': [3, 3]
  'Decorative Stone': [5, 5]
  'Expensive Pottery': [7, 9]
  'Eucalyptus': [3, 5]
  'Fashionable Clothing': [4, 10]
  'Feathers': [4, 7]
  'Figs': [2, 4]
  'Fine Furniture': [4, 3]
  'Fine Wine': [7, 12]
  'Fish Hooks': [4, 7]
  'Flour': [4, 4]
  'Frankincense': [5, 10]
  'Fruit Jam': [4, 4]
  'Furs': [7, 5]
  'Garlic': [3, 4]
  'Glass Beads': [6, 8]
  'Glass Jars': [3, 8]
  'Gold': [7, 9]
  'Gold Jewelry': [7, 12]
  'Hatchets and Saws': [3, 8]
  'Hats': [4, 8]
  'Helmets': [4, 9]
  'Honey': [5, 6]
  'Indigo': [10, 6]
  'Ink': [3, 10]
  'Iron': [5, 3]
  'Ivory': [4, 11]
  'Jasmine': [6, 7]
  'Kitchen Utensils': [3, 5]
  'Lavender': [3, 5]
  'Lead': [4, 4]
  'Leather': [7, 4]
  'Lemons': [4, 2]
  'Lilac': [5, 6]
  'Liquorice': [5, 4]
  'Linen': [4, 10]
  'Limestone': [2, 4]
  'Live Cattle': [2, 3]
  'Live Goats': [2, 3]
  'Lumber': [2, 2]
  'Maiden Tea': [2, 9]
  'Masts': [2, 4]
  'Matches': [3, 9]
  'Mint': [6, 4]
  'Mirrors and Lenses': [6, 11]
  'Mulberries': [4, 3]
  'Mercury': [7, 11]
  'Mustard': [6, 4]
  'Myrrh': [10, 8]
  'Nails and Tacks': [5, 5]
  'Nails': [4, 5]
  'Nutmeg': [4, 8]
  'Oars': [5, 6]
  'Olives': [5, 5]
  'Olive Oil': [3, 10]
  'Onions': [3, 3]
  'Opal': [7, 8]
  'Oranges': [4, 3]
  'Paper': [5, 7]
  'Papyrus': [4, 5]
  'Peanuts': [2, 4]
  'Pearls': [5, 11]
  'Pepper': [4, 12]
  'Pickled Fish': [2, 3]
  'Pickles': [3, 6]
  'Raisins': [2, 4]
  'Red Pepper': [4, 9]
  'Rope': [3, 7]
  'Rosehips': [3, 6]
  'Rough Clothing': [3, 8]
  'Rubber': [3, 10]
  'Ruby': [6, 10]
  'Safflower Oil': [4, 5]
  'Saffron': [9, 10]
  'Sage': [8, 6]
  'Salt': [3, 9]
  'Sandalwood': [4, 10]
  'Sapphires': [8, 8]
  'Self Bows': [5, 8]
  'Silver': [5, 5]
  'Smoked Fish': [3, 3]
  'Smoked Game Meat': [4, 4]
  'Soap': [2, 5]
  'Spears': [5, 12]
  'Steel Tools': [6, 11]
  'Steel Wire': [3, 5]
  'Stone Sculpture': [6, 3]
  'Sulfur': [4, 9]
  'Swords': [5, 12]
  'Tar': [4, 4]
  'Tea Leaves': [3, 5]
  'Tin': [3, 5]
  'Topaz': [6, 7]
  'Turmeric': [5, 9]
  'Vanilla': [7, 7]
  'Veined Marble': [3, 2]
  'Walnuts': [4, 5]
  'Wax': [4, 10]
  'Wheat': [3, 4]
  'Woad': [4, 7]
  'Wood Carvings': [5, 7]
  'Wool': [2, 4]
  'Wormwood': [4, 4]

Place.Vailia =
  name: 'Vailia'
  img: 'places/VailiaDay.jpg'
  paths:
    MtJulia: 1
    Alkenia: 'MtJulia'
    Nonkenia: 'MtJulia'
    IronSands: 1
    Tomenoi: 1
    Colinth: 'Tomenoi'
    Kantis: 'Tomenoi'
    Naxins: 'Tomenoi'
    Lephai: 'Tomenoi'
    Ment: 'Tomenoi'
    Crater: 'Tomenoi'
    Amandais: 'Tomenoi'
  stories: {}
  jobChance: 1.2
  goods:
    MtJulia: ['Apples', 'Beer', 'Butter', 'Cast Iron Cookware', 'Chickens', 'Composite Bows', 'Fish Hooks', 'Garlic', 'Hatchets and Saws', 'Kitchen Utensils', 'Nails', 'Pickled Fish', 'Pickles', 'Rope', 'Salt', 'Soap', 'Spears']
    Alkenia: ['Apple Vinegar', 'Beer', 'Brass fittings', 'Carpet', 'Cast Iron Cookware', 'Chains', 'Clockwork Machinery', 'Cloves', 'Composite Bows', 'Fine Furniture', 'Fine Wine', 'Fish Hooks', 'Fruit Jam', 'Glass Jars', 'Hatchets and Saws', 'Hats', 'Helmets', 'Honey', 'Indigo', 'Ink', 'Linen', 'Matches', 'Mustard', 'Nails and Tacks', 'Olive Oil', 'Paper', 'Rope', 'Rough Clothing', 'Soap', 'Steel Wire', 'Swords']
    Nonkenia: ['Beer', 'Candles', 'Canvas', 'Cast Iron Cookware', 'Chickens', 'Cloves', 'Coffee', 'Composite Bows', 'Flour', 'Glass Beads', 'Glass Jars', 'Hatchets and Saws', 'Linen', 'Matches', 'Nails', 'Olive Oil', 'Rough Clothing', 'Steel Tools', 'Swords', 'Wool']
    IronSands: ['Alchemical Reagents', 'Beer', 'Candles', 'Chains', 'Chickens', 'Garlic', 'Hatchets and Saws', 'Kitchen Utensils', 'Maiden Tea', 'Matches', 'Nails', 'Pickles', 'Rope', 'Smoked Fish', 'Soap', 'Spears', 'Steel Wire']
    Tomenoi: ['Alchemical Reagents', 'Anchors', 'Apple Vinegar', 'Basil', 'Beer', 'Brandy', 'Candles', 'Canvas', 'Carpet', 'Chamomile', 'Cheese', 'Chickens', 'Fish Hooks', 'Garlic', 'Glass Beads', 'Hats', 'Ink', 'Linen', 'Maiden Tea', 'Matches', 'Mint', 'Nails and Tacks', 'Paper', 'Pickled Fish', 'Raisins', 'Rope', 'Sage', 'Soap', 'Steel Tools', 'Steel Wire', 'Swords', 'Walnuts']
    Colinth: ['Anchors', 'Apple Vinegar', 'Bronze Sculpture', 'Candles', 'Carpet', 'Chains', 'Composite Bows', 'Fashionable Clothing', 'Fine Wine', 'Hats', 'Helmets', 'Ink', 'Linen', 'Maiden Tea', 'Matches', 'Paper', 'Pickles', 'Steel Tools', 'Steel Wire']
    Kantis: ['Anchors', 'Apple Vinegar', 'Basil', 'Brandy', 'Bronze Sculpture', 'Candles', 'Carpet', 'Chamomile', 'Clockwork Machinery', 'Composite Bows', 'Fashionable Clothing', 'Fine Furniture', 'Hats', 'Helmets', 'Ink', 'Linen', 'Matches', 'Mirrors and Lenses', 'Paper', 'Raisins', 'Sage', 'Steel Tools', 'Steel Wire', 'Walnuts']
    Amandais: ['Basil', 'Brandy', 'Candles', 'Carpet', 'Chamomile', 'Composite Bows', 'Fine Wine', 'Glass Beads', 'Helmets', 'Ink', 'Lavender', 'Lilac', 'Maiden Tea', 'Matches', 'Mirrors and Lenses', 'Paper', 'Raisins', 'Sage', 'Steel Tools', 'Steel Wire', 'Wormwood']

Place.MtJulia =
  name: 'Mt. Julia'
  img: 'places/MtJuliaDay.jpg'
  paths:
    Vailia: -1
    Alkenia: 1
    Nonkenia: 1
    IronSands: 1
    Tomenoi: 'Vailia'
    Colinth: 'Vailia'
    Kantis: 'Vailia'
    Naxins: 'Vailia'
    Lephai: 'Vailia'
    Ment: 'Vailia'
    Crater: 'Vailia'
    Amandais: 'Vailia'
  stories: {}
  jobChance: 0.4
  goods:
    Vailia: ['Lumber', 'Maiden Tea', 'Masts', 'Smoked Fish']
    Tomenoi: ['Lumber']

Place.Alkenia =
  name: 'Alkenia'
  img: 'places/AlkeniaDay.jpg'
  paths:
    Vailia: 'MtJulia'
    MtJulia: -1
    Nonkenia: 1
    IronSands: 'MtJulia'
    Tomenoi: 'MtJulia'
    Colinth: 'MtJulia'
    Kantis: 'MtJulia'
    Naxins: 'MtJulia'
    Lephai: 'MtJulia'
    Ment: 'MtJulia'
    Crater: 'MtJulia'
    Amandais: 'MtJulia'
  stories: {}
  jobChance: 0.65
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
  img: 'places/NonkeniaDay.jpg'
  paths:
    Vailia: 'MtJulia'
    MtJulia: -1
    Alkenia: -1
    IronSands: 'MtJulia'
    Tomenoi: 'MtJulia'
    Colinth: 'MtJulia'
    Kantis: 'MtJulia'
    Naxins: 'MtJulia'
    Lephai: 'MtJulia'
    Ment: 'MtJulia'
    Crater: 'MtJulia'
    Amandais: 'MtJulia'
  stories: {}
  jobChance: 0.5
  goods:
    Vailia: ['Alchemical Reagents', 'Apples', 'Bacon', 'Butter', 'Chamomile', 'Cheese', 'Feathers', 'Fruit Jam', 'Furs', 'Honey', 'Leather', 'Live Cattle', 'Maiden Tea', 'Mint', 'Mustard', 'Rope', 'Rosehips', 'Sage', 'Smoked Game Meat', 'Walnuts', 'Woad', 'Wormwood']
    MtJulia: ['Apples', 'Bacon', 'Butter', 'Cheese', 'Fruit Jam', 'Honey', 'Smoked Game Meat']
    IronSands: ['Apples', 'Bacon', 'Butter', 'Cheese', 'Fruit Jam', 'Leather', 'Rope', 'Smoked Game Meat']

Place.IronSands =
  name: 'Iron Sands'
  img: 'places/IronSandsDay.jpg'
  paths:
    Vailia: -1
    MtJulia: -1
    Alkenia: 'Vailia'
    Nonkenia: 'Vailia'
    Tomenoi: 'Vailia'
    Colinth: 'Vailia'
    Kantis: 'Vailia'
    Naxins: 'Vailia'
    Lephai: 'Vailia'
    Ment: 'Vailia'
    Crater: 'Vailia'
    Amandais: 'Vailia'
  stories: {}
  jobChance: 0.5
  goods:
    Vailia: ['Decorative Stone', 'Iron', 'Lead', 'Mercury', 'Tar', 'Tin']
    MtJulia: ['Cast Iron Cookware', 'Tar']
    Alkenia: ['Cast Iron Cookware', 'Iron']
    Nonkenia: ['Cast Iron Cookware', 'Decorative Stone']

Place.Tomenoi =
  name: 'Tomenoi'
  img: 'places/TomenoiDay.jpg'
  paths:
    Vailia: -1
    MtJulia: 'Vailia'
    Alkenia: 'Vailia'
    Nonkenia: 'Vailia'
    IronSands: 'Vailia'
    Colinth: 1
    Kantis: 1
    Naxins: 'Colinth'
    Lephai: 'Colinth'
    Ment: 'Colinth'
    Crater: 'Colinth'
    Amandais: 1
  stories: {}
  jobChance: 0.8
  goods:
    Vailia: ['Alchemical Reagents', 'Coffee', 'Copper', 'Cork', 'Cumin', 'Dates', 'Decorative Stone', 'Expensive Pottery', 'Flour', 'Indigo', 'Iron', 'Lemons', 'Olive Oil', 'Olives', 'Oranges', 'Peanuts', 'Red Pepper', 'Tar', 'Tea Leaves', 'Veined Marble']
    MtJulia: ['Coffee', 'Onions', 'Oranges']
    Colinth: ['Anchors', 'Apple Vinegar', 'Beer', 'Brandy', 'Canvas', 'Chains', 'Ink', 'Maiden Tea', 'Matches', 'Mint', 'Nails', 'Paper', 'Steel Wire', 'Swords']
    Kantis: ['Apple Vinegar', 'Brandy', 'Chains', 'Chamomile', 'Glass Beads', 'Ink', 'Linen', 'Maiden Tea', 'Matches', 'Mint', 'Nails', 'Paper', 'Sage', 'Steel Wire', 'Swords', 'Walnuts']
    Amandais: ['Brandy', 'Chamomile', 'Glass Beads', 'Ink', 'Maiden Tea', 'Matches', 'Mint', 'Nails', 'Paper', 'Sage', 'Steel Wire', 'Swords']

Place.Colinth =
  name: 'Colinth'
  img: 'places/ColinthDay.jpg'
  paths:
    Vailia: 'Tomenoi'
    MtJulia: 'Tomenoi'
    Alkenia: 'Tomenoi'
    Nonkenia: 'Tomenoi'
    IronSands: 'Tomenoi'
    Tomenoi: -1
    Kantis: 1
    Naxins: 1
    Lephai: 1
    Ment: 'Lephai'
    Crater: 'Lephai'
    Amandais: 1
  stories: {}
  jobChance: 0.6
  goods:
    Vailia: ['Apricots', 'Chalk', 'Iron', 'Lead', 'Lemons', 'Limestone', 'Mulberries', 'Oranges']
    Tomenoi: ['Apricots', 'Decorative Stone', 'Iron', 'Lemons', 'Onions', 'Oranges']
    Kantis: ['Cast Iron Cookware', 'Decorative Stone', 'Fish Hooks', 'Fruit Jam', 'Iron', 'Lemons', 'Masts', 'Mulberries', 'Nails', 'Oranges', 'Smoked Fish']
    Amandais: ['Cast Iron Cookware', 'Fruit Jam', 'Iron', 'Nails', 'Salt']

Place.Kantis =
  name: 'Kantis'
  img: 'places/KantisDay.jpg'
  paths:
    Vailia: 'Tomenoi'
    MtJulia: 'Tomenoi'
    Alkenia: 'Tomenoi'
    Nonkenia: 'Tomenoi'
    IronSands: 'Tomenoi'
    Tomenoi: -1
    Colinth: -1
    Naxins: 1
    Lephai: 1
    Ment: 'Lephai'
    Crater: 'Lephai'
    Amandais: 1
  stories: {}
  jobChance: 0.9
  goods:
    Vailia: ['Carpet', 'Dates', 'Fashionable Clothing', 'Fine Furniture', 'Flour', 'Honey', 'Olive Oil', 'Olives', 'Peanuts', 'Silver', 'Stone Sculpture', 'Veined Marble']
    Tomenoi: ['Canvas', 'Chickens', 'Dates', 'Flour', 'Garlic', 'Hatchets and Saws', 'Helmets', 'Olive Oil', 'Olives', 'Peanuts', 'Rope', 'Veined Marble', 'Wheat']
    Colinth: ['Anchors', 'Beer', 'Canvas', 'Dates', 'Flour', 'Hatchets and Saws', 'Honey', 'Olive Oil', 'Pickles', 'Rope', 'Silver', 'Wheat']
    Amandais: ['Beer', 'Carpet', 'Clothing', 'Hatchets and Saws', 'Honey', 'Linen', 'Olive Oil', 'Olives', 'Salt', 'Self Bows', 'Veined Marble']

Place.Naxins =
  name: 'Naxins'
  img: ''
  paths:
    Vailia: 'Colinth'
    MtJulia: 'Colinth'
    Alkenia: 'Colinth'
    Nonkenia: 'Colinth'
    IronSands: 'Colinth'
    Tomenoi: 'Colinth'
    Colinth: -1
    Kantis: -1
    Lephai: 1
    Ment: 'Lephai'
    Crater: 'Lephai'
    Amandais: 1
  stories: {}
  jobChance: 0.4

Place.Lephai =
  name: 'Lephai'
  img: ''
  paths:
    Vailia: 'Colinth'
    MtJulia: 'Colinth'
    Alkenia: 'Colinth'
    Nonkenia: 'Colinth'
    IronSands: 'Colinth'
    Tomenoi: 'Colinth'
    Colinth: -1
    Kantis: -1
    Naxins: -1
    Ment: 1
    Crater: 'Ment'
    Amandais: 1
  stories: {}
  jobChance: 0.1

Place.Ment =
  name: 'Ment'
  img: ''
  paths:
    Vailia: 'Lephai'
    MtJulia: 'Lephai'
    Alkenia: 'Lephai'
    Nonkenia: 'Lephai'
    IronSands: 'Lephai'
    Tomenoi: 'Lephai'
    Colinth: 'Lephai'
    Kantis: 'Lephai'
    Naxins: 'Lephai'
    Lephai: -1
    Ment: 1
    Crater: 1
  stories: {}
  jobChance: 0.3

Place.Crater =
  name: 'Crater'
  img: ''
  paths:
    Vailia: 'Ment'
    MtJulia: 'Ment'
    Alkenia: 'Ment'
    Nonkenia: 'Ment'
    IronSands: 'Ment'
    Tomenoi: 'Ment'
    Colinth: 'Ment'
    Kantis: 'Ment'
    Naxins: 'Ment'
    Lephai: 'Ment'
    Ment: -1
    Crater: 'Ment'
  stories: {}
  jobChance: 0.1

Place.Amandais =
  name: 'Amandais'
  img: 'places/AmandaisDay.jpg'
  paths:
    Vailia: 'Tomenoi'
    MtJulia: 'Tomenoi'
    Alkenia: 'Tomenoi'
    Nonkenia: 'Tomenoi'
    IronSands: 'Tomenoi'
    Tomenoi: -1
    Colinth: -1
    Kantis: -1
    Naxins: -1
    Lephai: -1
    Ment: 'Lephai'
    Crater: 'Lephai'
  stories: {}
  jobChance: 1.3
  goods:
    Vailia: ['Alchemical Reagents', 'Allspice', 'Almonds', 'Amber', 'Bronze Sculpture', 'Camphor', 'Carpet', 'Cashews', 'Cloves', 'Coffee', 'Coral', 'Cork', 'Cumin', 'Decorative Stone', 'Eucalyptus', 'Feathers', 'Figs', 'Frankincense', 'Gold', 'Gold Jewelry', 'Indigo', 'Ivory', 'Jasmine', 'Lemons', 'Liquorice', 'Myrrh', 'Nutmeg', 'Opal', 'Pearls', 'Pepper', 'Rubber', 'Ruby', 'Safflower Oil', 'Saffron', 'Sandalwood', 'Sapphires', 'Stone Sculpture', 'Sulfur', 'Tea Leaves', 'Topaz', 'Turmeric', 'Vanilla', 'Wood Carvings']
    Tomenoi: ['Coffee', 'Cork', 'Cumin', 'Decorative Stone', 'Indigo', 'Lemons', 'Papyrus', 'Pepper', 'Tea Leaves']
    Kantis: ['Chickens', 'Cloves', 'Cork', 'Cotton', 'Leather', 'Lemons', 'Live Goats', 'Papyrus', 'Pepper', 'Safflower Oil']
    Amandais: ['Allspice', 'Almonds', 'Carpet', 'Cashews', 'Coffee', 'Cork', 'Figs', 'Gold Jewelry', 'Leather', 'Lemons', 'Liquorice', 'Pepper', 'Safflower Oil', 'Saffron', 'Vanilla']
