# frozen_string_literal: true

require 'pry-byebug'
require_relative 'board'
require_relative 'display'

# represents the main game
class Game
  attr_reader :board, :player_one, :player_two, :round

  include Display

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
    input = display_choice(player)
    verify(input, player)
  end

  # returns player according to round number
  def turn_player
    @round.odd? ? @player_one : @player_two
  end

  def verify(input, player)
    if valid?(input)
      update(input, player)
    else
      display_error
      play_round
    end
  end

  def valid?(input)
    valid_inputs = (1..7).to_a
    valid_inputs.include?(input.to_i)
  end

  def add_round
    @round += 1
  end
end
