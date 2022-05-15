# frozen_string_literal: true

require 'pry-byebug'

# represents the Player functionality
class Player
  def initialize(name, chip)
    @name = name
    @chip = chip
    @history = []
  end
end
