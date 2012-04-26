def wander(hero)
  monster = rand(5) + 1
    case monster
      when 1
        frog = Creature.new(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18)
        monster = generatefrog(frog)
      when 2
        rat = Creature.new(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18)
        monster = generaterat(rat)
      when 3
        rabbit =  Creature.new(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18)
        monster = generaterabbit(rabbit)
      when 4
        snake = Creature.new(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18)
        monster = generatesnake(snake)
      when 5
        kobold = Creature.new(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18)
        monster = generatekobold(kobold)
    end
  puts "You have encountered a #{monster.name}"
  
  while monster.alive?
    puts "Would you like to attack or escape?"
    attacking = gets.chomp
      case attacking
        when 'attack'
          damagedealt = hero.herodamage
          monster.hp -= damagedealt
          puts "you charge at #{monster.name} and deal #{damagedealt} damage"
            if monster.hp < 0 then
              monster.hp = 0
            end
          puts "#{monster.name} has #{monster.hp} remaining."
          puts "#{monster.name} counterattacks"
          hero.hp -= monster.damagedie
            if hero.hp < 0 then
              hero.hp = 0
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
      puts "You gain #{monster.xpv} experience. Your total experience is: #{hero.experience}"
      puts "You have #{hero.hp}/#{hero.maxhp} left."
      
      whatlevelishero = hero.level
        case whatlevelishero
          when 1
            if hero.experience >= 1000
              puts "######################################"
              puts "Congratulations you have achieved level 2."
              hero.levelhero
              hero.level = 2
              puts "Your max hp is now #{hero.maxhp} hp "
              puts "######################################"
            end
          when 2
            if hero.experience >= 3000
              puts "######################################"
              puts "Congratulations you have achieved level 3."
              hero.levelhero
              hero.level = 3
              puts "Your max hp is now #{hero.maxhp} hp "
              puts "######################################"
            end
          when 3
            if hero.experience >= 6000
              puts "######################################"
              puts "Congratulations you have achieved level 4."
              hero.levelhero
              hero.level = 4
              puts "Your max hp is now #{hero.maxhp} hp "
              puts "######################################"
            end
          when 4
            if hero.experience >= 10000
              puts "######################################"
              puts "Congratulations you have achieved level 5."
              hero.levelhero
              hero.level = 5
              puts "Your max hp is now #{hero.maxhp} hp "
              puts "######################################"
            end
          when 5
            if hero.experience >= 15000
              puts "######################################"
              puts "Congratulations you have achieved level 6."
              hero.levelhero
              hero.level = 6
              puts "Your max hp is now #{hero.maxhp} hp "
              puts "######################################"
            end
          when 6
            if hero.experience >= 21000
              puts "######################################"
              puts "Congratulations you have achieved level 7."
              hero.levelhero
              hero.level = 7
              puts "Your max hp is now #{hero.maxhp} hp "
              puts "######################################"
            end
          when 7
            if hero.experience >= 28000
              puts "######################################"
              puts "Congratulations you have achieved level 8."
              hero.levelhero
              hero.level = 8
              puts "Your max hp is now #{hero.maxhp} hp "
              puts "######################################"
            end
          when 8
            if hero.experience >= 36000
              puts "######################################"
              puts "Congratulations you have achieved level 9."
              hero.levelhero
              hero.level = 9
              puts "Your max hp is now #{hero.maxhp} hp "
              puts "######################################"
            end
          when 9
            if hero.experience >= 45000
              puts "######################################"
              puts "Congratulations you have achieved level 10."
              hero.levelhero
              hero.level = 10
              puts "Your max hp is now #{hero.maxhp} hp "
              puts "######################################"
            end
      end
    return hero
  end
end