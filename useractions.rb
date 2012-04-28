def useractions(hero, monster)
  puts "What action would you like to perform?"
  action = gets.chomp
  case action
    when 'walk'
      puts "You are walking man"
      p hero
    when 'town'
      gototown1(hero)
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