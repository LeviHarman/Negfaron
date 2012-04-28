#Version 8
#2/12/2012
#restructuring program & debugging
#2/12/2012
#finished restructuring
#seperated program into 14 different .rb files
#file names are  ascii_banner.rb, blankher.rb, creature.rb, dierolls.rb, executetown.rb, hero.rb, main.rb, monsters.rb
#namehero.rb, raceselection.rb, rollinforherostats.rb, useractions.rb, wander.rb, and weapon.rb.
require './Creature.rb'
require './Hero.rb'
require './MyMethods.rb'
require './AsciiBanner.rb'
require './Town1.rb'
require './Wander.rb'
require './UserActions.rb'
require'./Gambler.rb'

ascii_banner

#initialize objects
hero = Hero.new('Tim', 'Goat', 4, 4, 'd1', 1, 1, 1, 1, 1, 1, 1, 'fist', 10_000, 0, 0, 1_000)
# heros initialize list -- name, creaturetype, maxhp, hp, damagedie, str, dex, con, inte, wis, cha, level,  weapon, gold, experience, exp_this_level, exp_to_next_level
monster = Monster.new(1, 2, 3, 4, 5, 6)
fist = Weapon.new('fist', 'd3', 1, 0)

hero.weapon = fist
hero.namehero
hero.pickarace
hero.rollforherostats

while hero.alive?
  hero = useractions(hero, monster)
end

puts "Omae ha mo shindeiru. You are already dead."