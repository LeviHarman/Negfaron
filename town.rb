def gototown(hero)

  fine_sword = Weapon.new('fine sword', 8, 1, 250)
  sword = Weapon.new('sword', 6, 1, 63)
  rusty_sword = Weapon.new('rusty sword', 5, 1, 25)
  mace = Weapon.new('mace', 4, 1, 10)
  #weapons initialize order is -- name, hitdie, number_rolls, price
  
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
        weaponpurchase(fine_sword)
      when 'sword'
        weaponpurchase(sword)
      when 'rusty sword'
        weaponpurchase(rusty_sword)
      when 'mace'
        weaponpurchase(mace)
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
        puts 'Gambler - "Hey man would you like to gamble? I mean... I am really lonely man and I relly miss hanging out with you!"'
        answer = gets.chomp
        if answer == 'yes' then
          puts ' Gambler - "Awesome man you are a true friend man... did I ever tell you how muhc you remind me of a great warrior tribe meaaaaan!."'
          gets.chomp
          puts "How much would you like to bet?"
          bet = gets.chomp
            if hero.gold > bet
              hero.gold -= bet
            end
        end
        
      when 'leave'
        puts "You wave goodbye to the villagers and once again enter the wilds."
        return(hero)
      when 'help'
        puts "COMMANDS - shop, inn, leave, help"
    end
  end
end