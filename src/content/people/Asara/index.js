export {default as Angry} from './Angry.png';
export {default as Crying} from './Crying.png';
export {default as Embarrassed} from './Embarrassed.png';
export {default as Grinning} from './Grinning.png';
import Normal from './Normal.png';
export {Normal};
export {default as NormalFull} from './NormalFull.png';
export {default as Sad} from './Sad.png';
export {default as Scared} from './Scared.png';

import svg from './skills.svg';

export default ({
  name: 'Asara',
  img: Normal,
  svg,
  skills: {
    Tears: {
      description: 'Nothing. Emptyness.'
    },
    Fear: {
      description: "Double the benefit of all of Natalie's 1st tier skills",
      requiresAnd: ['Tears']
    },
    Regret: {
      description: "Double the benefits of all of Kat's 1st tier skills",
      requiresAnd: ['Fear']
    },
    Desert: {
      name: 'The Desert',
      description: 'Nothing. Sand.',
      requiresAnd: ['Regret']
    },

    Duty: {
      description: "Double the benefits of all of James' 1st tier skills",
      requiresAnd: ['Desert']
    },
    Trust: {
      description: "Double the benefit of all of Natalie's 2nd tier skills",
      requiresAnd: ['Duty']
    },
    Moon: {
      name: 'The Moon',
      description: 'Nothing. Silver Light.',
      requiresAnd: ['Trust']
    },

    Death: {
      description: "Double the benefits of all of Kat's 2nd tier skills",
      requiresAnd: ['Moon']
    },
    Power: {
      description: "Double the benefits of all of James' 2nd tier skills",
      requiresAnd: ['Death']
    },
    Goddess: {
      name: 'The Goddess',
      description: 'Nothing and no one.',
      requiresAnd: ['Power']
    },

    Love: {
      description: "Double the benefits of all of Natalie's 3rd tier skills",
      requiresAnd: ['Goddess']
    },
    Desire: {
      description: "Double the benefits of all of Kat's 3rd tier skills",
      requiresAnd: ['Love']
    },
    Devotion: {
      description: "Double the benefits of all of James' 3rd tier skills",
      requiresAnd: ['Desire']
    }
  }
});
