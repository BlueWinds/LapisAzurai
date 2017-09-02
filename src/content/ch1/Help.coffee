queue = []

help = (selector, text)->
  if $('.help').length
    queue.push([selector, text])
    return

  element = $("""<div class='help'>
    <p>#{text}</p>
  </div>""")

  $(selector).parent().append(element)

  targetPos = $(selector).offset()
  targetPos.left += $(selector).outerWidth() / 2 - element.outerWidth() / 2

  bottom = $(selector)[0].getBoundingClientRect().bottom
  if bottom + element.height() + 10 <= $(window).height()
    # There's space beneath the targeted element
    element.addClass('bottom')
    targetPos.top += $(selector).outerHeight() + 10
  else
    # No space, put it up top.
    element.addClass('top')
    targetPos.top -= $(element).outerHeight() + 10

  element.offset(targetPos)
  element.css('opacity', 0).animate({opacity: 1}, 200)
  element.click ->
    element.animate {opacity: 0}, 200, ->
      element.remove()
      next = queue.shift()
      if next then help(next[0], next[1])

clearHelp = ->
  queue = []
  $('.help').remove()

haventSailedYet = -> g.map.from is 'Vailia' and not g.map.to


enterMapHelp = ->
  if g.history.MtJuliaArrive then return

  setTimeout ->
    unless g.history.Ch1?
      help('header', "This is the world map, showing all the places you've discovered so far. Right now there's only one - Vailia, Natalie's home city. Select it to learn more (and click this popup to close it).")
      return

    if haventSailedYet()
      unless g.cargo.length
        help('header .cargo', "Mt. Julia now shows up on the map, but before you set sail you'll want to load some cargo in Vailia. Natalie's ship can carry up to three loads at a time - it's good to carry as much cargo as you can.")
        return

      help('header .cargo', "Now that you've accepted a job, click on Mt. Julia to learn how to set sail.")
  , 100

oldEnterMap = Story.enterMap
Story.enterMap = ->
  oldEnterMap()
  clearHelp()
  enterMapHelp()

oldShowOverview = Place.showOverview
Place.showOverview = (place)->
  oldShowOverview(place)
  clearHelp()

  if g.history.MtJuliaArrive then return
  setTimeout ->

    if g.day is 0
      help('.place .name', "This is the overview for Vailia, Natalie's home city. On the left side you can see information about the location, while the right side has information about your characters. You can click this image to return to the world map at any time.")

      help('.place .description', "We'll explore the characters and their skills later, so for now focus on the left column. Natalie has a separate reputation at each port, representing how well regarded she is at that location.")

      help('.place .description', 'Reputation is increased by delivering cargo, and decreased by calling in favors to repair your ship after a storm. Spend reputation to view events and progress the story.')

      help('[story="AlkeniaRoute"]', 'Most events, such as this one, cost reputation. Events also give the characters involved xp, which they use to unlock their skills.')

      help('[story="Ch1"]', "Certain events block progress until you view them - like \"Chapter 1\", and are outlined in blue. You won't be able to do much else until you click on them.")
      return

    if haventSailedYet()
      if g.history.ReadyToGo and not g.cargo.length
        help('.place .cargo', "Natalie's contacts in a city are always keeping their eyes out for potential cargo. Right now, someone in Vailia is willing to pay Natalie to deliver #{g.availableCargo[0].name} to #{Place[g.availableCargo[0].to].name}.")

        help('.place .cargo', "New jobs show up randomly each day, while old ones eventually expire if you don't accept them. At the start, most of your jobs will involve Vailia, but keep an eye out as you explore more regions - new jobs can show up anywhere.")
        return

      if place is 'MtJulia' and g.cargo.length
        help('.place .travel', "It takes 9 days to travel from Vailia to Mt. Julia. Now that there's nothing blocking you from leaving Vailia (such as mandatory events or a damaged ship), click the ship icon to set sail.")
  , 100

oldHideOverview = Place.hideOverview
Place.hideOverview = (duration)->
  oldHideOverview(duration)
  clearHelp()
  setTimeout ->
    if $('#content').css('display') is 'none'
      enterMapHelp()
  , 0

oldStoryDisplay = Story.display
Story.display = (story, speed)->
  oldStoryDisplay(story, speed)
  clearHelp()
