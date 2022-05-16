# frozen_string_literal: true

require 'pry-byebug'
require_relative 'board'

# represents the main game
class Game
  attr_reader :board, :player_one, :player_two

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @board = Board.new
    @round = 1
  end

  # starts the game
  def play
    game_loop
  end

  # general game loop for each round
  def game_loop
    until player_one.winner? || player_two.winner?
      @board.print_board
      play_round
    end
  end

  # displays prompt for user to make choice
  def play_round
    # code to run
  end
end
