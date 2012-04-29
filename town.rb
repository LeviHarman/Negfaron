def gototown(hero)

  fine_sword = Weapon.new('fine sword', 8, 1, 250, 0)
  sword = Weapon.new('sword', 6, 1, 63, 0)
  rusty_sword = Weapon.new('rusty sword', 5, 1, 25, 0)
  mace = Weapon.new('mace', 4, 1, 10, 0)
  #weapons initialize order is -- name, hitdie, number_rolls, price, modifier
  
  loop do
    puts "You enter the town. Where would you like to go?"
    townaction = gets.chomp
    
    case townaction
    when 'shop'
      puts "You enter a weapons shop. You see an arrangement of weapons."
      puts 'The blacksmith in charge asks "Wanna buy something?"'
      puts "Fine sword, Sword, Rusty sword, Mace"
      weaponpurchase = gets.chomp
      weaponpurchase = weaponpurchase.downcase

      case weaponpurchase
      when 'fine sword'
        weaponpurchase(hero, fine_sword)
      when 'sword'
        weaponpurchase(hero, sword)
      when 'rusty sword'
        weaponpurchase(hero, rusty_sword)
      when 'mace'
        weaponpurchase(hero, mace)
      end
      
    when 'inn'
      puts "As you enter the inn the innkeeper gives a quick look at your dirty clothes."
      puts "If you wanna rest it will be 10 gold, accept or leave! yes/no"
        answer = gets.chomp
        if answer == 'yes' then
          if hero.gold >= 10
            hero.gold -= 10
            puts "Enjoy your stay."
            hero.hp == hero.maxhp
          else
            puts "You don't have enough money."
          end
        end
          
    when 'gamble'
      puts "You see a gambler who is as handsome as a beautiful Bahranian woman."
      gets.chomp
      puts 'Gambler - "Want to gamble?" yes/no'
      answer = gets.chomp
      if answer == 'yes' then
        puts "How much would you like to bet?"
        bet = gets.chomp
        bet = bet.to_f
        if hero.gold >= bet
          hero.gold -= bet

          loop do
            puts "Heads or tales?"
            choice = gets.chomp
            choice = choice.downcase
            case choice
            when 'heads'
              answer = 1
              break
            when 'tales'
              answer = 2
              break
            else
              puts "Choose heads, or tales."
            end
          end
          
          coin = die(2)
          
          if coin == answer
            winnings = bet * 2
            puts "You won! #{winnings} gold."
            hero.gold += winnings
          else
            puts "Sorry you lost pal."
          end
      else
        puts "You dont have enough to gamble. Come back later!"
      end
    else
      'Gambler: "Seeya!"'
    end
    
    when 'leave'
      puts "You wave goodbye to the villagers and once again enter the wilds."
      return(hero)
      
    when 'help'
      puts "COMMANDS - shop, inn, gamble, leave, help"
    end
  end
end