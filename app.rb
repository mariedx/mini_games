require 'bundler'
Bundler.require

# require_relative 'lib/game'
require_relative 'lib/player'

#Initialisation des joueurs:
player1 = Player.new("Josiane")
player2 = Player.new("José")

#boucle qui permet d'afficher l'état de santé des joueurs et de passer à l'attaque:
while player1.life_points > 0 || player2.life_points > 0 
  puts "// Voici l'état de chaque joueur :"
  print player1.show_state
  print player2.show_state
  sleep 1
  puts " "
  puts "~~~~> C'est parti pour la fight <~~~~"
  sleep 1
  player1.attacks(player2)
  break if player2.life_points <= 0 #si le joueur 2 meurt, il sort de la boucle : il ne peut plus attaquer.
  player2.attacks(player1) 
  break if player1.life_points <= 0 #idem joueur 1
  puts " " 
  sleep 1
end

if player1.life_points <= 0 #si le joueur 1 meurt, on indique que le gagnant est le joueur 2
  puts ". . ."
  puts "#{player2.name} : winner, #{player1.name} : loooooser"
elsif player2.life_points <= 0
  puts ". . ."
  puts "#{player1.name} : winner, #{player2.name} : looooser"
end