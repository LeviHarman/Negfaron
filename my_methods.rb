def useractions(hero, monster)
  puts "What action would you like to perform?"
  action = gets.chomp
  case action
    when 'walk'
      puts "You are walking man"
      p hero
    when 'town'
      gototown(hero)
    when 'heal'
      hero.heal
      puts "You chant to your god and your wounds begin to heal"
      puts hero.hp
    when 'end'
      Process.exit 
    when 'wander'
      wander(hero, monster)
    when 'help'
      puts "COMMANDS - help, walk, town, end, wander, heal"
  end
  return hero
end

def die(a_die) #rolls a die. Number of sides depend on the value chosen by program.
  roll = rand(a_die) + 1
  return roll
end

#Following regenerate the monsters.
#Initialize order is --- name, creaturetype, maxhp, hp, damagedie, xpv
def regeneratekobold(kobold)
  kobold.rename("Kobold")
  kobold.creaturetype = 'Kobold'
  kobold.hp = 20
  kobold.maxhp = 20
  kobold.xpv = 200
  kobold.damagedie = (die(4)) +1
  return kobold
end

def regeneratesnake(snake)
  snake.name = 'Snake'
  snake.creaturetype = 'Snake'
  snake.hp = 10
  snake.maxhp = 10
  snake.xpv = 100
  snake.damagedie = die(4)
  return snake
end

def regeneraterabbit(rabbit)
  rabbit.name = 'Rabbit'
  rabbit.creaturetype = 'Rabbit'
  rabbit.hp = 10
  rabbit.maxhp = 10
  rabbit.xpv = 75
  rabbit.damagedie = die(2)
  return rabbit
end

def regeneraterat(rat)
  rat.name = 'Rat'
  rat.creaturetype = 'Rat'
  rat.hp = 5
  rat.maxhp = 5
  rat.xpv = 50
  rat.damagedie = die(2)
  return rat
end

def regeneratefrog(frog)
  frog.name = 'Frog'
  frog.creaturetype = 'frog'
  frog.hp = 5
  frog.maxhp = 5
  frog.xpv = 95
  frog.damagedie = die(3)
  return frog
end
#end of monster regenerations

def ascii_banner
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
end

def show_stat_rolls
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
end