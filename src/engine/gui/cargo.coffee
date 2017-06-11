remainingDiv = (days) ->
  if days >= 0
    """<div><span class="remaining">#{days} days remaining</span></div>"""
  else
    """<div><span class="remaining expired">Expired</span></div>"""

$.extend Cargo, {
  drawCargo: ->
    $('header .cargo').html "#{g.cargo.length}/#{Cargo.maxCargo()} Cargo"

    byRemaining = (a, b)-> a.start - b.start

    c = g.cargo.sort(byRemaining).map((c)->
      "• #{c.name} from #{Place[c.from].name} to #{Place[c.to].name}, #{Cargo.deliveryTimeRemaining(c)} days remaining"
    )
    $('header .cargo').attr 'title', c.join('\n')

  draw: (cargo)->
    i = g.availableCargo.indexOf(cargo)
    onclick = if g.location is cargo.from and Cargo.maxCargo() > g.cargo.length
      'onclick="Cargo.clickAccept(' + i + ');"'
    else ''

    """<td class="cargo accept #{i} #{if onclick then 'active' else ''}" #{onclick}>
      <div><span class="what">#{cargo.name}</span> to <span class="to">#{Place[cargo.to].name}</span><span class="success">✓</span></div>
      #{remainingDiv Cargo.deliveryTimeRemaining(cargo)}
    </nd>"""

  drawDelivery: (cargo)->
    i = g.cargo.indexOf(cargo)
    onclick = if g.location is cargo.to
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
