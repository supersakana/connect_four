# frozen_string_literal: true

# rspec spec/player_spec.rb
# rspec --format documentation spec/player_spec.rb

# rubocop:disable Metrics/BlockLength

require_relative '../lib/player'

describe Player do
  subject(:player_one) { described_class.new('Zac', 'X') }
  hash = {
    1 => [0, 0, 0, 0, 0, 0, 0],
    2 => [0, 0, 0, 0, 0, 0, 0],
    3 => [0, 0, 0, 0, 0, 0, 0],
    4 => [0, 0, 0, 0, 0, 0, 0],
    5 => [0, 0, 0, 0, 0, 0, 0],
    6 => [0, 0, 0, 0, 0, 0, 0]
  }
  # to be continued...
  describe '#winner?' do
    context 'the method returns true when...' do
      it 'matches horizontally ' do
        player_one.instance_variable_set(:@history, [[3, 4], [3, 5], [3, 6], [3, 7]])
        result = player_one.winner?
        expect(result).to be_truthy
      end
      it 'matches vertically' do
        player_one.instance_variable_set(:@history, [[6, 4], [5, 4], [4, 4], [3, 4]])
        result = player_one.winner?
        expect(result).to be_truthy
      end
      it 'matches diagonally (top left to bottom right)' do
        player_one.instance_variable_set(:@history, [[2, 3], [3, 4], [4, 5], [5, 6]])
        result = player_one.winner?
        expect(result).to be_truthy
      end
      it 'matches diagonally (top right to bottom left)' do
        player_one.instance_variable_set(:@history, [[1, 7], [2, 6], [3, 5], [4, 4]])
        result = player_one.winner?
        expect(result).to be_truthy
      end
    end
    context 'the method returns false when...' do
      it 'the user does not have a winning combination' do
        player_one.instance_variable_set(:@history, [[6, 1], [6, 4], [5, 1], [4, 1]])
        result = player_one.winner?
        expect(result).to be_falsey
      end
      it 'has 4 chips horizontally but not in a row' do
        player_one.instance_variable_set(:@history, [[6, 1], [6, 2], [6, 3], [6, 5]])
        result = player_one.winner?
        expect(result).to be_falsey
      end
      it 'has 4 chips vertically but not in a row' do
        player_one.instance_variable_set(:@history, [[6, 1], [5, 1], [4, 1], [2, 1]])
        result = player_one.winner?
        expect(result).to be_falsey
      end
      it 'has 4 chips diagonally but not in a row (top left bottom right)' do
        player_one.instance_variable_set(:@history, [[2, 3], [3, 4], [4, 5], [6, 7]])
        result = player_one.winner?
        expect(result).to be_falsey
      end
      it 'has 4 chips diagonally but not in a row (top right bottom left)' do
        player_one.instance_variable_set(:@history, [[1, 7], [2, 6], [3, 5], [5, 3]])
        result = player_one.winner?
        expect(result).to be_falsey
      end
    end
  end

  describe '#update_history' do
    context 'when a valid input is passed through' do
      it 'adds the correct coordinate to player history' do
        player_one.instance_variable_get(:@history)
        player_one.update_history(7, hash)
        expect(player_one.history[0]).to eq([6, 6])
      end
    end
    context 'when user history already includes coordinates' do
      before do
        hash[6][0] = 1
        hash[6][1] = 2
        hash[5][0] = 1
        hash[6][2] = 2
      end
      it 'pushes the data to existing history' do
        player_one.instance_variable_set(:@history, [[1, 6], [1, 5]])
        player_one.update_history(1, hash)
        expect(player_one.history[-1]).to eq([0, 4])
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
