# frozen_string_literal: true

# rspec spec/board_spec.rb
# rspec --format documentation spec/board_spec.rb

# rubocop:disable Metrics/BlockLength

require 'pry-byebug'
require_relative '../lib/board'

describe Board do
  subject(:game_board) { described_class.new }

  describe '#update_board' do
    context 'when a valid move gets passed from player' do
      it 'updates the lowest row avalible' do
        game_board.instance_variable_get(:@cells)
        game_board.update_board(1, 'X')
        expect(game_board.cells[6][0]).to eq('X')
      end
      it 'updates the lowest row with existing chips' do
        game_board.instance_variable_set(:@cells, {
                                           1 => [1, 2, 3, 4, 5, 6, 7],
                                           2 => [1, 2, 3, 4, 5, 6, 7],
                                           3 => [1, 2, 3, 4, 5, 6, 7],
                                           4 => ['X', 2, 3, 4, 5, 6, 7],
                                           5 => ['O', 'O', 3, 4, 5, 6, 7],
                                           6 => ['X', 'X', 'X', 4, 5, 6, 7]
                                         })
        game_board.update_board(2, 'O')
        expect(game_board.cells[4][1]).to eq('O')
      end
    end
  end

  describe '#winner?' do
    context 'when given a winning combo' do
      it 'returns true for horizontal match' do
        game_board.instance_variable_set(:@cells, {
                                           1 => [1, 2, 3, 4, 5, 6, 7],
                                           2 => [1, 2, 3, 4, 5, 6, 7],
                                           3 => [1, 2, 3, 4, 5, 6, 7],
                                           4 => ['X', 2, 3, 4, 5, 6, 7],
                                           5 => ['O', 'O', 3, 4, 5, 6, 7],
                                           6 => ['X', 'X', 'X', 'X', 5, 6, 7]
                                         })
        result = game_board.winner?
        expect(result).to be_truthy
      end
      it 'returns true for a vertical combo' do
        game_board.instance_variable_set(:@cells, {
                                           1 => [1, 2, 3, 4, 5, 6, 7],
                                           2 => [1, 2, 3, 4, 5, 6, 7],
                                           3 => ['O', 2, 3, 4, 5, 6, 7],
                                           4 => ['O', 2, 3, 4, 5, 6, 7],
                                           5 => ['O', 'O', 3, 4, 5, 6, 7],
                                           6 => ['O', 'X', 'X', 4, 5, 6, 7]
                                         })
        result = game_board.winner?
        expect(result).to be_truthy
      end
      it 'returns true for diagonal combo' do
        game_board.instance_variable_set(:@cells, {
                                           1 => [1, 2, 3, 4, 5, 6, 7],
                                           2 => [1, 2, 3, 4, 5, 6, 7],
                                           3 => ['1', 2, 3, 'O', 5, 6, 7],
                                           4 => ['1', 2, 'O', 'O', 5, 6, 7],
                                           5 => ['1', 'O', 'X', 'O', 5, 6, 7],
                                           6 => ['O', 'X', 'X', 'X', 5, 6, 7]
                                         })
        result = game_board.winner?
        expect(result).to be_truthy
      end
    end
    context 'when a winning combo is not found' do
      it 'returns false on an untouched board' do
        game_board.instance_variable_get(:@cells)
        result = game_board.winner?
        expect(result).to be_falsey
      end
      it 'returns false if 4 moves exist but not in a row' do
        game_board.instance_variable_set(:@cells, {
                                           1 => [1, 2, 3, 4, 5, 6, 7],
                                           2 => [1, 2, 3, 4, 5, 6, 7],
                                           3 => [1, 2, 3, 4, 5, 6, 7],
                                           4 => ['X', 2, 3, 4, 5, 6, 7],
                                           5 => ['O', 'O', 3, 4, 5, 6, 7],
                                           6 => ['X', 'X', 'X', 'O', 'X', 6, 7]
                                         })
        result = game_board.winner?
        expect(result).to be_falsey
      end
    end
  end
end

# {
#  1=>[1, 2, 3, 4, 5, 6, 7],
#  2=>[1, 2, 3, 4, 5, 6, 7],
#  3=>[1, 2, 3, 4, 5, 6, 7],
#  4=>[1, 2, 3, 4, 5, 6, 7],
#  5=>[1, 2, 3, 4, 5, 6, 7],
#  6=>[1, 2, 3, 4, 5, 6, 7]
#  }
# rubocop:enable Metrics/BlockLength
