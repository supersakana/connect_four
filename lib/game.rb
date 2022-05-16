# frozen_string_literal: true

require 'pry-byebug'
require_relative 'board'

# represents the main game
class Game
  attr_reader :board, :player_one, :player_two, :round

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
    player = turn_player
    choice = display_choice(player)
    verify(choice, player)
  end

  # returns player according to round number
  def turn_player
    @round.odd? ? @player_one : @player_two
  end

  def verify(choice, player)
    # code to run
  end

  def add_round
    @round += 1
  end
end
