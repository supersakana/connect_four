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

  # determines if user has any winning combinations
  def winner?
    # code to run
  end
end
