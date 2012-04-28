class Weapon
  attr_reader :name, :hitdie, :number_rolls, :price
  def initialize(name, hitdie, number_rolls, price)
    @name = name
    @hitdie = hitdie
    @number_rolls = number_rolls
    @price = price
  end
end

class Creature
  attr_accessor :name, :creaturetype, :hp, :maxhp, :damagedie
  
  def initialize(name, creaturetype, maxhp, hp, damagedie)
    @name = name
    @creaturetype = creaturetype
    @hp = hp
    @damagedie = damagedie
  end
  
  def alive?
    @hp > 0 #checks if creature is alive.
  end
  
  def damagecalculator
    damage = @damagedie
    return damage
  end
  
  def rename(newname)
    @name = newname #method to change name of a creature.
  end
  
  def new_creaturetype(newtype)
    @creaturetype = newtype
  end
end

class Monster < Creature
  attr_accessor :xpv, :name, :creaturetype, :hp, :maxhp, :damagedie
  
  def initialize(name, creaturetype, maxhp, hp, damagedie, xpv)
     super(name, creaturetype, maxhp, hp, damagedie)
    @xpv = xpv # experience value
  end
end

class Hero < Creature
  attr_accessor :weapon, :gold, :experience, :level, :hp, :exp_to_next_level, :exp_this_level
  
  def initialize(name, creaturetype, maxhp, hp, damagedie, str, dex, con, inte, wis, cha, level,  weapon, gold, experience, exp_this_level, exp_to_next_level)
    super(name, creaturetype, maxhp, hp, damagedie)
    @weapon = weapon
    @gold = gold
    @level = level
    @str = str
    @dex = dex
    @con = con
    @inte = inte
    @wis = wis
    @cha = cha
    @experience = experience
    @exp_to_next_level = exp_to_next_level
    @exp_this_level = exp_this_level
  end
  
  def heal
    @hp += die(4) + modifier(@inte)
    if @hp > @maxhp then
      @hp = @maxhp
    end
  end
  
  def newstatroll
    statroll = Array.new(4){die(6)} #rolls 4 virtual d6.
    statrolls = statroll[0]+statroll[1]+statroll[2]+statroll[3]-statroll.min #adds the three highest rolls and it equals the str etc. Repeated for all 6 stats.
    return statrolls
  end
  
  def herodamage
    case @weapon.hitdie
      when 'd2'
        hitdieroll = die(2)
      when 'd3'
        hitdieroll = die(3)
      when 'd4'
        hitdieroll = die(4)
      when 'd5'
        hitdieroll = die(5)
      when 'd6'
        hitdieroll = die(6)
      when 'd8'
        hitdieroll = die(8)
    end
    totaldamage = modifier(@str) + hitdieroll
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
  
  def levelhero
    @exp_this_level = 0
    @exp_to_next_level = (@exp_to_next_level * 1.33)
    addedhp = die(10) + modifier(@con)
    @level = @level + 1
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
  
  def modifier(base_stat)
    base_stat = (base_stat / 2) - 5
    return base_stat
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
      show_stat_rolls #prints the rolls and the modifiers to screen
      
      reroll = gets.chomp
      case reroll
        when 'yes' #reroll
          rollagain = 0
        when 'no' #keep current rolls
          @hp = 10 + modifier(@con)
          @maxhp = 10 + modifier(@con)
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
    end
  end
end