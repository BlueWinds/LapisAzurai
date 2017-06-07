$.extend Person, {
  drawImage: (position, name, expression)->
    unless Person[name] or Person.alias[name]
      console.error(new Error "Can't find person #{name}")
      return ""

    unless Person[name] then name = Person.alias[name]
    src = Person[name].images[expression]
    unless src
      console.error(new Error "Can't find image '#{expression}' for #{name}")
      return ""

    return """<img class="person #{name} #{position}" src='game/content/#{src}.png'>"""

  scrollColor: (name, layer, position = 'center', expression = 'normal')->
    pallet = Object.keys(Person[name].colors[layer]).sort()
    colors = g.people[name].color

    key = pallet.indexOf(colors[layer])
    newKey = (key + 1) % pallet.length
    colors[layer] = pallet[newKey]

    $('.person.' + name).replace(Person.drawImage(position, name, expression))

  quote: (ignore, name, text)->
    unless Person[name] then name = Person.alias[name]
    "<q class=#{name}>#{text}</q>"
}
