$.extend Person, {
  drawImage: (position, person, expression)->
    unless Person[person] then person = Person.alias[person]
    src = Person[person].images[expression]
    unless src
      console.error(new Error "Can't find image '#{expression}' for #{person}")
      return ""

    return """<img class="person #{person} #{position}" src='game/content/#{src}.png'>"""

  scrollColor: (person, layer, position = 'center', expression = 'normal')->
    pallet = Object.keys(Person[person].colors[layer]).sort()
    colors = g.people[person].color

    key = pallet.indexOf(colors[layer])
    newKey = (key + 1) % pallet.length
    colors[layer] = pallet[newKey]

    $('.person.' + person).replace(Person.drawImage(position, person, expression))

  quote: (ignore, person, text)->
    unless Person[person] then person = Person.alias[person]
    "<q class=#{person}>#{text}</q>"
}
