def newstatroll
  statroll = Array.new(4){die(6)} #rolls 4 virtual d6.
  statrolls = statroll[0]+statroll[1]+statroll[2]+statroll[3]-statroll.min #adds the three highest rolls and it equals the str etc. Repeated for all 6 stats.
  return statrolls
end

#shop for weapons
def weaponpurchase(hero, weapon)
  puts "That will be #{weapon.price} gold. Do you still want to buy it? yes/no"
  answer = gets.chomp
  if answer == 'yes' then
    if hero.gold > weapon.price
      hero.gold -= weapon.price
      puts "Here is your fine sword."
      hero.weapon = weapon
    else
      puts "You don't have enough money."
    end
  end
  return hero
end
        
#commands
def useractions(hero, monster)
  puts "What shall you do next?"
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
  kobold.name = 'Kobold'
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