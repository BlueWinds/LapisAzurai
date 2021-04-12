/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
import $ from 'jquery';
import people, {aliases} from 'content/people';

import Person from 'game/Person';
import {showOverview} from 'gui/place';

export var quote = function(ignore, name, text){
  if (!people[name]) { name = aliases[name]; }
  return `<q class=${name}>${text}</q>`;
};

export var drawOverview = function() {
  $('#overview .people').empty();
  return updateOverview();
};

export var updateOverview = function() {
  const p = $('#overview .people');
  for (let person in g.people) {
    const oldDiv = p.find(`[person=${person}]`);
    const newDiv = $(draw(person));
    // If the svg is already present, replacing it would cause an annoying flicker for the player. Instead we take the messier route of updating everything around it.
    if (oldDiv.length) {
      oldDiv.find('.picks').replaceWith(newDiv.find('.picks'));
      oldDiv.find('.description').replaceWith(newDiv.find('.description'));

      // Redraw the skill box, if there is one
      const skill = $(`.skill[p=${person}]`).attr('skill');
      if (skill) {
        $(`[skill=${skill}]`).replaceWith(drawSkill(person, skill));
      }
    } else {
      activateSVG(newDiv.find('svg'));
      newDiv.mouseenter(function() {
        const newDivPerson = this.attributes.person.value;
        p.find(`.skill[p!=${newDivPerson}]`).remove();
        return p.find(`.person[person!=${newDivPerson}] svg`).each(function() {
          return $(this.contentDocument).find('.active').removeClass('active');
        });
      });
      p.append(newDiv);
    }
  }
};

var draw = function(person){
  const {
    xp
  } = g.people[person];
  const level = Person.level(xp);
  const needed = Person.xpNeeded(level + 1);
  const skillPoints = Person.skillPoints(person);

  const s = skillPoints === 1 ? '' : 's';

  return `<div person="${person}" class="person">
  <img src="${people[person].img}">
  <div>
    <div class="name">${people[person].name}</div>
    <div class="description">${needed - xp}xp needed for next skill</div>
  </div>
  <div class="picks ${skillPoints > 0 ? 'active' : ''}">${skillPoints} skill${s} available</div>
  ${people[person].svg}
</div>`;
};

var activateSVG = function(svg){
  let skill;
  const personElement = $(svg).parent();
  const person = personElement.attr('person');
  const p = $('#overview .people');
  // 1 = aura
  // 2 = fill
  // 3 = outline

  $('g circle:nth-child(2)', svg).css('display', 'none');
  for (skill in g.people[person].skills) {
    $(`#${skill} circle:nth-child(2)`, svg).css('display', 'initial');
  }

  $('g', svg).on('click', function() {
    p.find('svg').each(function() {
      return $(this).find('.active').removeClass('active');
    });
    $(this).addClass('active');

    p.find(`.skill[p=${person}]`).remove();
    return personElement.after(drawSkill(person, this.id));
  });

  return $('g', svg).hover(function() {
    p.find(`.skill.mouse-over[p=${person}]`).remove();
    skill = $(drawSkill(person, this.id)).addClass('mouse-over');
    return personElement.after(skill);
  }
  , function() {
    if (p.find(`.skill[p=${person}]`).length > 1) {
      return p.find(`.skill.mouse-over[p=${person}]`).remove();
    }
  });
};

var drawSkill = function(person, skill){
  const data = people[person].skills[skill];
  const selected = g.people[person].skills[skill];

  const selectButton = selected ?
    ''
  : Person.unmetRequirements(person, skill) ?
    `<button disabled>Requires ${Person.unmetRequirements(person, skill)}</button>`
  : Person.skillPoints(person) <= 0 ?
    '<button disabled>No skills available</button>'
  :
    `<button onclick='clickSkill("${person}", "${skill}")'>Select skill</button>`;

  return `<div class="skill" skill=${skill} p="${person}">
  <div class="name">${data.name || skill}</div>
  ${selectButton}
  <p>${data.description}</p>
</div>`;
};

window.clickSkill = function(person, skill){
  g.people[person].skills[skill] = true;
  showOverview();

  // Mark the skill as selected
  const svg = $(`[person=${person}] svg`)[0].contentDocument;
  $(`#${skill} circle:nth-child(2)`, svg).css('display', 'initial');

  // Redraw the skill box
  $(`[skill=${skill}`).replaceWith(drawSkill(person, skill));

  // Update available skill count
  const newDiv = $(draw(person));
  return $(`[person=${person}] .picks`).replaceWith(newDiv.find('.picks'));
};
