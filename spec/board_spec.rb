require_relative '../lib/board'

describe Board do
  ### No need to test
  # describe '#print_board' do
  #   subject(:board_display) {Board.new}

  #   context 'when empty board is printed' do
  #     it 'prints 7 empty columns and 6 empty rows' do
  #       board = board_display.print_board
  #       empty_board = [[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0]]
  #       expect(board).to eq(empty_board)
  #     end
  #   end
  # end

  describe '#update_board' do
    subject(:board_update) {Board.new}
    
    context 'when updated at 1st row and 3rd column with input X' do
      before do
        board_update.update_board(1,3, "X")
      end

      it 'updates cell on the board with X' do
        board = board_update.instance_variable_get(:@grid)
        target_cell = board[1][3]
        expect(target_cell).to eq("X")
      end
    end

      context 'when updated at 5th row and 6th column with input Y' do
        before do
          board_update.update_board(5,6, "Y")
        end
  
        it 'updates cell on the board with Y' do
          board = board_update.instance_variable_get(:@grid)
          target_cell = board[5][6]
          expect(target_cell).to eq("Y")
        end
      end
  end

  describe '#check_target_horizontal' do
    subject(:row_check) {described_class.new}
    let(:grid) {row_check.instance_variable_get(:@grid)}

    before do
      grid[1][1] = 'X'
      grid[1][2] = 'X'
      grid[1][3] = 'X'
      grid[1][4] = 'X'
    end
    context 'when there is a match' do
      it 'returns true' do
        result = row_check.check_target_horizontal(1,1,'X')
        expect(result).to be true
      end
    end

  end

  describe '#check_target_vertical' do
    subject(:column_check) {described_class.new}
    let(:grid) {column_check.instance_variable_get(:@grid)}

    before do
      grid[1][1] = 'X'
      grid[2][1] = 'Y'
      grid[3][1] = 'X'
      grid[4][1] = 'X'
    end
    context 'when there is no match' do
      it 'returns true' do
        result = column_check.check_target_vertical(1,1,'X')
        expect(result).to be false
      end
    end
  end

  describe '#check_target_right_diagonal' do
    subject(:right_diagonal_check) {described_class.new}
    let(:grid) {right_diagonal_check.instance_variable_get(:@grid)}

    before do
      grid[0][4] = 'X'
      grid[1][3] = 'X'
      grid[2][2] = 'X'
      grid[3][1] = 'X'
    end
    context 'when there is a match' do
      it 'returns true' do
        result = right_diagonal_check.check_target_right_diagonal(0, 4, 'X')
        expect(result).to be true
      end
    end
  end

  describe '#check_target_left_diagonal' do
  subject(:left_diagonal_check) {described_class.new}
  let(:grid) {left_diagonal_check.instance_variable_get(:@grid)}

  before do
    grid[0][2] = 'X'
    grid[1][3] = 'X'
    grid[2][4] = 'Y'
    grid[3][5] = 'X'
  end
  context 'when there is no match' do
    it 'returns false' do
      result = left_diagonal_check.check_target_left_diagonal(0, 2, 'X')
      expect(result).to be false
    end
  end
end

end