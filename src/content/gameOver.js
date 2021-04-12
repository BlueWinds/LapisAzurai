/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
import {gameIsOver} from 'game/Story';
import * as places from 'content/places';

export var GameOverExploration = {
  label: 'Game Over',
  text() {
    return `\
||
  <center>"We can't be afraid of change. You may feel very secure in the pond that you are in, but if you never venture out of it, you will never know that there is such a thing as an ocean, a sea. Holding onto something that is good for you now, may be the very reason why you don't have something better."</center>

  <center>- C. JoyBell C.</center>

  ${gameOverText()}\
`;
  },
};

export var GameOverPower = {
  label: 'Game Over',
  text() {
    return `\
||
  <center>"Be not the slave of your own past - plunge into the sublime seas, dive deep, and swim far, so you shall come back with new self-respect, with new power, and with an advanced experience that shall explain and overlook the old."</center>

  <center>- Ralph Waldo Emerson</center>

  ${gameOverText()}\
`;
  },
};

export var GameOverFun = {
  label: 'Game Over',
  text() {
    return `\
||
  <center>"That does it," said Jace. "I'm going to get you a dictionary for Christmas this year."</center>
  <center>"Why?" Isabelle said.</center>
  <center>"So you can look up 'fun.' I'm not sure you know what it means.”</center>

  <center>- Cassandra Clare, City of Ashes</center>

  ${gameOverText()}\
`;
  },
};

export var GameOverKindness = {
  label: 'Game Over',
  text() {
    return `\
||
  <center>"Kindness is universal. Sometimes being kind allows others to see the goodness in humanity through you. Always be kinder than necessary."</center>

  <center>- Germany Kent</center>

  ${gameOverText()}\
`;
  },
};

export var GameOverLove = {
  label: 'Game Over',
  text() {
    return `\
||
  <center>"Let yourself be silently drawn by the strange pull of what you really love. It will not lead you astray."</center>

  <center>- Jalaluddin Rumi</center>

  ${gameOverText()}\
`;
  },
};

export var GameOverSadness = {
  label: 'Game Over',
  text() {
    return `\
||
  <center>"She was a genius of sadness, immersing herself in it, separating its numerous strands, appreciating its subtle nuances. She was a prism through which sadness could be divided into its infinite spectrum."</center>

  <center>- Jonathan Safran Foer, Everything Is Illuminated</center>

  ${gameOverText()}\
`;
  },
};

export var GameOverTrust = {
  label: 'Game Over',
  text() {
    return `\
||
  <center>"I'm not upset that you lied to me, I'm upset that from now on I can't believe you."</center>

  <center>- Friedrich Nietzsche</center>

  ${gameOverText()}\
`;
  },
};

export var GameOverViolence = {
  label: 'Game Over',
  text() {
    return `\
||
  <center>"Violence, naked force, has settled more issues in history than has any other factor."</center>

  <center>- Robert A. Heinlein, Starship Troopers</center>

  ${gameOverText()}\
`;
  },
};

export var GameOverSorrow = {
  label: 'Game Over',
  text() {
    return `\
||
  <center>"Some of you say, 'Joy is greater than sorrow,' and others say, 'Nay, sorrow is the greater.'</center>
  <center>But I say unto you, they are inseparable.</center>
  <center>Together they come, and when one sits alone with you at your board, remember that the other is asleep upon your bed."</center>

  <center>- Kahlil Gibran, The Prophet</center>

  ${gameOverText()}\
`;
  },
};

var gameOverText = function () {
  const end = gameIsOver();
  return `\
||-
  <center><i>Time has run out for "<b>${end.label}</b>" at ${
    places[end.where.split('|')[0]].name
  }. Natalie and her friends will carry on, but the story is incomplete...</i></center>
\
`;
};
