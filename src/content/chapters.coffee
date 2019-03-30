import './content.css'

import ch1 from './ch1/_.coffee'
import ch2 from './ch2/_.coffee'
import ch3 from './ch3/_.coffee'

for place, stories of ch1
  Place[place].stories.Ch1 = Object.keys(stories)
  for key, value of stories
    value.place = place
    Story[key] = value

for place, stories of ch2
  Place[place].stories.Ch2 = Object.keys(stories)
  for key, value of stories
    value.place = place
    Story[key] = value

if ENABLE_CH3
  for place, stories of ch3
    Place[place].stories.Ch3 = Object.keys(stories)
    for key, value of stories
      value.place = place
      Story[key] = value
