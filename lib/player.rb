# frozen_string_literal: true

require 'pry-byebug'

# represents the Player functionality
class Player
  attr_reader :name, :chip

  attr_accessor :history

  def initialize(name, chip)
    @name = name
    @chip = chip
    @history = []
  end

  # determines if user history includes winning combo
  # what if the winner was determined by using the game board instead of user history? That way the history instance var would not need to be included.
  # to be continued...
  # def winner?
  #   return if @history.empty?

  #   @history.any? do |chip|
  #     wins = combos(chip)
  #     @history.include?(wins)
  #   end
  # end

  # # returns possible winning combos for a chip
  # def combos(chip)
  #   combos = []
  #   combos << horizontal(chip)
  #   combos << vertical(chip)
  #   combos << diagonals(chip)
  # end

  # # returns possible horizontal wins
  # def horizontal(chip)
  #   # code to run
  # end

  # # returns possible vertical wins
  # def vertical(chip)
  #   # code to run
  # end

  # # returns possible diagonal wins
  # def diagonals(chip)
  #   # code to run
  # end

  # logs each move the player makes
  def update_history(input, hash)
    i = 6
    until i.zero?
      if hash[i].include?(input)
        @history << [hash[i][input - 1], i]
        break
      else
        i -= 1
      end
    end
  end
end
