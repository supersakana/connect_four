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

  def test
    @board.print_board
  end
end
