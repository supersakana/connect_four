# frozen_string_literal: true

require_relative 'game'
require_relative 'player'

puts <<~HEREDOC
  Welcome Connect 4!

  This is a 2 player game.

  The goal of is to get 4 in a row.

  (Click ENTER to start!)

HEREDOC
gets

# initializes new player with name and chip
def create_player(num)
  puts "Player #{num}, your chip is #{num}. What is your name?"
  name = gets.chomp
  Player.new(name, num)
end

player_one = create_player(1)
player_two = create_player(2)
game = Game.new(player_one, player_two)
game.play
