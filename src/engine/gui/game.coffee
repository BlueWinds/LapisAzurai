startDay = 457783 # Ascending Earth 13, 1271

dayList = ['1st', '2nd', '3rd', '4th', '5th', '6th', '7th', '8th', '9th', '10th', '11th', '12th', '13th', '14th', '15th', '16th', '17th', '18th', '19th', '20th', '21st', '22nd', '23rd', '24th', '25th', '26th', '27th', '28th', '29th', '30th']
monthList = ['Ascending', 'Resplendant', 'Descending']
seasonList = ['Wood', 'Fire', 'Earth', 'Water']

$ ->
  if not featureDetect() then return

  if not $('#container').length then return
  Game.guiSetup()
  Story.guiSetup()
  Game.load(Game.mostRecentGameData())

$.extend Game, {
  year: (d = g.day)-> (d + startDay) // 360
  dayOfYear: (d = g.day)-> (d + startDay) % 360
  season: (d = g.day)-> seasonList[Game.dayOfYear(d) // 90]
  dayOfSeason: (d = g.day)-> Game.dayOfYear(d) % 90
  month: (d = g.day)-> monthList[Game.dayOfSeason(d) // 30]
  dayOfMonth: (d = g.day)-> Game.dayOfYear(d) % 30
  date: (d = g.day)-> "#{dayList[Game.dayOfMonth(d)]} of #{Game.month(d)} #{Game.season(d)}, #{Game.year(d)}"

  drawStatus: (d = g.day)-> # Draws the status bar and included items
    $('header .day').html Game.date(d)
    Cargo.drawCargo()

  drawList: (items, draw)->
    if items.length
      """<tr>#{items.map(draw).join "</tr><tr>"}</tr>"""
    else ''

  drawEffects: (e)->
    text = []

    effectFuncs =
      reputation: (place, amount)-> amount + ' rep'
      xp: (person, amount)-> amount + 'xp for ' + person

    for key, results of e
      if typeof results is 'number'
        text.push "#{Math.round(results)} #{key}"
      else
        for name, amount of results when amount
          text.push effectFuncs[key](name, amount)
    return text.join('<br>\n')

  guiSetup: ->
    c = $('#content')

    $('#new-game').click ->
      Game.load($.extend(true, {}, Game.starting))
      Story.display('Intro')

    $('#save-game').click ->
      unless g then return

      localStorage.setItem Date.now(), jsyaml.safeDump(g)
      $('#save-game .success').animate {opacity: 1}, 500
      .animate {opacity: 0}, 2000

    $('#load-game').click -> Game.showLoadPage()

    $('#container').on 'click', '.overlay', ->
      $('.overlay').animate {opacity: 0}, -> @remove()

    Place.guiSetup()

  showOverlay: (element, duration = 0, c = 'overlay', done)->
    overlay = $("""<div class='#{c}'></div>""").css('opacity', 0).append(element)
    $('#container').append(overlay)
    if duration
      fadeOut = -> overlay.animate {opacity: 0}, duration / 2, -> overlay.remove()
      overlay
        .animate({opacity: 1}, duration / 2)
        .delay(duration / 2)
        # Dummy animation so we can trigger the callback after delay, rather than waiting for the overlay to entirely fade out
        .animate {opacity: 1}, 1, ->
          if done then done(fadeOut) else fadeOut()

    else
      overlay.animate({opacity: 1}, 500)

  showPassDayOverlay: (day, result, next)->
    Game.drawStatus(day)
    if g.nextDayDescription
      result += '<br>' + g.nextDayDescription
    Game.showOverlay("<h1>#{Game.date(day)}</h1><h3>#{result}</h3>", 2000, 'dayOverlay', next)

  load: (data)->
    Game.start data
    Game.drawStatus()
    Place.drawMap()
    Story.drawHistory()
    Person.drawOverview()
    if (g.map.to and g.scroll < 0)
      Place.travel()

  animateSuccess: (element)->
    $(element).animate({opacity: 1}, 500).animate {opacity: 0}, 1500, ->
      Place.drawMap()
      Place.showOverview()
}

# Autosave every time a day passes
oldPassDay = Game.passDay
Game.passDay = ->
  oldPassDay()

  end = Story.gameIsOver()
  if end
    Story.display(Story[end].required)
    g.history[Story[end].required] = g.day
    return

  setTimeout ->
    unless g.day % 20 is 1
      delete localStorage[localStorage.autosave]
    now = Date.now()
    localStorage.setItem now, jsyaml.safeDump(g)
    localStorage.autosave = now

    if g.day % 20 is 0
      delete localStorage[localStorage.autosave60]
      localStorage.autosave60 = localStorage.autosave40
      localStorage.autosave40 = localStorage.autosave20
      localStorage.autosave20 = localStorage.autosave0
      localStorage.autosave0 = localStorage.autosave
      console.log localStorage.autosave0, localStorage.autosave20
    else
  , 0
