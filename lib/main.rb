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

def create_player(num, chip)
  puts "Player #{num}, your move is #{chip}. What is your name?"
  name = gets.chomp
  Player.new(name, chip)
end

player_one = create_player(1, 'X')
player_two = create_player(2, 'O')
game = Game.new(player_one, player_two)
game.test
