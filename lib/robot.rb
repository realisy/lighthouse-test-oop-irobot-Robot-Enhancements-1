require 'pry'

class Robot

  attr_reader :position, :items
  attr_accessor :equipped_weapon, :health

  def initialize(position = [0, 0], items = [], health = 100, equipped_weapon = nil)
    @position = position
    @items = items
    @health = health
    @equipped_weapon = equipped_weapon
  end

  def move_left
    position[0] -= 1
  end

  def move_right
    position[0] += 1
  end

  def move_up
    position[1] += 1
  end

  def move_down
    position[1] -= 1
  end

  def pick_up(item)
    if items_weight + item.weight <= 250
      @items.push(item)
      if item.is_a? Weapon
        @equipped_weapon = item
      end
      true
    else
      false
    end
  end

  def items_weight
    items_weight = 0
    @items.each do |item|
      items_weight += item.weight
    end
    items_weight
  end

  def wound(dmg)
    if @health - dmg <= 0
      @health = 0
    else
      @health -= dmg
    end
  end

  def heal(hp)
    if @health + hp >= 100
      @health = 100
    else
      @health += hp
    end
  end

  def attack(enemy)
    unless @equipped_weapon.nil?
      @equipped_weapon.hit(enemy)
    else
      enemy.wound(5)
    end
  end

  def heal!(hp)
    if @health <= 0
      raise RobotError.new 'can not raise the dead'
    else
      if @health + hp >= 100
        @health = 100
      else
        @health += hp
      end
    end
  end

  def attack!(enemy)
    raise EnemyError.new 'you are attacking the wrong thing' unless enemy.is_a? Robot
  end

end

class RobotError < StandardError
end

class EnemyError < StandardError
end