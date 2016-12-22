remainingDiv = (days) ->
  if remaining >= 0
    """<div><span class="remaining">#{remaining} days remaining</span></div>"""
  else
    """<div><span class="remaining expired">Expired</span></div>"""

$.extend Cargo, {
  drawCargo: ->
    $('header .cargo').html "#{g.cargo.length}/#{Cargo.maxCargo()} Cargo"

    c = g.cargo.map((c)-> "• #{c.name} from #{c.from} to #{c.to}")
    $('header .cargo').attr 'title', c.join('\n')

  draw: (cargo)->
    onclick = if g.location is cargo.from
      'onclick="Cargo.accept(' + g.availableCargo.indexOf(cargo) + ');Place.drawMap();"'
    else ''

    """<div class="cargo #{if onclick then 'active' else ''}" #{onclick}>
      <div>Transport <span class="what">#{cargo.name}</span> from <span class="from">#{cargo.from}</span> to <span class="to">#{cargo.to}</span></div>
      #{remainingDiv Cargo.deliveryTimeRemaining(cargo)}
    </div>"""

  drawDelivery: (cargo)->
    onclick = if g.location is cargo.to
      'onclick="Cargo.deliver(' + g.cargo.indexOf(cargo) + ');Place.drawMap();"'
    else ''

    """<div class="cargo delivery #{if onclick then 'active' else ''}" #{onclick}>
      <div>Deliver <span class="what">#{cargo.name}</span> from <span class="from">#{cargo.from}</span></div>
      #{remainingDiv Cargo.deliveryTimeRemaining(cargo)}
    </div>"""
}
