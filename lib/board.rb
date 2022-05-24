# frozen_string_literal: true

# represents the game board interface
class Board
  attr_reader :cells, :top_row

  def initialize
    @cells = create_board
    @top_row = @cells[1]
  end

  # creates 6 rows of 0s (open slots)
  def create_board
    rows = (1..6).to_a
    cells = {}
    rows.each { |value| cells[value] = [0, 0, 0, 0, 0, 0, 0] }
    cells
  end

  # formats the board
  def print_board
    p '1  2  3  4  5  6  7'
    p '-------------------'
    @cells.each do |_k, v|
      p v.join('  ')
    end
  end

  # updates the board with chip when given an input
  def update_board(input, chip)
    i = 6
    until i.zero?
      if @cells[i][input - 1].zero?
        @cells[i][input - 1] = chip
        break
      else
        i -= 1
      end
    end
  end

  def tie?
    @cells.none? do |_k, v|
      v.include?(0)
    end
  end
end
