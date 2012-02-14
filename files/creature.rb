class Creature
  attr_accessor :name, :creaturetype, :str, :dex, :con, :inte, :wis, :cha, :hp, :maxhp, :xpv, :str_modifier, :dex_modifier, :con_modifier, :inte_modifier, :wis_modifier, :cha_modifier, :damagedie
  def initialize(name, creaturetype, str, dex, con, inte, wis, cha, hp, maxhp, xpv, str_modifier, dex_modifier, con_modifier, inte_modifier, wis_modifier, cha_modifier, damagedie)
    @name = name
    @creaturetype = creaturetype
    @str = str
    @dex = dex
    @con = con
    @inte = inte
    @wis = wis
    @cha = cha
    @hp = hp
    @xpv = xpv
    @str_modifier = str_modifier
    @dex_modifier = dex_modifier
    @con_modifier = con_modifier
    @inte_modifier = inte_modifier
    @wis_modifier = wis_modifier
    @cha_modifier = cha_modifier
    @damagedie = damagedie
  end
  def alive?
    @hp > 0
  end
  def heal
    @hp += wis
    if @hp > @maxhp then
      @hp = @maxhp
    end
  end
  def damagecalculator
    damage = @damagedie
    return damage
  end
  def modifier(base_stat)
    if base_stat == 1
      return -5
    elsif base_stat == 2 or  base_stat == 3
      return -4
    elsif base_stat == 4 or base_stat == 5
      return -3
    elsif base_stat == 6 or base_stat == 7
      return -2
    elsif base_stat == 8 or base_stat == 9
      return -1
    elsif base_stat == 10 or base_stat == 11
      return 0
    elsif base_stat == 12 or base_stat == 13
      return +1
    elsif base_stat == 14 or base_stat == 15
      return +2
    elsif base_stat == 16 or base_stat == 17
      return +3
    elsif base_stat == 18 or base_stat == 19
      return +4
    elsif base_stat == 20
        return +5
    else
      print "modifier error"
    end
  end
end

def blankhero(hero)
  hero.name = "blank"
  hero.creaturetype = 1
  hero.str = 1
  hero.dex = 1
  hero.con = 1
  hero.inte = 1
  hero.wis = 1
  hero.cha = 1
  hero.level = 1
  hero.xpv = 10
  hero.str_modifier = 10
  hero.dex_modifier = 0
  hero.con_modifier = 0
  hero.inte_modifier = 0
  hero.wis_modifier = 0
  hero.cha_modifier = 0
  hero.hp = 1
  hero.maxhp = 1
  hero.weapon = 'fist'
  hero.gold = 1
  hero.experience = 0
  hero.damagedie = 0
  return (hero)
end

def generatekobold(kobold)
  kobold.name = 'Kobold'
  kobold.creaturetype = 'Kobold'
  kobold.str = 5
  kobold.dex = 5
  kobold.con = 5
  kobold.inte = 5
  kobold.wis = 5
  kobold.cha = 5
  kobold.hp = 20
  kobold.maxhp = 20
  kobold.xpv = 1000
  kobold.str_modifier = 2
  kobold.dex_modifier = 2
  kobold.con_modifier = 2
  kobold.inte_modifier = 2
  kobold.wis_modifier = 2
  kobold.cha_modifier = 2
  kobold.damagedie = (d4) +1
  return kobold
end

def generatesnake(snake)
  snake.name = 'Snake'
  snake.creaturetype = 'Snake'
  snake.str = 5
  snake.dex = 5
  snake.con = 5
  snake.inte = 5
  snake.wis = 5
  snake.cha = 5
  snake.hp = 10
  snake.maxhp = 10
  snake.xpv = 1000
  snake.str_modifier = 2
  snake.dex_modifier = 2
  snake.con_modifier = 2
  snake.inte_modifier = 2
  snake.wis_modifier = 2
  snake.cha_modifier = 2
  snake.damagedie = d4 
  return snake
end

def generaterabbit(rabbit)
  rabbit.name = 'Snake'
  rabbit.creaturetype = 'Snake'
  rabbit.str = 5
  rabbit.dex = 5
  rabbit.con = 5
  rabbit.inte = 5
  rabbit.wis = 5
  rabbit.cha = 5
  rabbit.hp = 10
  rabbit.maxhp = 10
  rabbit.xpv = 1000
  rabbit.str_modifier = 2
  rabbit.dex_modifier = 2
  rabbit.con_modifier = 2
  rabbit.inte_modifier = 2
  rabbit.wis_modifier = 2
  rabbit.cha_modifier = 2
  rabbit.damagedie = d2
  return rabbit
end

def generaterat(rat)
  rat.name = 'Rat'
  rat.creaturetype = 'Rat'
  rat.str = 5
  rat.dex = 5
  rat.con = 5
  rat.inte = 5
  rat.wis = 5
  rat.cha = 5
  rat.hp = 5
  rat.maxhp = 5
  rat.xpv = 1000
  rat.str_modifier = 2
  rat.dex_modifier = 2
  rat.con_modifier = 2
  rat.inte_modifier = 2
  rat.wis_modifier = 2
  rat.cha_modifier = 2
  rat.damagedie = d3
  return rat
end

def generatefrog(frog)
  frog.name = 'frog'
  frog.creaturetype = 'frog'
  frog.str = 5
  frog.dex = 5
  frog.con = 5
  frog.inte = 5
  frog.wis = 5
  frog.cha = 5
  frog.hp = 5
  frog.maxhp = 5
  frog.xpv = 1000
  frog.str_modifier = 2
  frog.dex_modifier = 2
  frog.con_modifier = 2
  frog.inte_modifier = 2
  frog.wis_modifier = 2
  frog.cha_modifier = 2
  frog.damagedie = d3
  return frog
end