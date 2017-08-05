startDay = 457783 # Ascending Earth 13, 1271

dayList = ['1st', '2nd', '3rd', '4th', '5th', '6th', '7th', '8th', '9th', '10th', '11th', '12th', '13th', '14th', '15th', '16th', '17th', '18th', '19th', '20th', '21st', '22nd', '23rd', '24th', '25th', '26th', '27th', '28th', '29th', '30th']
monthList = ['Ascending', 'Resplendant', 'Descending']
seasonList = ['Wood', 'Fire', 'Earth', 'Water']

$ ->
  if not featureDetect() then return

  if not $('#container').length then return
  Game.guiSetup()
  Story.guiSetup()

  Game.start Game.mostRecentGameData()
  Game.drawStatus()
  Place.drawMap()
  Story.drawHistory()

$.extend Game, {
  year: (d = g.day)-> (d + startDay) // 360
  dayOfYear: (d = g.day)-> (d + startDay) % 360
  season: (d = g.day)-> seasonList[Game.dayOfYear(d) // 90]
  dayOfSeason: (d = g.day)-> Game.dayOfYear(d) % 90
  month: (d = g.day)-> monthList[Game.dayOfSeason(d) // 30]
  dayOfMonth: (d = g.day)-> Game.dayOfYear(d) % 30
  date: (d = g.day)-> "#{dayList[Game.dayOfMonth(d)]} of #{Game.month(d)} #{Game.season(d)}, #{Game.year(d)}"

  drawDate: (d = g.day)->
    $('header .day').html Game.date(d)

  drawStatus: (d = g.day)-> # Draws the status bar and included items
    Game.drawDate(d)
    Cargo.drawCargo()

  drawList: (items, draw)->
    if items.length
      """<tr>#{items.map(draw).join "</tr><tr>"}</tr>"""
    else ''

  drawOverview: ->
    o = $('#overview').empty()
    o.append """
      #{Place.drawOverview()}
      #{Person.drawOverview()}
    """
    Person.activateDrawings(o)

  drawEffects: (e)->
    text = []
    for key, results of e
      if typeof results is 'number'
        results = Math.round(results * 10) / 10
        text.push "#{results} #{key}"
      else
        for name, amount of results
          text.push "#{amount} #{key} for #{name}"
    return text.join('\n')

  showOverview: ->
    Game.drawOverview()
    $('.logo').addClass('active')
    $('#overview').addClass('active').css({opacity: 0, display: 'block'})
    .stop().animate({opacity: 1}, 200)

  hideOverview: ->
    $('.logo').removeClass('active')
    $('#overview').removeClass('active').stop().animate {opacity: 0}, 200, ->
      unless $('#overview').hasClass('active') then $('#overview').css('display', 'none')

  guiSetup: ->
    c = $('#content')

    $('#new-game').click ->
      Game.start($.extend(true, {}, Game.starting))
      Game.drawStatus()
      Place.drawMap()
      Story.display('Intro')

    $('#save-game').click ->
      unless g then return

      localStorage.setItem Date.now(), jsyaml.safeDump(g)
      $('#save-game .success').animate {opacity: 1}, 500
      .animate {opacity: 0}, 2000

    $('#load-game').click -> Game.showLoadPage()

    $('#container').on 'click', '.overlay', ->
      $('.overlay').animate {opacity: 0}, -> @remove()

    $('.logo').on 'click', ->
      if $('#overview').hasClass('active')
        Game.hideOverview()
      else
        Game.showOverview()

    Place.guiSetup()

  showOverlay: (element, duration = 0, c = 'overlay', done)->
    overlay = $("""<div class='#{c}'></div>""").css('opacity', 0).append(element)
    $('#container').append(overlay)
    if duration
      overlay
        .animate({opacity: 1}, duration / 2)
        .delay(duration / 2)
        # Dummy animation so we can trigger the callback after delay, rather than waiting for the overlay to entirely fade out
        .animate {opacity: 1}, 1, ->
          if done then done()
        .animate {opacity: 0}, duration / 2, ->
          overlay.remove()
    else
      overlay.animate({opacity: 1}, 500)

  showPassDayOverlay: (day, result, next)->
    console.log result
    Game.drawStatus(day)
    Game.showOverlay("<h1>#{Game.date(day)}</h1><h3>#{result}</h3>", 2000, 'dayOverlay', next)
}

# Autosave every time a day passes
oldPassDay = Game.passDay
Game.passDay = ->
  oldPassDay()

  setTimeout ->
    delete localStorage[localStorage.autosave]
    now = Date.now()
    localStorage.setItem now, jsyaml.safeDump(g)
    localStorage.autosave = now
  , 0
