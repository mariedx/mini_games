require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

while player1.life_points > 0 || player2.life_points > 0 
  puts "// Voici l'état de chaque joueur :"
  sleep 1
  print player1.show_state
  print player2.show_state
  sleep 1
  puts " "
  puts "~~~~> C'est parti pour la fight <~~~~"
  sleep 1
  player1.attacks(player2)
  break if player2.life_points <= 0
  player2.attacks(player1) 
  break if player1.life_points <= 0
  puts " " 
  sleep 1
end

if player1.life_points <= 0
  puts ". . ."
  sleep 1
  puts "#{player2.name} winner, #{player1.name} looooooooser"
  sleep 1
elsif player2.life_points <= 0
  puts ". . ."
  sleep 1
  puts "#{player1.name} winner, #{player2.name} BIG looooser"
  sleep 1
end

# binding.pry