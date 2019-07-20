import './index.html'
import 'content/Logo.png'
import './README.txt'

import $ from 'jquery'

import {featureDetect} from 'game/util'
import {guiSetup, load} from 'gui/game'


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

$ ->
  unless featureDetect() then return
  unless $('#container').length then return

  guiSetup()
  load()
