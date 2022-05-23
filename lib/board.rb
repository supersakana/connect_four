# frozen_string_literal: true

require 'pry-byebug'

# represents the game board interface
class Board
  attr_reader :cells, :top_row

  def initialize
    @cells = create_board
    @top_row = @cells[1]
  end

  def create_board
    rows = (1..6).to_a
    cells = {}
    rows.each { |value| cells[value] = [0, 0, 0, 0, 0, 0, 0] }
    cells
  end

  def print_board
    p '1  2  3  4  5  6  7'
    p '-------------------'
    @cells.each do |_k, v|
      p v.join('  ')
    end
  end

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
end
