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
  # to be continued...
  def winner?
    return if @history.empty?

    @history.any? do |chip|
      wins = combos(chip)
      wins.include?(true)
    end
  end

  # returns possible winning combos for a chip
  def combos(chip)
    combos = []
    combos << horizontal(chip)
    combos << vertical(chip)
    combos << left_diagonals(chip)
    combos << right_diagonals(chip)
  end

  # returns possible horizontal wins for a single chip (positive and negative)
  def horizontal(chip)
    pos = [chip]
    neg = [chip]
    3.times { pos << [pos[-1][0], pos[-1][1] + 1] }
    3.times { neg << [neg[-1][0], neg[-1][1] - 1] }
    return true if winning_combo?(pos) || winning_combo?(neg)
  end

  # returns possible vertical wins for a single chip (positive and negative)
  def vertical(chip)
    pos = [chip]
    neg = [chip]
    3.times { pos << [pos[-1][0] + 1, pos[-1][1]] }
    3.times { neg << [neg[-1][0] - 1, neg[-1][1]] }
    return true if winning_combo?(pos) || winning_combo?(neg)
  end

  # returns possible diagonal wins for a single chip (top_left = tl bottom_right = br)
  def left_diagonals(chip)
    tl = [chip]
    br = [chip]
    3.times { tl << [tl[-1][0] - 1, tl[-1][1] - 1] }
    3.times { br << [br[-1][0] + 1, br[-1][1] + 1] }
    return true if winning_combo?(tl) || winning_combo?(br)
  end

  # returns possible diagonal wins for a single chip (top_left = tl bottom_right = br)
  def right_diagonals(chip)
    tr = [chip]
    bl = [chip]
    3.times { tr << [tr[-1][0] - 1, tr[-1][1] + 1] }
    3.times { bl << [bl[-1][0] + 1, bl[-1][1] - 1] }
    return true if winning_combo?(tr) || winning_combo?(bl)
  end

  # checks if all items in a combo are included in the user history
  def winning_combo?(combo)
    combo.all? do |item|
      @history.include?(item)
    end
  end

  # logs each move the player makes
  def update_history(input, hash)
    i = 6
    until i.zero?
      if hash[i][input - 1].zero?
        @history << [input - 1, i]
        break
      else
        i -= 1
      end
    end
  end
end
