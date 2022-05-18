# frozen_string_literal: true

# rspec spec/player_spec.rb
# rspec --format documentation spec/player_spec.rb

require 'pry-byebug'
require_relative '../lib/player'

describe Player do
  subject(:player_one) { described_class.new('Zac', 'X') }
  hash = {
    1 => [1, 2, 3, 4, 5, 6, 7],
    2 => [1, 2, 3, 4, 5, 6, 7],
    3 => [1, 2, 3, 4, 5, 6, 7],
    4 => [1, 2, 3, 4, 5, 6, 7],
    5 => [1, 2, 3, 4, 5, 6, 7],
    6 => [1, 2, 3, 4, 5, 6, 7]
  }
  describe '#update_history' do
    context 'when a valid input is passed through' do
      it 'adds the correct coordinate to player history' do
        player_one.instance_variable_get(:@history)
        player_one.update_history(7, hash)
        expect(player_one.history[0]).to eq([6, 7])
      end
    end
    context 'when user history already includes coordinates' do
      before do
        hash[6][0] = 'X'
        hash[6][1] = 'O'
        hash[5][0] = 'X'
        hash[6][2] = 'O'
      end
      it 'pushes the data to existing history' do
        player_one.instance_variable_set(:@history, [[6, 1], [5, 1]])
        player_one.update_history(1, hash)
        expect(player_one.history[-1]).to eq([4, 1])
      end
    end
  end
end
