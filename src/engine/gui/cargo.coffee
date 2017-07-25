remainingDiv = (days) ->
  if days >= 0
    """<div><span class="remaining">#{days} days to deliver</span></div>"""
  else
    '''<div><span class="remaining expired">Expired</span></div>'''

$.extend Cargo, {
  drawCargo: ->
    $('header .cargo').html "#{g.cargo.length}/#{Cargo.maxCargo()} Cargo"

    byRemaining = (a, b)-> a.start - b.start

    c = g.cargo.sort(byRemaining).map((c)->
      time = Cargo.deliveryTimeRemaining(c)
      "• #{c.name} from #{Place[c.from].name} to #{Place[c.to].name}, #{if time then time + ' days te deliver' else 'Expired'}"
    )
    $('header .cargo').attr 'title', c.join('\n')

  draw: (cargo)->
    i = g.availableCargo.indexOf(cargo)
    onclick = if g.location is cargo.from and Cargo.maxCargo() > g.cargo.length and Story.canSail()
      'onclick="Cargo.clickAccept(' + i + ');"'
    else ''

    accept = Cargo.acceptTimeRemaining(cargo)
    deliver = Cargo.deliveryTimeRemaining(cargo)
    """<td class="cargo accept #{i} #{if onclick then 'active' else ''}" #{onclick}>
      <div><span class="what">#{cargo.name}</span> to <span class="to">#{Place[cargo.to].name}</span><span class="success">✓</span></div>
      <div><span class="remaining">#{accept} days to pick up, #{deliver} days to deliver</span></div>
    </nd>"""

  drawDelivery: (cargo)->
    i = g.cargo.indexOf(cargo)
    onclick = if g.location is cargo.to and Story.canSail()
      'onclick="Cargo.clickDeliver(' + i + ');"'
    else ''

    """<td class="cargo delivery #{i} #{if onclick then 'active' else ''}" #{onclick}>
      <div>Deliver <span class="what">#{cargo.name}</span> from <span class="from">#{cargo.from}</span><span class="success">✓</span></div>
      #{remainingDiv Cargo.deliveryTimeRemaining(cargo)}
    </td>"""

  clickAccept: (i)->
    cargo = g.availableCargo[i]
    Cargo.accept(cargo)


    $('.cargo.accept.' + i + ' .success')
      .animate({opacity: 1}, 500)
      .animate {opacity: 0}, 1500, ->
        Place.drawMap()

  clickDeliver: (i)->
    Cargo.deliver(i)

    $('.cargo.delivery.' + i + ' .success')
      .animate({opacity: 1}, 500)
      .animate {opacity: 0}, 2000, ->
        Place.drawMap()
}
