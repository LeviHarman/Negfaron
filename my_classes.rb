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
  attr_accessor :name, :creaturetype, :hp, :maxhp
  def initialize(name, creaturetype, maxhp, hp)
    @name = name
    @creaturetype = creaturetype
    @hp = hp
  end
  
  def alive?
    @hp > 0
  end
end

class Monster < Creature
  attr_accessor :xpv, :name, :creaturetype, :hp, :maxhp, :damagedie, :goldv
  
  def initialize(name, creaturetype, maxhp, hp, damagedie, xpv, goldv)
     super(name, creaturetype, maxhp, hp)
    @xpv = xpv # experience value
    @damagedie = damagedie
    @goldv = goldv # gold dropped when killed
  end
end

class Hero < Creature
  attr_accessor :weapon, :gold, :experience, :level, :hp, :exp_to_next_level, :exp_this_level, :str, :dex, :con, :inte, :wis, :cha
  
  def initialize(name, creaturetype, maxhp, hp, str, dex, con, inte, wis, cha, level,  weapon, gold, experience, exp_this_level, exp_to_next_level)
    super(name, creaturetype, maxhp, hp)
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
    modifier = (base_stat / 2) - 5
    return modifier
  end
  
  def damage
    totaldamage = modifier(@str) + die(@weapon.hitdie)
    return totaldamage
  end
  
  def levelhero
    @exp_this_level = 0
    @exp_to_next_level = (@exp_to_next_level * 1.34)
    addedhp = die(4) + die(modifier(@con))
    @level = @level + 1
    @maxhp +=  addedhp
  end
end