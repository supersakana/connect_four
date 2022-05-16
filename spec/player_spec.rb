# frozen_string_literal: true

# rspec spec/player_spec.rb
# rspec --format documentation spec/player_spec.rb

require 'pry-byebug'
require_relative '../lib/player'

describe Player do
  subject(:player_one) { described_class.new('Zac', 'X') }
  # test to run
end
