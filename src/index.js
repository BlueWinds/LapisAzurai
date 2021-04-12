/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
import './index.html';
import 'content/Logo.png';
import './README.txt';

import $ from 'jquery';

import {featureDetect} from 'game/util';
import {guiSetup, load} from 'gui/game';


// Tweak this number to speed up (>1) or slow down (<1) all animations in the game
const speedFactor = 1;

const oldAnimate = $.fn.animate;
$.fn.animate = function() {
  let arg = Array.apply(null, arguments);
  arg = arg.map(function(value){
    if (typeof value === 'number') {
      value /= speedFactor;
    } else if (value.duration) { value.duration /= speedFactor; }
    return value;
  });
  return oldAnimate.apply(this, arg);
};

const oldSetTimeout = setTimeout;
window.setTimeout = function(callback, delay){
  const newDelay = (delay / speedFactor) || delay;
  return oldSetTimeout(callback, newDelay);
};

$(function() {
  if (!featureDetect()) { return; }
  if (!$('#container').length) { return; }

  guiSetup();
  return load();
});
