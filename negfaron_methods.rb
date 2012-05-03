def newstatroll
  statroll = Array.new(4){die(6)} #rolls 4 virtual d6.
  statrolls = statroll[0]+statroll[1]+statroll[2]+statroll[3]-statroll.min #adds the three highest rolls and it equals the str etc. Repeated for all 6 stats.
  return statrolls
end

def die(a_die) #rolls a die. Number of sides depend on the value chosen by program.
  roll = rand(a_die) + 1
  return roll
end

#commands
def useractions(hero, monster)
  action = gets.chomp
  case action
    when ''
      puts #new blankline when user hits enter
      
    when 'walk'
      puts
      puts "monster object"
      p monster
      puts
      puts "hero object"
      p hero
      puts "marshal_array"
      p hero.stored_data
       
    when 'save'
      puts "What do you want to name the save file?"
      save = gets.chomp
      File.open("#{save}", 'w') {|f| f.write(Marshal.dump(hero)) }
      puts "Game successfully saved!"
      
    when 'town'
      gototown(hero)
      
    when 'heal'
      hero.heal
      puts "You chant to your god and your wounds begin to heal"
      puts hero.hp
      
    when 'end'
      puts "Are you sure you want to end Negfaron? 'yes/no'"
      choice = gets.chomp
      if choice == 'yes'
        Process.exit 
      end
      
    when 'wander'
      wander(hero, monster)
      
    when 'help'
      puts "COMMANDS - help, stats, town, end, wander, heal"
      
    when 'stats'
      hero_stats(hero)
      
    else
      puts
      puts "Type 'help' for list of commands"
  end
  return hero
end

#shop for weapons
def weaponpurchase(hero, weapon)
  puts "That will be #{weapon.price} gold. Do you still want to buy it? yes/no"
  answer = gets.chomp
  if answer == 'yes' then
    if hero.gold > weapon.price
      hero.gold -= weapon.price
      puts "Here is your #{weapon}."
      hero.weapon = weapon
    else
      puts "You don't have enough money."
    end
  end
  return hero
end

def hero_stats(hero)
  puts "Name:           = #{hero.name}"
  puts "Race:           = #{hero.creaturetype.capitalize}"
  puts "Strength:       = #{hero.str}, modifier: #{hero.modifier(hero.str)}"
  puts "Dexterity:      = #{hero.dex}, modifier: #{hero.modifier(hero.dex)}"
  puts "Constitution:   = #{hero.con}, modifier: #{hero.modifier(hero.con)}"
  puts "Intelligence:   = #{hero.inte}, modifier: #{hero.modifier(hero.inte)}"
  puts "Wisdom:         = #{hero.wis}, modifier: #{hero.modifier(hero.wis)}"
  puts "Charisma:       = #{hero.cha}, modifier: #{hero.modifier(hero.cha)}"
  puts "Hitpoints:      = #{hero.hp}/#{hero.maxhp}"
  puts "Gold:           = #{hero.gold}"
  puts "Weapon:         = #{hero.weapon.name.capitalize}"
  puts "Total Xp:       = #{hero.experience}"
  puts "XP this lvl:    = #{hero.exp_this_level}"
  puts "XP to next lvl: = #{hero.exp_to_next_level}"
end

def begin_game
  # heros initialize order is -- name, creaturetype, maxhp, hp, str, dex, con, inte, wis, cha, level,  weapon, gold, experience, exp_this_level, exp_to_next_level
  fist = Weapon.new('fist', 3, 1, 0, 0)
  hero = Hero.new(nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 1, fist, 35, 0, 0, 1_000)

  loop do
    puts "For new game type 'new'"
    puts "To continue a saved game type 'load'"
    
    game_choice = gets.chomp
    game_choice.downcase
    if game_choice == 'load'
      load_game(hero)
    elsif game_choice == 'new'
      break
    end
  end
end

def load_game(hero)
  loop do
    puts "What is the name of your save file?"
    file_name = gets.chomp
    
    if File.exist?("#{file_name}")  
      fist = Weapon.new('fist', 3, 1, 0, 0)
      hero = Marshal.load(File.read("./saveGames/#{file_name}"))
      start_gameplay(hero)
    else
      hero = nil
    end
    
    if hero == nil
      puts "File doesnt exist"
      puts "Would you like to retype filename? 'yes/no'"
      answer = gets.chomp
        
      if answer == 'yes'
        puts
      elsif answer == 'no'
        break
      else
        puts "Type yes or no."
      end
    end
  end
end

def start_gameplay(hero)
  monster = Monster.new(nil, nil, nil, nil, nil, nil, nil)
  puts
  puts "Type 'help' for commands list."
  puts
  
  while hero.alive?
    hero = useractions(hero, monster)
  end
  
  #message at death
  puts
  puts "Omae ha mo shindeiru. You are already dead."
end

#Following regenerate the monsters.
#Initialize order is --- name, creaturetype, maxhp, hp, damagedie, xpv
def regeneratekobold(kobold)
  kobold.name = 'Kobold'
  kobold.creaturetype = 'Kobold'
  kobold.hp = 20
  kobold.maxhp = 20
  kobold.xpv = 200
  kobold.damagedie = (die(4)) +1
  kobold.goldv = 4
  return kobold
end

def regeneratesnake(snake)
  snake.name = 'Snake'
  snake.creaturetype = 'Snake'
  snake.hp = 10
  snake.maxhp = 10
  snake.xpv = 100
  snake.damagedie = die(4)
  snake.goldv = 2
  return snake
end

def regeneraterabbit(rabbit)
  rabbit.name = 'Rabbit'
  rabbit.creaturetype = 'Rabbit'
  rabbit.hp = 10
  rabbit.maxhp = 10
  rabbit.xpv = 75
  rabbit.damagedie = die(2)
  rabbit.goldv = 1
  return rabbit
end

def regeneraterat(rat)
  rat.name = 'Rat'
  rat.creaturetype = 'Rat'
  rat.hp = 5
  rat.maxhp = 5
  rat.xpv = 50
  rat.damagedie = die(2)
  rat.goldv = 1
  return rat
end

def regeneratefrog(frog)
  frog.name = 'Frog'
  frog.creaturetype = 'frog'
  frog.hp = 5
  frog.maxhp = 5
  frog.xpv = 95
  frog.damagedie = die(3)
  frog.goldv = 4
  return frog
end
#end of monster regenerations