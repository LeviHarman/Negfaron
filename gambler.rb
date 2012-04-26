def gambler
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
end