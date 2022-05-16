# frozen_string_literal: true

require 'pry-byebug'

# represents the game board interface
class Board
  attr_reader :cells

  def initialize
    @cells = create_board
  end

  def create_board
    rows = (1..6).to_a
    cells = {}
    rows.each { |value| cells[value] = (1..7).to_a }
    cells
  end

  def print_board
    @cells.each { |row| p row }
  end
end
