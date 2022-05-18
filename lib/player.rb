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
  def winner?
    return if @history.empty?

    @history.any? do |chip|
      wins = combos(chip)
      @history.include?(wins)
    end
  end

  # returns possible winning combos for a chip
  def combos(chip)
    combos = []
    combos << horizontal(chip)
    combos << vertical(chip)
    combos << diagonals(chip)
  end

  # logs each move the player makes
  def update_history(input, hash)
    i = 6
    until i.zero?
      if hash[i].include?(input)
        @history << [i, hash[i][input - 1]]
        break
      else
        i -= 1
      end
    end
  end
end
