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
    @hp > 0
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
  attr_accessor :weapon, :gold, :experience, :level, :hp, :exp_to_next_level, :exp_this_level, :str, :dex, :con, :inte, :wis, :cha
  
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
  
  def modifier(base_stat) #Dungeons and Dragons type modifier system
    base_stat = (base_stat / 2) - 5
    return base_stat
  end
  
  def herodamage
    totaldamage = modifier(@str) + die(@weapon.hitdie)
    return totaldamage
  end
  
  def levelhero
    @exp_this_level = 0
    @exp_to_next_level = (@exp_to_next_level * 1.33)
    addedhp = die(10) + modifier(@con)
    @level = @level + 1
    @maxhp +=  addedhp
  end
  
end