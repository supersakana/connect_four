# frozen_string_literal: true

# rspec spec/board_spec.rb
# rspec --format documentation spec/board_spec.rb

# rubocop:disable Metrics/BlockLength

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
                                           1 => [0, 0, 0, 0, 0, 0, 0],
                                           2 => [0, 0, 0, 0, 0, 0, 0],
                                           3 => [0, 0, 0, 0, 0, 0, 0],
                                           4 => [0, 0, 0, 0, 0, 0, 0],
                                           5 => [2, 2, 0, 0, 0, 0, 0],
                                           6 => [1, 1, 1, 0, 0, 0, 0]
                                         })
        game_board.update_board(2, 2)
        expect(game_board.cells[4][1]).to eq(2)
      end
    end
  end

  describe '#tie?' do
    context 'when the board is not filled with chips' do
      it 'returns false' do
        result = game_board.tie?
        expect(result).to be_falsey
      end
    end
    context 'when the board is filled with chips' do
      it 'returns true' do
        game_board.instance_variable_set(:@cells, {
                                           1 => [2, 1, 2, 1, 2, 1, 2],
                                           2 => [2, 1, 2, 1, 2, 1, 2],
                                           3 => [1, 2, 1, 2, 1, 2, 1],
                                           4 => [1, 2, 1, 2, 1, 2, 1],
                                           5 => [2, 1, 2, 1, 2, 1, 2],
                                           6 => [1, 2, 1, 2, 1, 2, 1]
                                         })
        result = game_board.tie?
        expect(result).to be_truthy
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
