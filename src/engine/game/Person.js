import {wordJoin} from 'game/util';

import people from 'content/people';
import {xpNeededSkill} from 'content/people/skillEffects';

/*
const samplePerson = {
  xp: 100,
  skills: {
    EarToTheGround: true
  }
};

const sampleData = {
  name: 'Natalie',
  skills: {
    EarToTheGround: {
      label: 'Ear to the ground',
      description: 'Add a new cargo immediately wherever you deliver one'
    },
    Gregarious: {
      description: '+1 reputation wherever you deliver cargo',
      // Only one of requiresOr or requiresAnd should be present.
      requiresOr: ['EarToTheGround'],
      requiresAnd: ['EarToTheGround']
    }
  },

  quoteColor: '#8CDAFF'
};
*/

var Person = {
  xpNeeded(level){ return Math.round((Math.pow(level, 1.5) * 3) + xpNeededSkill()); },

  level(xp){
    let l = 0;
    while (Person.xpNeeded(l + 1) <= xp) {
      l++;
    }
    return l;
  },

  skillPoints(person){
    const level = Person.level(g.people[person].xp);
    return level - Object.keys(g.people[person].skills).length;
  },

  unmetRequirements(person, skill){
    const {
      skills
    } = g.people[person];
    const data = people[person].skills[skill];

    const unmetAnd = (data.requiresAnd || []).filter(s => !skills[s]);
    if (unmetAnd.length) {
      return wordJoin(unmetAnd.map(s => people[person].skills[s].name || s));
    }

    if (data.requiresOr && !data.requiresOr.some(s => skills[s])) {
      return wordJoin(data.requiresOr.map(s => people[person].skills[s].name || s), 'or');
    }

    return '';
  }
};

export default Person;
