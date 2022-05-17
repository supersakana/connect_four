# frozen_string_literal: true

# rspec spec/board_spec.rb
# rspec --format documentation spec/board_spec.rb

require 'pry-byebug'
require_relative '../lib/board'

describe Board do
  subject(:game_board) { described_class.new }
  describe update_board
end
