import $ from 'jquery'

import Game from 'game/Game'
import Cargo from 'game/Cargo'
import Place from 'game/Place'
import {canSail, storiesAt, unmetNeed, visibleStories} from 'game/Story'

import {drawMap, travel} from 'gui/map'
import {updateOverview} from 'gui/person'
import {drawStory} from 'gui/story'

import * as content from 'content'
import {hideOverviewHelp, showOverviewHelp} from 'content/help'

export showOverview = (place = $('.place').attr('place') or g.map.from, duration = 500)->
  o = $('#overview')
  updateOverview()

  o.find('.place').replaceWith(draw(place))
  $('.place img', o).click -> hideOverview()

  unless o.hasClass('active')
    o.css({opacity: 0, display: 'block'})
    .stop().delay(duration * 0.2).animate({opacity: 1}, duration * 0.8)
  o.addClass('active')

  showOverviewHelp(place, duration)

export hideOverview = (duration = 500)->
  $('.logo').removeClass('active')
  $('#overview').removeClass('active').stop().animate {opacity: 0}, duration, ->
    unless $('#overview').hasClass('active') then $('#overview').css('display', 'none')
  drawMap()

  hideOverviewHelp(duration)

draw = (place)->
  if g.map.from is place
    distanceDesc = 'Docked'
    travelDiv = ''
  else
    distanceDesc = "#{Place.travelDays(g.map.from, place)} days sailing"
    disabled = if canSail() then '' else 'disabled'
    travelDiv = """<div class="travel #{disabled}" #{if disabled then '' else 'onclick="clickTravel(\'' + place + '\');"'}>
      ⛵⇢
      <div class="sail-speed">#{Math.round(Game.travelSpeed('Sail')) * 100}% speed</div>
    </div>"""

  deliverable = g.cargo.filter (job)-> job.to is place
  available = g.availableCargo.filter (job)-> job.from is place
  visible = visibleStories(storiesAt(place, g.chapter))

  clickableHere = visible.filter((s)-> not unmetNeed(place, s))
  visibleHere = visible.filter((s) -> unmetNeed(place, s))

  # If there are blocking stories, then hide everything else until they're dealt with.
  blocking = clickableHere.filter((s)-> content[s].blocking)
  if blocking.length
    clickableHere = blocking


  return """<div place="#{place}" class="place">
    <img src="game/content/#{Place[place].img}">
    #{travelDiv}
    <div class="name">#{Place[place].name}</div>
    <div class="description">#{distanceDesc} - #{Math.floor(g.reputation[place])} reputation</div>
    <div class="table-wrapper"><table>
      #{Game.drawList clickableHere, drawStory.bind(null, place)}
      #{if blocking.length is 0 and g.damage and g.map.from is place then Game.drawList [true], drawRepair else ''}
      #{if blocking.length is 0 then Game.drawList [place], Cargo.drawSearch else ''}
      #{Game.drawList deliverable, Cargo.drawDelivery}
      #{Game.drawList available, Cargo.draw}
      #{Game.drawList visibleHere, drawStory.bind(null, place)}
    </table></div>
  </div>"""

window.clickTravel = (to)->
  hideOverview()
  g.map.to = Place.travelSteps(g.map.from, to)[0][1]
  drawMap()

  direction = Place.direction(g.map.from, g.map.to)
  g.map.distance = Place.svgElement().getTotalLength() * (direction < 0)
  travel()

drawRepair = ->
  newDamage = g.damage + Place.repairEffects().damage

  oldPercent = Game.travelSpeed('Sail') * 100
  newPercent = Game.travelSpeed('Sail', newDamage) * 100
  """<td class="story active repair" onclick="clickRepair();">
    <div>
      <span class="label">Repair Ship</span>
      <span class="cost">#{Game.drawEffects(Place.repairEffects())}</span>
      <span class="success">✓</span>
    </div>
    <div class="damage">#{Math.round(oldPercent)}% → #{Math.round(newPercent)}% sail speed</div>
  </td>"""

window.clickRepair = (i)->
  Game.passDay()
  Game.applyEffects Place.repairEffects()

  Game.showPassDayOverlay(undefined, 'Repaired the ship')
  Game.animateSuccess('.repair.active .success')
