$.extend Person, {
  quote: (ignore, name, text)->
    unless Person[name] then name = Person.alias[name]
    "<q class=#{name}>#{text}</q>"
}
