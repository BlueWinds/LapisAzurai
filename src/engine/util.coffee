import $ from 'jquery'

# Tweak this number to speed up (>1) or slow down (<1) all animations in the game
speedFactor = 1.5
oldAnimate = $.fn.animate
$.fn.animate = ->
  arg = Array.apply(null, arguments)
  arg = arg.map((value)->
    if (typeof value is 'number')
      value /= speedFactor
    else if value.duration then value.duration /= speedFactor
    return value
  )
  oldAnimate.apply(@, arg)

oldSetTimeout = setTimeout
window.setTimeout = (callback, delay)->
  newDelay = delay / speedFactor or delay
  oldSetTimeout(callback, newDelay)

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

Math.randomRound = (number)->
  result = Math.floor(number)
  if Math.random() < number % 1 then result += 1
  return result

Math.keyChoice = (items)->
  if items instanceof Array
    choice = Math.floor(Math.random() * items.length)
    return choice
  return Math.choice(Object.keys(items))

Math.choice = (items)->
  return items[Math.keyChoice(items)]

Math.weightedChoice = (weights)->
  sum = Math.sumObject weights
  choice = Math.floor(Math.random() * sum)
  for key, value of weights
    choice -= value
    if choice <= 0 then return key

Math.clamp = (value, min, max)->
  return Math.min(max, Math.max(min, value))
