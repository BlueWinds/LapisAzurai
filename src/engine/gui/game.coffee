startDay = 457783 # Ascending Earth 13, 1271

dayList = ['1st', '2nd', '3rd', '4th', '5th', '6th', '7th', '8th', '9th', '10th', '11th', '12th', '13th', '14th', '15th', '16th', '17th', '18th', '19th', '20th', '21st', '22nd', '23rd', '24th', '25th', '26th', '27th', '28th', '29th', '30th']
monthList = ['Ascending', 'Resplendant', 'Descending']
seasonList = ['Wood', 'Fire', 'Earth', 'Water']

$ ->
  if not featureDetect() then return

  if not $('#content').length then return
  Game.guiSetup()
  Story.guiSetup()

  Game.start Game.mostRecentGameData()
  Game.drawStatus()
  Place.drawMap()
  Story.drawHistory()

$.extend Game, {
  year: -> (g.day + startDay) // 360
  dayOfYear: -> (g.day + startDay) % 360
  season: -> seasonList[Game.dayOfYear() // 90]
  dayOfSeason: -> Game.dayOfYear() % 90
  month: -> monthList[Game.dayOfSeason() // 30]
  dayOfMonth: -> Game.dayOfYear() % 30
  date: -> "#{dayList[Game.dayOfMonth()]} of #{Game.month()} #{Game.season()}, #{Game.year()}"

  drawDate: ->
    $('header .day').html Game.date()

  drawStatus: -> # Draws the status bar and included items
    Game.drawDate()
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

  guiSetup: ->
    c = $('#content')

    $('#new-game').click ->
      c.empty()
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


    # Set up draggable map
    map = $('#map')
    mapElements = $('#map, #places')
    dragMap = $('#drag-map')

    # Center the map initially
    w = map.width()
    h = map.height()
    dX = 0
    dY = 0
    center = ->
      dX = (dragMap.width() - w) / 2
      dY = (dragMap.height() - h) / 2
      mapElements.css('transform', "translate(#{dX}px, #{dY}px)")

    $(window).on 'resize', center
    center()

    map.on 'mousedown touchstart', (lastE)->
      map.on 'mousemove touchmove', (e)->
        if w > dragMap.width()
          dX += e.pageX - lastE.pageX
          dX = Math.min(0, Math.max(dX, dragMap.width() - w))

        if h > dragMap.height()
          dY += e.pageY - lastE.pageY
          dY = Math.min(0, Math.max(dY, dragMap.height() - h))

        mapElements.css('transform', "translate(#{dX}px, #{dY}px)")
        lastE = e

    $(window).on 'mouseup touchend touchcancel', ->
      map.off('mousemove touchmove')

    $('#LabelLayer g').on 'click', ->
      label = $(@)
      place = $('[place="' + @id + '"]')
      unless place.length then return false

      place.stop().animate({to: place.outerHeight()}, {step: animateClip, duration: 200})
      label.stop().animate {opacity: 0}, 200
      $('#map').one 'click', ->
        place.stop().animate({to: 0}, {step: animateClip, duration: 200})
        label.stop().animate {opacity: 1}, 200

      return false

    animateClip = (now, fx)->
      $(@).css('clip', 'rect(0px 500px ' + now + 'px 0)')

    $('#container').on 'click', '.overlay', ->
      $('.overlay').animate {opacity: 0}, -> @remove()

    o = $('#overview')
    $('.logo').on 'click', ->
      if o.hasClass('active')
        $('.logo').removeClass('active')
        o.removeClass('active').stop().animate {opacity: 0}, 200, ->
          unless o.hasClass('active') then o.css('display', 'none')
      else
        Game.drawOverview()
        $('.logo').addClass('active')
        o.addClass('active').css({opacity: 0, display: 'block'}).stop().animate({opacity: 1}, 200)

  showOverlay: (image, duration = 0, c = 'overlay')->
    overlay = $("""<div class='#{c}'><img src='#{image}'></div>""").css('opacity', 0)
    $('#container').append(overlay)
    if duration
      overlay
        .animate({opacity: 1}, duration / 2)
        .delay(duration / 2)
        .animate {opacity: 0}, duration / 2, ->
          overlay.remove()
    else
      overlay.animate({opacity: 1}, 500)
}

oldPassDay = Game.passDay
Game.passDay = ->
  oldPassDay()
  Game.drawStatus()

  setTimeout ->
    # Don't save while we're in the middle of traveling
    unless Place[g.location] then return

    delete localStorage[localStorage.autosave]
    now = Date.now()
    localStorage.setItem now, jsyaml.safeDump(g)
    localStorage.autosave = now
  , 0
