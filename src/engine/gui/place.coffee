$.extend Place, {
  showOverview: (place = $('.place').attr('place') or g.map.from, duration = 500)->
    if Story.gameIsOver() then return
    o = $('#overview')
    Person.updateOverview()

    o.find('.place').replaceWith(Place.draw(place))
    $('.place img', o).click -> Place.hideOverview()

    unless o.hasClass('active')
      o.css({opacity: 0, display: 'block'})
      .stop().delay(duration * 0.2).animate({opacity: 1}, duration * 0.8)
    o.addClass('active')

  hideOverview: (duration = 500)->
    $('.logo').removeClass('active')
    $('#overview').removeClass('active').stop().animate {opacity: 0}, duration, ->
      unless $('#overview').hasClass('active') then $('#overview').css('display', 'none')
    Place.drawMap()

  draw: (place)->
    if g.map.from is place
      distanceDesc = 'Docked'
      travel = ''
    else
      distanceDesc = "#{Place.travelDays(g.map.from, place)} days sailing"
      disabled = if Story.canSail() then '' else 'disabled'
      travel = """<div class="travel #{disabled}" #{if disabled then '' else 'onclick="Place.clickTravel(\'' + place + '\');"'}>
        ⛵⇢
        <div class="sail-speed">#{Math.round(Game.travelSpeed('Sail')) * 100}% speed</div>
      </div>"""

    deliverable = g.cargo.filter (job)-> job.to is place
    available = g.availableCargo.filter (job)-> job.from is place
    visibleStories = Story.visibleStories(Place[place].stories[g.chapter])

    clickableStories = visibleStories.filter((s)-> not Story.unmetNeed(place, s))
    visibleStories = visibleStories.filter(Story.unmetNeed.bind(null, place))

    # If there are blocking stories, then hide everything else until they're dealt with.
    blocking = clickableStories.filter((s)-> Story[s].blocking)
    if blocking.length
      clickableStories = blocking


    return """<div place="#{place}" class="place">
      <img src="game/content/#{Place[place].img}">
      #{travel}
      <div class="name">#{Place[place].name}</div>
      <div class="description">#{distanceDesc} - #{Math.floor(g.reputation[place])} reputation</div>
      <div class="table-wrapper"><table>
        #{Game.drawList clickableStories, Story.draw.bind(null, place)}
        #{if blocking.length is 0 and g.damage and g.map.from is place then Game.drawList [true], Place.drawRepair else ''}
        #{if blocking.length is 0 then Game.drawList [place], Cargo.drawSearch else ''}
        #{Game.drawList deliverable, Cargo.drawDelivery}
        #{Game.drawList available, Cargo.draw}
        #{Game.drawList visibleStories, Story.draw.bind(null, place)}
      </table></div>
    </div>"""

  drawRepair: ->
    newDamage = g.damage + Place.repairEffects().damage

    oldPercent = Game.travelSpeed('Sail') * 100
    newPercent = Game.travelSpeed('Sail', newDamage) * 100
    """<td class="story active repair" onclick="Place.clickRepair();">
      <div>
        <span class="label">Repair Ship</span>
        <span class="cost">#{Game.drawEffects(Place.repairEffects())}</span>
        <span class="success">✓</span>
      </div>
      <div class="damage">#{Math.round(oldPercent)}% → #{Math.round(newPercent)}% sail speed</div>
    </td>"""

  clickRepair: (i)->
    Game.passDay()
    Game.applyEffects Place.repairEffects()

    Game.showPassDayOverlay(undefined, 'Repaired the ship')
    Game.animateSuccess('.repair.active .success')
}
