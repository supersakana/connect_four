# frozen_string_literal: true

require 'pry-byebug'
require_relative 'board'
require_relative 'display'
require_relative 'player'

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
    winner = player_one.winner? ? player_one.name : player_two.name
    display_winner(winner)
  end

  # displays prompt for user to make choice
  def play_round
    player = turn_player
    input = display_choice(player.name)
    verify(input, player)
  end

  # returns player according to round number
  def turn_player
    @round.odd? ? @player_one : @player_two
  end

  def verify(input, player)
    if valid?(input.to_i)
      update(input.to_i, player)
    else
      display_error
      play_round
    end
  end

  # what if there where no more slots in (number)? How can you return invalid?
  def valid?(input)
    input.to_i.between?(1, 7) && @board.top_row[input - 1].zero?
  end

  # updates the game_board and player history
  def update(input, player)
    @round += 1
    player.update_history(input, @board.cells)
    @board.update_board(input, player.chip)
  end
end
