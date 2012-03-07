def gototown(hero)
loop do
  puts "You enter the town. Where would you like to go?"
  townaction = gets.chomp
  case townaction
    when 'shop'
      puts "You enter a weapons shop. You see an arrangement of weapons."
      puts 'The blacksmith in charge asks "Wanna buy something?"'
      puts "Fine sword, Sword, Rusty sword, Mace"
      weaponpurchase = gets.chomp
      weaponpurchase.downcase
      case weaponpurchase
      
        when 'fine sword'
          fine_sword = Weapon.new('fine sword', 'd8', 1, 250)
          puts "That will be #{fine_sword.price} gold. Do you still want to buy it? yes/no"
            answer = gets.chomp
            if answer == 'yes' then
              if hero.gold > fine_sword.price
                hero.gold -= fine_sword.price
                puts "Here is your fine sword."
                hero.weapon = fine_sword
              else
                puts "You don't have enough money."
              end
            end
            
        when 'sword'
          sword = Weapon.new('sword', 'd6', 1, 63)
          puts "That will be #{sword.price} gold. Do you still want to buy it? yes/no"
            answer = gets.chomp
            if answer == 'yes' then
              if hero.gold > sword.price
                hero.gold -= sword.price
                puts "Here is your fine sword."
                hero.weapon = sword
              else
                puts "You don't have enough money."
              end
            end
          
        when 'rusty sword'
          rusty_sword = Weapon.new('rusty sword', 'd5', 1, 25)
          puts "That will be #{rusty_sword.price} gold. Do you still want to buy it? yes/no"
            answer = gets.chomp
            if answer == 'yes' then
              if hero.gold > rusty_sword.price
                hero.gold -= rusty_sword.price
                puts "Here is your fine sword."
                hero.weapon = rusty_sword
              else
                puts "You don't have enough money."
              end
            end
          
        when 'mace'
          mace = Weapon.new('mace', 'd4', 1, 10)
          puts "That will be #{mace.price} gold. Do you still want to buy it? yes/no"
            answer = gets.chomp
            if answer == 'yes' then
              if hero.gold > mace.price
                hero.gold -= mace.price
                puts "Here is your fine sword."
                hero.weapon = mace
              else
                puts "You don't have enough money."
              end
            end
      end
    when 'inn'
      puts "As you enter the inn the innkeeper gives a quick look at your dirty clothes."
      puts "If you wanna rest it will be #{inn.price} gold, accept or leave!"
        answer = gets.chomp
        if answer == 'yes' then
          if hero.gold >= inn.price
            hero.gold -= inn.price
            puts "Enjoy your stay."
            hero.hp == hero.maxhp
          else
            puts "You don't have enough money."
          end      
    when 'leave'
      puts "You wave goodbye to the villagers and once again enter the wilds."
      return(hero)
      break
    when 'help'
      puts "COMMANDS - shop, inn, leave, help"
  end
end
end