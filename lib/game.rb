# frozen_string_literal: true

require 'pry-byebug'
require_relative 'board'

# represents the main game
class Game
  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @board = Board.new
    @round = 1
  end

  def play
    @board.print_board
  end

  # checks if player input is valid
  def valid?(input)
    valid_inputs = (1..7).to_a
    valid_inputs.include?(input)
  end
end
