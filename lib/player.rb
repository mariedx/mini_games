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
    new_weapon = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{@weapon_level}"
    if new_weapon > @weapon_level
      @weapon_level = new_weapon
      puts "Youhou ! elle est meilleure que mon arme actuelle : je la prend."
    else 
      "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    health_pack = rand(1..6)

    if health_pack == 1 
      puts "Tu n'as rien trouvé... "
    elsif health_pack >= 2 && health_pack <= 5
      life_points += 50
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    elsif health_pack == 6 
      life_points += 80
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
    end
  end
end