# frozen_string_literal: true

# rspec spec/board_spec.rb
# rspec --format documentation spec/board_spec.rb

require 'pry-byebug'
require_relative '../lib/board'

describe Board do
  subject(:game_board) { described_class.new }
  describe '#create_board' do
    context 'when a new board is created' do
      it 'returns a list of 42 cells' do
        list = game_board.create_board
        expect(list.length).to eq(42)
      end
    end
  end
end
