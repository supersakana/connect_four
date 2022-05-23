# frozen_string_literal: true

# rspec spec/game_spec.rb
# rspec --format documentation spec/game_spec.rb

# rubocop:disable Metrics/BlockLength

require 'pry-byebug'
require_relative '../lib/game'

describe Game do
  let(:first_player) { double('player', name: 'Zac', move: 'X') }
  let(:second_player) { double('player', name: 'Zoe', move: 'O') }
  subject(:game) { described_class.new(first_player, second_player) }

  describe '#game_loop' do
    context 'when a single loop runs' do
      before do
        allow(first_player).to receive(:winner?).and_return(false, true)
        allow(second_player).to receive(:winner?).and_return(false)
        allow(game).to receive(:play_round)
      end
      it 'prints the game board' do
        game.instance_variable_get(:@board)
        expect(game.board).to receive(:print_board).once
        game.game_loop
      end
    end
    context 'when a winner is declared after 5 rounds' do
      before do
        allow(first_player).to receive(:winner?).and_return(false, false, false, false, false, true)
        allow(second_player).to receive(:winner?).and_return(false, false, false, false, false)
        allow(game).to receive(:play_round)
      end
      it 'breaks the loop' do
        game.instance_variable_get(:@board)
        expect(game.board).to receive(:print_board).exactly(5).times
        game.game_loop
      end
    end
  end

  describe '#turn_player' do
    context 'when the round is odd' do
      it 'returns the first player' do
        instance_variable_get(:@round)
        @round = 3
        expect(game).to receive(:turn_player).and_return(first_player)
        game.turn_player
      end
    end
    context 'when the round is even' do
      it 'returns the second player' do
        instance_variable_get(:@round)
        @round = 4
        expect(game).to receive(:turn_player).and_return(second_player)
        game.turn_player
      end
    end
  end

  describe '#verify' do
    context 'when a choice is valid' do
      it 'updates the board and user history' do
        valid_input = 3
        expect(game).to receive(:update)
        game.verify(valid_input, first_player)
      end
    end
    context 'when a choice is invalid' do
      it 'displays error message' do
        allow(game).to receive(:play_round)
        invalid_input = 9
        expect(game).to receive(:display_error)
        game.verify(invalid_input, first_player)
      end
      it 'recalls #play_round' do
        allow(game).to receive(:display_error)
        invalid_input = 'q'
        expect(game).to receive(:play_round)
        game.verify(invalid_input, first_player)
      end
    end
  end

  describe '#valid?' do
    context 'when a valid input is passed' do
      it 'returns true' do
        valid_input = '2'
        result = game.valid?(valid_input)
        expect(result).to be_truthy
      end
    end
    context 'when an invalid input is passed' do
      it 'returns false' do
        invalid_input = '0'
        result = game.valid?(invalid_input)
        expect(result).to be_falsey
      end
    end
  end

  describe '#update' do
    it 'increments a round by 1' do
      game.instance_variable_get(:@board)
      game.instance_variable_set(:@round, 3)

      allow(game.board).to receive(:update_board)
      allow(first_player).to receive(:update_history)
      allow(first_player).to receive(:chip)

      game.update(1, first_player)
      expect(game.round).to eq(4)
    end
  end
end
# rubocop:enable Metrics/BlockLength
