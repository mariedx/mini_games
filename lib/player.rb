require "pry"

class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @life_points = 10
    @name = name
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie" if life_points >=1
  end

  def gets_damage(damage)
    @life_points -= damage
    puts "le joueur #{@name} a ete tué" if life_points <=0
  end

  def attacks(player)
    puts "#{@name} attaque #{player.name}"
    attack = compute_damage
    puts "il/elle lui inflige #{attack} point de dommages"
    player.gets_damage(attack)
  end

  def compute_damage
    return rand(1..6)
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    super(name)
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}" if life_points >= 1
  end 

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    
  end
end