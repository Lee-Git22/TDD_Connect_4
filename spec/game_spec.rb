require_relative '../lib/game'

describe Game do
  describe '#validate_input' do
    subject(:valid_input) { described_class.new}

    context 'when player types valid input of 2' do
      correct_input = 2
      it 'returns true' do
        result = valid_input.validate_input(correct_input)
        expect(result).to be true
      end
    end

    context 'when player types invalid value that is already occupied' do
      let(:game_board) { valid_input.instance_variable_get(:@board) }

      before do
        game_board.grid[0][2] = 'X'
      end

      it 'returns false' do
        invalid_input = 2
        result = valid_input.validate_input(invalid_input)
        expect(result).to be false
      end
    end
  end

  describe '#player_turn' do
    subject(:turn_check) { described_class.new }
    let(:player1) { turn_check.instance_variable_get(:@player1) }
    let(:player2) { turn_check.instance_variable_get(:@player2) }


    context "when it is player1's turn" do

      it 'returns player1' do
        return_player = turn_check.player_turn
        expect(return_player.number).to eq(player1.number)
      end
    end

    context "when it is player2's turn" do

      before do
        turn_check.instance_variable_set(:@turn, 1)
      end

      it 'returns player2' do
        return_player = turn_check.player_turn
        expect(return_player.number).to eq(player2.number)
      end
    end
  end

  describe '#game_over?' do
    context 'when a player wins' do
      subject(:end_game) { described_class.new }
      let(:board) { end_game.instance_variable_get(:@board) }
      let(:player) { instance_double(Player, number: 1, symbol: 'X') }

      before do
        allow(board).to receive(:check_row).and_return(true)
      end

      it "announces player's name" do
        expect(end_game).to receive(:puts).with('Player1 won!')
        end_game.game_over?(player)
      end
    end
  end

  describe '#draw?' do
  subject(:game_draw) { described_class.new }

  context 'when draws' do
    before do
      game_draw.instance_variable_set(:@turn, 42)
    end
    it 'prints Draw!' do
      expect(game_draw).to receive(:puts).with('Draw!')
      game_draw.draw?
    end
  end
end
end