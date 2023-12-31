class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(6) { Array.new(7) {0} } 
  end

  def print_board
    @grid.each do |row|
      puts row.join(' ')
    end
  end

  def update_board(row, column, marker)
    @grid[row][column] = marker
  end

  def available_row(column)
    row = 0
    loop do
      return row if row == 5 || @grid[row + 1][column] != 0

      row += 1
    end
  end

  def check_target_horizontal(row, column, symbol)
    return if column > 3

    @grid[row][column] == symbol && 
    @grid[row][column + 1] == symbol && 
    @grid[row][column + 2] == symbol && 
    @grid[row][column + 3] == symbol
  end

  def check_target_vertical(row, column, symbol)
    return if row > 2

    @grid[row][column] == symbol && 
    @grid[row + 1][column] == symbol && 
    @grid[row + 2][column] == symbol && 
    @grid[row + 3][column] == symbol
  end

  def check_target_right_diagonal(row, column, symbol)
    return if column < 3

    @grid[row][column] == symbol && 
    @grid[row + 1][column - 1] == symbol &&
    @grid[row + 2][column - 2] == symbol && 
    @grid[row + 3][column - 3] == symbol
  end

  def check_target_left_diagonal(row, column, symbol)
    return if column > 3

    @grid[row][column] == symbol && 
    @grid[row + 1][column + 1] == symbol && 
    @grid[row + 2][column + 2] == symbol && 
    @grid[row + 3][column + 3] == symbol
  end

  def full_column?(input)
    @grid[0][input] != 0
  end

  def check_row(row, column, symbol)
    check_target_horizontal(row, column, symbol) || check_target_vertical(row, column, symbol) || check_diagonals(row, column, symbol)
  end

  def check_diagonals(row, column, symbol)
    return unless row < 3

    check_target_right_diagonal(row, column, symbol) || check_target_left_diagonal(row, column, symbol)
  end
end