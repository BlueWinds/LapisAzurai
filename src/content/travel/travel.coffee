p = 'travel/'

Place.travel.Sail =
  normalImages: [
    p + 'CabinDay.jpg'
    p + 'CabinNight.jpg'
    p + 'DeckDay.jpg'
    p + 'DeckNight.jpg'
    p + 'DeckFog.jpg'
    p + 'SailingDay.jpg'
    p + 'SailingNight.jpg'
  ]
  delayDailyChance: ->
    if g.history.FirstStorm then 0.04
    # Try to trigger a storm on the first trip back to Vailia
#     else if g.map.from is 'MtJulia' then 0.2
    else 0
  delayDailyDamage: -> 5 * (Math.random() + 0.5)
  delayAvgDuration: -> 4 * (Math.random() + 0.5)
  delayImages: [
    p + 'CabinStorm.jpg',
    p + 'DeckStorm.jpg',
    p + 'SailingStorm.jpg'
  ]
