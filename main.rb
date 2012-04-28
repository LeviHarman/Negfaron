require './my_methods.rb'
require './my_classes.rb'
require './town.rb'
require './wander.rb'

#ascii art intro
puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" 
puts "Welcome to...."
puts "
#     #                                                  
##    # ######  ####  ######   ##   #####   ####  #    # 
# #   # #      #    # #       #  #  #    # #    # ##   # 
#  #  # #####  #      #####  #    # #    # #    # # #  # 
#   # # #      #  ### #      ###### #####  #    # #  # # 
#    ## #      #    # #      #    # #   #  #    # #   ## 
#     # ######  ####  #      #    # #    #  ####  #    # 

"
puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
gets.chomp

#weapons initialize order is -- name, hitdie, number_rolls, price
fist = Weapon.new('fist', 'd3', 1, 0)

# heros initialize order is -- name, creaturetype, maxhp, hp, damagedie, str, dex, con, inte, wis, cha, level,  weapon, gold, experience, exp_this_level, exp_to_next_level
hero = Hero.new('Tim', nil, 4, 4, 'd1', 1, 1, 1, 1, 1, 1, 1, fist, 10_000, 0, 0, 1_000)

# monsters initialize order is --- name, creaturetype, maxhp, hp, damagedie, xpv
monster = Monster.new(1, 2, 3, 4, 5, 6)

#select heros name
loop do
  puts "What is thy name?"
  hero.name = gets.chomp
  puts "Is #{hero.name} the correct name? yes/no"
  correct = gets.chomp
  if correct == 'yes'
    puts "Welcome #{hero.name}, to the land of Negfaron"
    gets.chomp
    break
  end
end

#rolls for hero stats
loop do
  @str = newstatroll
  @dex = newstatroll
  @con = newstatroll
  @inte = newstatroll
  @wis = newstatroll
  @cha = newstatroll
  
  puts "Your stats are:"
  puts "Strength = #{@str} - Important for physical damage, and melee accuracy."
  puts "Dexterity = #{@dex} - Important for ranged accuracy, and armor class."
  puts "Constitution = #{@con} - Important for hit points, and poison saves."
  puts "Intelligence = #{@inte} - Important for magic."
  puts "Wisdom = #{@wis} - Important for healing."
  puts "Charisma = #{@cha} - Important for prices and dealing with people."
  puts 
  puts "Your modifiers are:"
  puts "Strength modifier = #{modifier(@str)} - Modifies damage"
  puts "Dexterity modifier = #{modifier(@dex)} - Modifies ranged accuracy"
  puts "Constitution modifier = #{modifier(@con)} - Modifies hit points"
  puts "Intelligence modifier = #{modifier(@inte)} - Modifies mana and number of spells"
  puts "Wisdom modifier = #{modifier(@wis)} - Modifies healing"
  puts "Charisma modifier = #{modifier(@cha)} - Modifies social things."
  print
  puts "Would you like to roll again?"

  reroll = gets.chomp
  
  if reroll == 'no'
      @hp = 10 + modifier(@con)
      @maxhp = 10 + modifier(@con)
      puts "Your hp is #{@maxhp}"
      break
  end
  
end

#choose race
loop do
  puts "Which race would you like to choose?"
  puts "Human - No bonus or penalty. The well rounded race."
  puts "Dwarf - Bonus Constitution, and Penalty to Charisma. Short sturdy Dwarves are tough but they are hard to get along with."
  puts "Elf - Bonus Dexterity, and penalty to Constitution. The frail woodland elves prefer the bow."
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
while hero.alive?
  hero = useractions(hero, monster)
end

#message at death
puts "Omae ha mo shindeiru. You are already dead."