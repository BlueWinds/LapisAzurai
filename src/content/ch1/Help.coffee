queue = []

help = (selector, text)->
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
  if g.history.MtJuliaArrive then return

  setTimeout ->
    unless g.history.Ch1?
      help('header', "This is the world map, showing all the places you've discovered so far. Right now there's only one - Vailia, Natalie's home city. Select it to learn more (and click this popup to close it).")
      return

    if haventSailedYet()
      unless g.cargo.length
        help('header', "Mt. Julia now shows up on the map, but before you set sail you'll need to load some cargo. This isn't normally required, but it's a good idea.")
        return

      help('header', "If there is more cargo available in Vailia, you may want to load that as well. When you're ready to set sail, click on Mt. Julia.")
  , 100

oldEnterMap = Story.enterMap
Story.enterMap = ->
  oldEnterMap()
  clearHelp()
  enterMapHelp()

skillHelp = (person)->
  help('[person="' + person + '"] .description', "#{person} has enough experience to gain a new skill. Different characters focus on different sorts of bonuses - James deals mostly with sailing and storms, while Natalie increases the amount of cargo available and how much reputation you get from it.")

  help('[person="' + person + '"] object', "You'll need certain skills to unlock events as the game goes forward - Natalie's 'Initiate', for example, is required before you can enter Chapter 2.")

oldShowOverview = Place.showOverview
Place.showOverview = (place)->
  oldShowOverview(place)
  clearHelp()

  setTimeout ->
    if g.map.from is 'MtJulia' and g.history.MtJuliaArrive is g.day - 1 and place is 'MtJulia'
      help('.delivery', "When you deliver cargo (and the deadline hasn't expired), you'll gain reputation at the origin and the distination.")

      help('[story="CheckShip"]', "Most events in the game expire after some number of days. It's not possible to see every event on a given playthrough - not only will some expire, but at the end of Chapter 3 you'll have to choose one of three story routes.")

      return

    if Object.keys(g.people.Natalie.skills).length is 0 and Object.keys(g.people.James.skills).length is 0
      if Person.skillPoints('Natalie') is 1 then return skillHelp('Natalie')
      else if Person.skillPoints('James') is 1 then return skillHelp('James')

    if g.day is 0
      help('.place .name', "This is the overview for Vailia, Natalie's home city. On the left side you can see information about the location, while the right side has information about your characters. You can click this image to return to the world map at any time.")

      help('.place .description', "We'll explore the characters and their skills later, so for now focus on the left column. Natalie has a separate reputation at each port, representing how well regarded she is at that location.")

      help('.place .description', 'Reputation is increased by delivering cargo, and decreased by calling in favors to repair your ship after a storm. Spend reputation to view events and progress the story.')

      help('[story="AlkeniaRoute"]', 'Most events cost reputation. Events also give the characters involved xp, which they use to unlock their skills.')

      help('[story="Ch1"]', "Certain events block progress until you view them - like \"Chapter 1\", and are outlined in blue. You won't be able to do much else until you click on them.")
      return

    if haventSailedYet()
      if not g.cargo.length and place is 'Vailia'
        help('.place .cargo', "Natalie's contacts in a city are always keeping their eyes out for potential cargo. Right now, someone in Vailia is willing to pay Natalie to deliver #{g.availableCargo[0].name} to #{Place[g.availableCargo[0].to].name}.")

        help('.place .cargo', "New jobs show up randomly each day, while old ones expire if you don't accept them. At the start, most of your jobs will start at Vailia, but keep an eye out as you explore more regions - new cargo can show up anywhere.")

        help('header .cargo', "Natalie's ship can carry up to three loads at a time - it's good to accept as many jobs as you can, if they all share a destination.")
        return

      if place is 'MtJulia' and g.cargo.length
        help('.deliver', "Once you arrive at Mt. Julia, you'll be able to deliver the cargo you've taken aboard. Don't dawdle too long though - if the delivery expires, the cargo will still take up space in the ship and you won't get any reward when you do deliver it.")

        help('.place .travel', "It takes 9 days to travel from Vailia to Mt. Julia. Now that there's nothing blocking you from leaving Vailia (such as mandatory events or a damaged ship), click the ship icon to set sail.")
        return
    if g.day is g.history.FirstStormSick2 + 1 and place is 'Vailia'
      help('.required', "Pay particular attention to events with orange borders, which advance the main plot. If you don't unlock them before they expire, you'll be treated to the game over screen.")

      help('.required', "It can be worth delaying on them in order to pursue side-quests, though, since unlocking one event starts the countdown on the next one - plan ahead!")

      help('.repair', "The Lapis Azurai is damaged, and you won't be able to set sail until it's repaired. Calling in the necessary favors and purchasing supplies costs reputation (if you have any) as well as time.")
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
