queue = []

help = (selector, text)->
  unless g.showHelp then return
  if $('.help').length
    queue.push([selector, text])
    return

  element = $("""<div class='help'>
    <p>#{text}</p>
  </div>""")

  target = $(selector).first()
  target.parent().append(element)

  targetPos = target.offset()
  unless targetPos
    console.error selector, ' not found to point help towards'
    return
  targetPos.left += target.outerWidth() / 2 - element.outerWidth() / 2

  bottom = target[0].getBoundingClientRect().bottom
  if bottom + element.height() + 10 <= $(window).height()
    # There's space beneath the targeted element
    element.addClass('bottom')
    targetPos.top += target.outerHeight() + 10
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
    return false

clearHelp = ->
  queue = []
  $('.help').remove()

haventSailedYet = -> g.map.from is 'Vailia' and not g.map.to and not g.history.MtJuliaArrive

# During tutorial, don't let them sail until they've accepted cargo
oldCanSail = Story.canSail
Story.canSail = ->
  if g.day is 1 then return false
  return oldCanSail()

enterMapHelp = ->
  if Story.gameIsOver() then return
  if g.history.MtJuliaArrive then return

  setTimeout ->
    unless g.history.Ch1?
      help('header', "This is the world map, showing all the places you've discovered so far. Right now there's only one - Vailia, Natalie's home city. Select it to learn more (and click this popup to close it).")
      return

    if haventSailedYet()
      unless g.cargo.length
        help('header', "Mt. Julia now shows up on the map, but before you set sail you'll need to find some cargo. This isn't normally required, but it's usually a good idea.")
        return

      help('header', 'An orange number next to a location means a required event is available there, while black means an optional event')
  , 100

oldEnterMap = Story.enterMap
Story.enterMap = ->
  oldEnterMap()
  clearHelp()
  enterMapHelp()

oldShowOverview = Place.showOverview
Place.showOverview = (place = $('.place').attr('place') or g.map.from, duration)->
  oldShowOverview(place, duration)
  clearHelp()

  setTimeout ->
    if g.map.from is 'MtJulia' and g.history.MtJuliaArrive is g.day - 1 and place is 'MtJulia'
      help('.cargoSearch', "Natalie's chance of finding cargo is slim at Mt. Julia at the best of times, and it's even worse right now. The chance of finding work is halved if you don't have any reputation to spend.")

      help('.cargoSearch', "Chances accumulate though - her odds will grow better the longer she keeps searching until she finds something, so after delivering your cargo, it's probably worth spending a few days looking before you head back to Vailia.")

      return

    if skillHelp() then return

    if g.day is 0
      help('.place .name', "This is the overview for Vailia, Natalie's home city. On the left side you can see information about the location, while the right side has information about your characters. You can click this image to return to the world map at any time.")

      help('.place .description', 'Natalie has a separate reputation at each port, representing how well regarded she is at that location. You spend reputation to view events and progress the story, as well as to repair damage and search the city for jobs.')

      help('[story="Ch1"]', "Certain events block progress until you view them - like \"Chapter 1\". You won't be able to take most other actions until you view on them.")
      return

    if firstVailiaHelp(place) then return

    if g.day is g.history.FirstStormSick2 + 1 and place is 'Vailia'
      help('.required', "Pay particular attention to events with orange borders, which advance the main plot. If you don't explore them before they expire, you'll be treated to the game over screen.")

      help('.repair', "The Lapis Azurai is damaged, and you won't be able to set sail until it's repaired. Calling in the necessary favors and purchasing supplies costs reputation (if you have any) as well as time.")
  , 100

skillHelp = ->
  if noSkillSelected()
    if Person.skillPoints('Natalie') is 1
      skillText('Natalie')
      return true
    else if Person.skillPoints('James') is 1
      skillText('James')
      return true

skillText = (person)->
  help('[person="' + person + '"] .description', "#{person} has enough experience to gain a new skill. Characters each have their specialty - James focuses on sailing and storms, while Natalie deals with cargo and reputation.")

firstVailiaHelp = (place)->
  unless haventSailedYet() then return false
  if not g.cargo.length and place is 'Vailia'
    if not g.availableCargo.length
      help('.place .cargoSearch', "Natalie has some contacts in the city, but she doesn't know who actually has cargo that they'll pay her to move. She'll have to make new friends, speak with her old ones, and generally search the city for goods that need to be moved from Vailia to elsewhere.")

      help('.place .cargoSearch .cost', "The chance of finding a job varries by port. Vailia's a busy city, so it'll be easy to find cargo here. With a chance above 100% she's guaranteed to find one job, and has a chance of finding more than one.")
      return true

    c = g.availableCargo[0]
    help('.cargo.accept', "Right now, someone in #{Place[c.from].name} is willing to pay Natalie to deliver #{c.name} to #{Place[c.to].name}. The job will disappear if she doesn't accept it in #{Cargo.acceptTimeRemaining(c)} days.")

    help('.cargo.accept .cost', "If she delivers the cargo before it expires, she'll gain #{c.reputation[0]} reputation at the origin and #{c.reputation[1]} at the destination. Different goods are worth different ammounts - it can sometimes be worthwhile to keep searching even once you have an offer.")

    help('header .cargo', "Natalie's ship can carry up to three loads at a time - it's good to accept as many jobs as you can, if they all share a destination.")
    return true

  if place is 'MtJulia' and g.cargo.length
    help('.delivery.0', "You'll be able to deliver the cargo once you arrive. Don't dawdle too long though - if the delivery expires, the cargo will still take up space in the ship and you won't get any reward when you do deliver it.")

    help('.place .travel', "It takes 9 days to travel from Vailia to Mt. Julia. Now that there's nothing blocking you from leaving Vailia (such as mandatory events or a damaged ship), click the ship icon to set sail.")

    help('[story="MtJuliaArrive"]', "Events expire after some number of days. You won't be ablo to catch every event on a given playthrough. Missing a blue or orange event is bad news - game over.")
    return true

noSkillSelected = -> Object.keys(g.people.Natalie.skills).length is 0 and Object.keys(g.people.James.skills).length is 0

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
