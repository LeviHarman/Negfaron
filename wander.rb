def wander(hero, monster)
  rand_monster = rand(5) + 1
    case rand_monster
      when 1
        monster = regeneratefrog(monster)
      when 2
        monster = regeneraterat(monster)
      when 3
        monster = regeneraterabbit(monster)
      when 4
        monster = regeneratesnake(monster)
      when 5
        monster = regeneratekobold(monster)
    end
  puts "You have encountered a #{monster.name}"
  
  while monster.alive?
    puts "Would you like to attack or escape?"
    attacking = gets.chomp
    case attacking
      when 'attack'
        monster.hp -= hero.herodamage
        puts "you charge at #{monster.name} and deal #{hero.herodamage} damage"
          if monster.hp < 0 then
            monster.hp = 0
          end
        puts "#{monster.name} has #{monster.hp} remaining."
        puts "#{monster.name} counterattacks"
        hero.hp -= monster.damagedie
          if hero.hp <= 0 then
            hero.hp = 0
            puts "#{hero.name} has #{hero.hp} remaining"
            break
          end
        puts "#{hero.name} has #{hero.hp} remaining"
      when 'escape'
        puts "You leave the #{monster.name} in peace"
        break
    end
  end
  
  if monster.hp <= 0
    puts "You slaughter #{monster.name}"
    hero.experience += monster.xpv
    hero.exp_this_level += monster.xpv
    puts "You gain #{monster.xpv} experience. Your total experience is: #{hero.experience}"
    puts "You have #{hero.hp}/#{hero.maxhp} left."
    
    if hero.exp_this_level >= hero.exp_to_next_level
      hero.levelhero
      
      puts "######################################"
      puts "Congratulations you have achieved level #{hero.level}."
      puts "Your max hp is now #{hero.maxhp} hp "
      puts "######################################"
    end
  end
  return hero
end