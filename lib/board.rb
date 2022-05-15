# frozen_string_literal: true

require 'pry-byebug'

# represents the game board interface
class Board
  attr_reader :cells

  def initialize
    @cells = create_board
  end

  def create_board
    x_axis = (0..6).to_a
    y_axis = (0..5).to_a
    cells = []
    x_axis.each do |x|
      y_axis.each { |y| cells << [x, y] }
    end
    cells
  end

  private

  def print_board
    puts <<~HEREDOC
      #{@cells[0..6]}
      #{@cells[7..13]}
      #{@cells[14..20]}
      #{@cells[21..27]}
      #{@cells[28..34]}
      #{@cells[35..41]}
    HEREDOC
  end
end
