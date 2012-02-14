class Weapon
  attr_accessor :name, :hitdie, :number_rolls, :price
  def initialize(name, hitdie, number_rolls, price)
    @name = name
    @hitdie = hitdie
    @number_rolls = number_rolls
    @price = price
  end
end