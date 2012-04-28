class Creature
  attr_accessor :name, :creaturetype, :hp, :maxhp, :damagedie
  
  def initialize(name, creaturetype, maxhp, hp, damagedie)
    @name = name
    @creaturetype = creaturetype
    @hp = hp
    @damagedie = damagedie
  end
  
  def damagecalculator
    damage = @damagedie
    return damage
  end
end

class Monster < Creature
  attr_accessor :xpv, :name, :creaturetype, :hp, :maxhp, :damagedie
  
  def initialize(name, creaturetype, maxhp, hp, damagedie, xpv)
     super(name, creaturetype, maxhp, hp, damagedie)
    @xpv = xpv
  end
  
  def alive?
    @hp > 0
  end
end