require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
ennemies = []

#Accueil 
puts "-------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"
sleep 1

#Initialisation du joueur
puts "Quel est ton petit nom?"
print "> " 
print name = gets.chomp  
human = HumanPlayer.new(name)

#Initialisation du joueur
ennemies << player1 = Player.new("Josiane")
ennemies << player2 = Player.new("José")

#COMBAT
while human.life_points > 0 || player1.life_points > 0 && player2.life_points > 0 
  puts "// Voici l'état de chaque joueur :"
  sleep 1
  print human.show_state
  print player1.show_state
  print player2.show_state
  sleep 1
  puts " "
  puts "~~~~> C'est parti pour la fight <~~~~"
  sleep 1
  human.attacks(player1)
  break if player1.life_points <= 0
  player1.attacks(human)
  break if human.life_points <= 0
  human.attacks(player2)
  break if player2.life_points <= 0
  player2.attacks(human) 
  break if human.life_points <= 0
  puts " " 
  sleep 1
end

#Fin du game
puts ". . .La partie est finie"
if player1.life_points <= 0 && player2.life_points <= 0
  sleep 1
  puts "BRAVO ! TU AS GAGNE !"
  sleep 1
elsif human.life_points <= 0 
  puts ". . ."
  sleep 1
  puts "Loser ! Tu as perdu !"
  sleep 1
end
