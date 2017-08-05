String.rate = (number)-> switch number
  when 1 / 4 then 'a quarter'
  when 1 / 3 then 'a third'
  when 1 / 2 then 'half'
  when 2 / 3 then 'two thirds'
  when 1 then ''
  when 2 then 'twice'
  when 3 then 'three times'
  else number.toString()

Object.defineProperty Number.prototype, 'toWord', {value: ->
  return {
    0: 'zero'
    1: 'one'
    2: 'two'
    3: 'three'
    4: 'four'
    5: 'five'
    6: 'six'
    7: 'seven'
    8: 'eight'
    9: 'nine'
    10: 'ten'
    11: 'eleven'
  }[@] or Number(@).toString()
}

Object.defineProperty Number.prototype, 'round', {value: (count = 1)->
  return Number(@).toFixed(count).replace(/\.0+$/, '')
}

Object.defineProperty String.prototype, 'capitalize', {value: ->
  @charAt(0).toUpperCase() + @slice(1)
}

Object.defineProperty Array.prototype, 'wordJoin', {value: (join = 'and')->
  if @length is 1 then return @[0]
  str = @slice(0, -1).join(', ')
  str += " #{join} " + @[@length - 1]
  return str
}

Math.sum = (items)->
  sum = 0
  for val in items
    sum += val
  return sum

Math.sumObject = (items)->
  sum = 0
  for key, val of items
    sum += val
  return sum

getRand = (seed)->
  if seed
    (new Math.seedrandom(seed))()
  else
    Math.random()

Math.randomRound = (number, seed)->
  result = Math.floor(number)
  if getRand(seed) < number % 1 then result += 1
  return result

Math.keyChoice = (items, seed)->
  if items instanceof Array
    choice = Math.floor(getRand(seed) * items.length)
    return choice
  return Math.choice(Object.keys(items), seed)

Math.choice = (items, seed)->
  return items[Math.keyChoice(items, seed)]

Math.weightedChoice = (weights, seed)->
  sum = Math.sumObject weights
  choice = Math.floor(getRand(seed) * sum)
  for key, value of weights
    choice -= value
    if choice <= 0 then return key
