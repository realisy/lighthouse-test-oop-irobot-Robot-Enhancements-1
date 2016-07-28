class Weapon < Item

  attr_reader :name, :weight, :damage

  def initialize(name = "power_shock", weight = 10, damage = 45)
    @name = name
    @weight = weight
    @damage = damage
  end

  def hit(enemy)
    enemy.wound(@damage)
  end
end