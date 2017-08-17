Story.Load =
  label: 'Load'
  text: ->
    rows = for key in Object.keys(localStorage).sort().reverse()
      date = new Date(parseInt(key, 10))
      unless date.getTime() then continue
      try
        game = jsyaml.safeLoad(localStorage[key])
      catch e
        continue

      blob = new Blob([localStorage[key]], {type: 'text/plain'})
      blob = URL.createObjectURL blob

      name = "#{game.chapter} - Day #{game.day} - #{game.location}"
      if localStorage.autosave is key then name += ' (auto)'

      row = [
        name
        "#{date.toLocaleString().replace(/:\d+( | $)/, ' ')}"
        """<button class="load">Load</button>
          <a class="export" download="#{name}.yaml" href="#{blob}">Export</a>
          <button class="delete">Delete</button>"""
      ].join('</td><td>')
      "<tr game='#{key}'><td>" + row + '</td></tr>'

    table = """<table class="load-game">
      <tr><td colspan="3"><input type="file"></td></tr>
      #{rows.join("\n")}
    </table>""".replace(/\n/g, '')

    return """|| class="screen load"
      #{table}
    """

Game.showLoadPage = ->
  elements = Story.render('Load')
  $('#content').css({display: 'block'}).animate({opacity: 1}, 300)
  $('#stories').empty().append(elements)
  Story.forwardSection(elements.first(), 1)

  $('#stories input').change ->
    unless file = @files[0]
      return
    reader = new FileReader()
    reader.onload = =>
      $('.import-error').remove()
      try
        Game.start jsyaml.safeLoad(reader.result)
        Game.drawStatus()
        Place.drawMap()
        Story.drawHistory()
      catch e
        console.log e
        error = $ '<tr class="import-error danger"><td colspan="3">That doesn\'t seem to be a valid save file.</td></tr>'
        $(@).parent().parent().after(error)
        error.css('opacity', 0).animate({opacity: 1}, 1000)
        error.animate {opacity: 0}, 2500
      return

    reader.readAsText file

  $('#stories button').click ->
    row = $(@).closest('tr')
    key = row.attr 'game'

    if $(@).html() is 'Delete'
      delete localStorage[key]
      row.remove()
    else if $(@).html() is 'Export'
      name = $(@).parent().prev().prev().html()

      link = $("<a class='btn btn-xs btn-link'>Export</a>")
      link.replaceAll(@)
      link.attr('href', blob)
      link.attr('download', name)
      link.click()
    else
      Game.start jsyaml.safeLoad(localStorage[key])
      Game.drawStatus()
      Place.drawMap()
      Story.drawHistory()
    return false
