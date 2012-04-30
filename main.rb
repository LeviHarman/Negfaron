require './negfaron_methods.rb'
require './negfaron_classes.rb'
require './town.rb'
require './wander.rb'

#ascii art intro
puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" 
puts "Welcome to....                                           @"
puts "                                                         @"
puts "#     #                                                  @"
puts "##    # ######  ####  ######   ##   #####   ####  #    # @"
puts "# #   # #      #    # #       #  #  #    # #    # ##   # @"
puts "#  #  # #####  #      #####  #    # #    # #    # # #  # @"
puts "#   # # #      #  ### #      ###### #####  #    # #  # # @"
puts "#    ## #      #    # #      #    # #   #  #    # #   ## @"
puts "#     # ######  ####  #      #    # #    #  ####  #    # @"
puts "                                                         @"
puts "                                                         @"
puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
gets

begin_game

fist = Weapon.new('fist', 3, 1, 0, 0)
hero = Hero.new(nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 1, fist, 35, 0, 0, 1_000)

#select heros name
loop do
  puts "What is thy name?"
  hero.name = gets.chomp
  puts "Is #{hero.name} the correct name? 'yes/no'"
  correct = gets.chomp
  if correct == 'yes'
    puts "Welcome #{hero.name}, to the land of Negfaron"
    gets.chomp
    break
  end
end

#rolls for hero stats
loop do
  hero.str = newstatroll
  hero.dex = newstatroll
  hero.con = newstatroll
  hero.inte = newstatroll
  hero.wis = newstatroll
  hero.cha = newstatroll
  
  puts "Your stats are:"
  puts "Strength:     #{hero.str}, modifier: #{hero.modifier(hero.str)} - Physical damage, and melee accuracy."
  puts "Dexterity:    #{hero.dex}, modifier: #{hero.modifier(hero.dex)} - Ranged accuracy, and armor class."
  puts "Constitution: #{hero.con}, modifier: #{hero.modifier(hero.con)} - Hit points, and poison saves."
  puts "Intelligence: #{hero.inte}, modifier: #{hero.modifier(hero.inte)} - Magic."
  puts "Wisdom:       #{hero.wis}, modifier: #{hero.modifier(hero.wis)} - Healing."
  puts "Charisma:     #{hero.cha}, modifier: #{hero.modifier(hero.cha)} - Prices and dealing with people."
  puts
  puts "Type 'keep'  to keep the role. 'Press Enter' to reroll."

  reroll = gets.chomp
  
  if reroll == 'keep'
    hero.hp = 10 + hero.modifier(hero.con)
    hero.maxhp = 10 + hero.modifier(hero.con)
    puts "Your hp is #{hero.maxhp}"
    break
  end
  
end

#choose race
loop do

  puts "Which race would you like to choose?"
  puts "Human - +0    , +0     The well rounded race."
  puts "Dwarf - +2 Con, -2 Cha A short and sturdy race."
  puts "Elf   - +2 Dex, -2 Con A frail race. "
  
  raceselection = gets.chomp
  raceselection = raceselection.downcase
  
  case raceselection
  when 'human'
    hero.creaturetype = "human"
    break
  when 'dwarf'
    hero.creaturetype = "dwarf"
    hero.con += 2
    hero.cha -= 2
    break
  when 'elf'
    hero.creaturetype = "elf"
    hero.con -= 2
    hero.dex += 2
    break
  else
    puts "Please enter a valid Race."
  end 
end

#play game until hero dies
start_gameplay(hero)