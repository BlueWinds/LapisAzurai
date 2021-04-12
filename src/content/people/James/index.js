export {default as Angry} from './Angry.png';
export {default as Embarrassed} from './Embarrassed.png';
export {default as Excited} from './Excited.png';
import Normal from './Normal.png';
export {Normal};
export {default as Upset} from './Upset.png';
import svg from './skills.svg';

export default ({
  name: 'James',
  img: Normal,
  svg,
  skills: {
    Reliable: {
      description: 'Repair the ship 25% faster',
      doubledBy: 'Duty'
    },
    Trustworthy: {
      description: '+5 days to deliver cargo',
      doubledBy: 'Duty'
    },
    Stoic: {
      description: 'Storms average half a day shorter',
      requiresOr: ['Reliable', 'WeatherEye'],
      doubledBy: 'Duty'
    },
    WeatherEye: {
      name: 'Weather Eye',
      description: '+5 minimum days between storms',
      requiresOr: ['Trustworthy', 'Stoic'],
      doubledBy: 'Duty'
    },
    Apprentice: {
      description: '50% chance repairing the ship costs no reputation',
      doubledBy: 'Duty',
      requiresAnd: ['Reliable', 'Trustworthy']
    },

    Reliable2: {
      name: 'Reliable 2',
      description: 'Repair the ship 25% faster',
      requiresOr: ['Stoic', 'Trustworthy2'],
      doubledBy: 'Power'
    },
    Trustworthy2: {
      name: 'Trustworthy 2',
      description: '+5 days to deliver cargo',
      requiresOr: ['WeatherEye', 'Reliable2'],
      doubledBy: 'Power'
    },
    Organized: {
      description: '+5 days to accept cargo',
      requiresOr: ['Trustworthy2', 'Navigator'],
      doubledBy: 'Power'
    },
    Navigator: {
      description: '+10% sail speed',
      requiresOr: ['Reliable2', 'Organized'],
      doubledBy: 'Power'
    },
    Journeyman: {
      description: '+1 cargo capacity',
      requiresAnd: ['Reliable2', 'Trustworthy2']
    },

    WeatherEye2: {
      name: 'Weather Eye 2',
      description: '+5 minimum days between storms',
      requiresOr: ['Organized', 'Stoic2'],
      doubledBy: 'Devotion'
    },
    Stoic2: {
      name: 'Stoic 2',
      description: 'Storms average half a day shorter',
      requiresOr: ['Navigator', 'WeatherEye2'],
      doubledBy: 'Devotion'
    },
    Organized2: {
      name: 'Organized 2',
      description: '+5 days to accept cargo',
      requiresOr: ['WeatherEye2', 'Navigator2'],
      doubledBy: 'Devotion'
    },
    Navigator2: {
      name: 'Navigator 2',
      description: '+10% sail speed',
      requiresOr: ['Stoic2', 'Organized2'],
      doubledBy: 'Devotion'
    },
    Master: {
      description: '+1 Cargo Capacity',
      requiresAnd: ['Stoic2', 'WeatherEye2']
    }
  }
});
