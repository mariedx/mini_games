require  "pry"

class Game 
  attr_accessor :human_player, :enemies

  def initialize(name)
    @human_player = HumanPlayer.new("Wolverine")
    4.times do |i|
    @enemies << Player.new("player_#{i}")
    end
  end

  def kill_player

  end 
