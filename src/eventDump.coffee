import './EventDump.html'
import 'content/content.css'
import 'gui/game.css'

import $ from 'jquery'
import {render} from 'gui/story'

import * as content from 'content'

window.g = {history: {}, people: {}, day: 100, chapter: 'Ch1'}

$( ->
  index = $('#index').empty()
  w = $('#warnings').empty()
  s = $('#stories').empty()

  drawStory = (story, {label, history, required, where}) ->
    link = '<a href="#' + story + '">' + story + '</a>'

    unless label
      w.append('<li>' + link + ' is missing a label</li>')

    for prereq, value of history when value isnt true and value isnt false
      w.append('<li>' + link + ' has a non-boolean history (' + prereq + ', ' + value + ').</li>')

    if required and not content[required]
      w.append('<li>' + link + "'s Game Over story doesn't exist (" + required + ').</li>')

    sections = render(story)
    sections.each (i)->
      $(@).attr('id', story + i)
      i_link = '<a href="#' + story + i + '">' + story + '[' + i + ']</a>'
      len = $(@).text().length

      if $(@).find('img').length and len < 200
        w.append('<li>' + i_link + ' has an image, but is only ' + len + ' characters long.</li>')

      if len > 2000
        w.append('<li>' + i_link + ' is ' + len + ' characters long, consider breaking it up.</li>')

      $(@).find('img').on('error', ->
        w.prepend('<li>' + i_link + ' wanted invalid image "' + decodeURI(@src.split('content/')[1]) + '"</li>')
      )

    places[where].append('<li>' + link + '</li>')
    s.append('<h1 id="' + story + '">' + label + ' (' + story + ') <a href="#">^</a></h1>')
    s.append(sections)

  places = {}
  for story, data of content when data.text
    unless places[data.where]
      index.append('<h2>' + (data.where or 'Nowhere').split('|').join(' - ') + '</h2>')
      places[data.where] = $('<div></div>').appendTo(index)
    drawStory(story, data)
)
