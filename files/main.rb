#Version 8
#2/12/2012
#restructuring program & debugging
#2/12/2012
#finished restructuring
#seperated program into 14 different .rb files
#file names are  ascii_banner.rb, blankher.rb, creature.rb, dierolls.rb, executetown.rb, hero.rb, main.rb, monsters.rb
#namehero.rb, raceselection.rb, rollinforherostats.rb, useractions.rb, wander.rb, and weapon.rb.
require './creature.rb'
require './hero.rb'
require './weapon.rb'
require './dierolls.rb'
require './ascii_banner.rb'
require './executetown.rb'
require './wander.rb'
require './useractions.rb'

ascii_banner
hero = Hero.new(1, 1, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22)
blankhero(hero)   #Blank hero and blank weapon
fist = Weapon.new('fist', 'd3', 1, 0)
hero.weapon = fist
hero.namehero
hero.pickarace
hero.rollforherostats

while hero.alive?
  hero = useractions(hero)
end
puts "Omae ha mo shindeiru. You are already dead."