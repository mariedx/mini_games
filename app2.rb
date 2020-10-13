require 'bundler'
Bundler.require

# require_relative 'lib/game'
require_relative 'lib/player'

ennemies = []

#Accueil 
puts "-------------------------------------------------"
puts "|   Bienvenue sur 'ILS VEULENT TOUS MA POO' !   |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"

sleep 1

#Initialisation du joueur HumanPlayer
puts "Quel est ton petit nom?"
print "> " 
name = gets.chomp  
human = HumanPlayer.new(name)
puts " "

#Initialisation des instances de l'objet Player
ennemies << player1 = Player.new("Josiane")
ennemies << player2 = Player.new("José")

#Combat 
while human.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0) 

  puts "// Voici ton etat de santé et ton arme de départ:" #indique ton etat de sante
  print human.show_state
  puts " "

  sleep 1

  #Affichage des options possibles dans le menu + input 
  puts "Quelle action veux-tu effectuer ?"
  puts " "
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts " "
  puts "attaquer un joueur en vue :"
    if player1.life_points > 0 #boucle en fonction de si le joueur est mort ou s'il faut continuer à l'attaquer
      puts "0 - #{player1.name} a #{player1.life_points} points de vie"
    else
      puts "#{player1.name} died"
    end

    if player2.life_points > 0
      puts "1 - #{player2.name} a #{player2.life_points} points de vie"
    else
      puts "#{player2.name} died"
    end
  print "> "
  puts choice = gets.chomp

  case choice
  when "a"
    human.search_weapon
  when "s"
    human.search_health_pack
  when "0"
    human.attacks(player1)
    sleep 1
    puts player1.show_state
  when "1"
    human.attacks(player2)
    sleep 1
    puts player2.show_state
  else
    puts "error baby, tu as perdu un coup"
  end

  sleep 1

  break if human.life_points <= 0 || (player1.life_points <= 0 && player2.life_points <= 0)

  puts " "
  puts "Les autres joueurs t'attaquent !"
  ennemies.each do |ennemie|
    ennemie.attacks(human) if ennemie.life_points > 0 
  end
  puts " "
end 

#Fin du game
if human.life_points > 0
  puts "BRAVO ! TU AS GAGNE !"
else
  puts "Loser ! Tu as perdu !"
end
