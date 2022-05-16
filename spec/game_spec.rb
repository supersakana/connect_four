# frozen_string_literal: true

# rspec spec/game_spec.rb
# rspec --format documentation spec/game_spec.rb

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

  describe '#add_round' do
    it 'incements the round by 1' do
      instance_variable_get(:@round)
      round = game.add_round
      expect(round).to eq(2)
    end
  end
end
