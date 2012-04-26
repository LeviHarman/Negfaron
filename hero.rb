class Hero < Creature
  attr_accessor :weapon, :gold, :experience, :level
  
  def initialize(name, creaturetype, str, dex, con, inte, wis, cha, hp, level, maxhp, xpv, str_modifier, dex_modifier, con_modifier, inte_modifier, wis_modifier, cha_modifier, damagedie, weapon, gold, experience)
    super(name, creaturetype, str, dex, con, inte, wis, cha, hp, maxhp, xpv, str_modifier, dex_modifier, damagedie, con_modifier, inte_modifier, wis_modifier, cha_modifier)
    @weapon = weapon
    @gold = gold
    @experience = experience
    @level = :level
  end
  
  def newstatroll
    statroll = Array.new(4){d6} #rolls 4 virtual d6.
    statrolls = statroll[0]+statroll[1]+statroll[2]+statroll[3]-statroll.min #adds the three highest rolls and it equals the str etc. Repeated for all 6 stats.
    return statrolls
  end
  
  def herodamage
    case @weapon.hitdie
      when 'd2'
        hitdieroll = d2
      when 'd3'
        hitdieroll = d3
      when 'd4'
        hitdieroll = d4
      when 'd5'
        hitdieroll = d5
      when 'd6'
        hitdieroll = d6
      when 'd8'
        hitdieroll = d8
    end
    totaldamage = @str_modifier + hitdieroll
    return totaldamage
  end
  
  def race( aRace )
    case aRace
      when 'human'
        @creaturetype = "human"
      when 'dwarf'
        @creaturetype = "dwarf"
        @con += 2
        @cha -= 2
      when 'elf'
        @creaturetype = "elf"
        @con -= 2
        @dex += 2
      else
        puts "Please enter a valid Race."
    end
  end
  
  def getstatmodifier
    @cha_modifier = modifier(@cha)
    @wis_modifier = modifier(@wis)
    @inte_modifier = modifier(@inte)
    @con_modifier = modifier(@con)
    @dex_modifier = modifier(@dex)
    @str_modifier = modifier(@str)
  end
  
  def set_name( aName )
    @name = aName
  end
  
  def levelhero
    addedhp = d10 + @con_modifier
    @maxhp +=  addedhp
  end
  
  def namehero
    loop do
      puts "What is thy name?"
      @name = gets.chomp
      
      puts "Is #{@name} the correct name? yes/no"
      correct = gets.chomp
      if correct == 'yes'
        puts "Welcome #{@name}, to the land of Negfaron"
        gets.chomp
        break
      end
    end
  end
  
  def rollforherostats
  rollagain = 0
    while rollagain == 0
      @str = newstatroll
      @dex = newstatroll
      @con = newstatroll
      @inte = newstatroll
      @wis = newstatroll
      @cha = newstatroll
      getstatmodifier
      
      puts "Your stats are:"
      puts "Strength = #{@str} - Important for physical damage, and melee accuracy."
      puts "Dexterity = #{@dex} - Important for ranged accuracy, and armor class."
      puts "Constitution = #{@con} - Important for hit points, and poison saves."
      puts "Intelligence = #{@inte} - Important for magic."
      puts "Wisdom = #{@wis} - Important for healing."
      puts "Charisma = #{@cha} - Important for prices and dealing with people."
      puts 
      puts "Your modifiers are:"
      puts "Strength modifier = #{@str_modifier} - Modifies damage"
      puts "Dexterity modifier = #{@dex_modifier} - Modifies ranged accuracy"
      puts "Constitution modifier = #{@con_modifier} - Modifies hit points"
      puts "Intelligence modifier = #{@inte_modifier} - Modifies mana and number of spells"
      puts "Wisdom modifier = #{@wis_modifier} - Modifies healing"
      puts "Charisma modifier = #{@cha_modifier} - Modifies social things."
      print
      puts "Would you like to roll again?"
      reroll = gets.chomp
      case reroll
        when 'yes' #reroll
          rollagain = 0
        when 'no' #keep current rolls
          @hp = 10 + @con_modifier
          @maxhp = 10 + @con_modifier
          puts "Your hp is #{@maxhp}"
          rollagain = 1
      end
    end
  end
  def pickarace
  while @creaturetype == 1
    puts "Which race would you like to choose?"
    puts "Human - No bonus or penalty. The well rounded race."
    puts "Dwarf - Bonus Constitution, and Penalty to Charisma. Short sturdy Dwarves are tough but they are hard to get along with."
    puts "Elf - Bonus Dexterity, and penalty to Constitution. The frail woodland elves prefer the bow."
    raceselection = gets.chomp
    race(raceselection.downcase)
    getstatmodifier
  end
  end
end