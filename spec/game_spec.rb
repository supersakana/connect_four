# frozen_string_literal: true

# rspec spec/game_spec.rb
# rspec --format documentation spec/game_spec.rb

require 'pry-byebug'
require_relative '../lib/game'

describe Game do
  let(:first_player) { instance_double('Player', name: 'Zac', move: 'X') }
  let(:second_player) { instance_double('Player', name: 'Zoe', move: 'O') }
  subject(:game) { described_class.new(first_player, second_player) }

  describe '#valid?' do
    context 'when given a correct input' do
      it 'returns true' do
        valid_input = 3
        result = game.valid?(valid_input)
        expect(result).to be_truthy
      end
    end
    context 'when given an invalid input' do
      it 'returns false' do
        invalid_input = 8
        result = game.valid?(invalid_input)
        expect(result).to be_falsey
      end
    end
  end
end
