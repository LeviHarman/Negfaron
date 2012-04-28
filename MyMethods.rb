class Weapon
  attr_accessor :name, :hitdie, :number_rolls, :price
  def initialize(name, hitdie, number_rolls, price)
    @name = name
    @hitdie = hitdie
    @number_rolls = number_rolls
    @price = price
  end
end
  
def die(a_die) #rolls a die. Number of sides depend on the value chosen by program.
  roll = rand(a_die) + 1
  return roll
end

#Following regenerate the monsters.
#Initialize order is --- name, creaturetype, maxhp, hp, damagedie, xpv
def regeneratekobold(kobold)
  kobold.name = 'Kobold'
  kobold.creaturetype = 'Kobold'
  kobold.hp = 20
  kobold.maxhp = 20
  kobold.xpv = 200
  kobold.damagedie = (die(4)) +1
  return kobold
end

def regeneratesnake(snake)
  snake.name = 'Snake'
  snake.creaturetype = 'Snake'
  snake.hp = 10
  snake.maxhp = 10
  snake.xpv = 100
  snake.damagedie = die(4)
  return snake
end

def regeneraterabbit(rabbit)
  rabbit.name = 'Snake'
  rabbit.creaturetype = 'Snake'
  rabbit.hp = 10
  rabbit.maxhp = 10
  rabbit.xpv = 75
  rabbit.damagedie = die(2)
  return rabbit
end

def regeneraterat(rat)
  rat.name = 'Rat'
  rat.creaturetype = 'Rat'
  rat.hp = 5
  rat.maxhp = 5
  rat.xpv = 50
  rat.damagedie = die(2)
  return rat
end

def regeneratefrog(frog)
  frog.name = 'frog'
  frog.creaturetype = 'frog'
  frog.hp = 5
  frog.maxhp = 5
  frog.xpv = 95
  frog.damagedie = die(3)
  return frog
end
#end of monster regenerations