s = {}

Place.Alkenia.stories.Ch3 = Object.keys(s)
Place.Alkenia.stories.Ch3.push('KatCh3Yes')
for key, value of s
  value.place = 'Alkenia'
  Story[key] = value
