require './my_methods.rb'
require './my_classes.rb'
require './town.rb'
require './wander.rb'

ascii_banner

fist = Weapon.new('fist', 'd3', 1, 0)
#weapons initialize order is -- name, hitdie, number_rolls, price

hero = Hero.new('Tim', 'Goat', 4, 4, 'd1', 1, 1, 1, 1, 1, 1, 1, fist, 10_000, 0, 0, 1_000)
# heros initialize order is -- name, creaturetype, maxhp, hp, damagedie, str, dex, con, inte, wis, cha, level,  weapon, gold, experience, exp_this_level, exp_to_next_level

monster = Monster.new(1, 2, 3, 4, 5, 6)
# monsters initialize order is --- name, creaturetype, maxhp, hp, damagedie, xpv

hero.namehero
hero.pickarace
hero.rollforherostats

while hero.alive?
  hero = useractions(hero, monster)
end

puts "Omae ha mo shindeiru. You are already dead."