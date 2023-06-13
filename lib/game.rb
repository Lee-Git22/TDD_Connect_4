require_relative 'board'
require_relative 'player'

class Game

  def initialize
    @board = Board.new
    @player1 = Player.new(1, "X")
    @player2 = Player.new(2, "Y")
    @turn = 0
  end

  def play
    loop do
      current_player = player_turn
      @board.print_board
      column = player_input(current_player)
      @board.update_board(@board.available_row(column), column, current_player.symbol)
      break if game_over?(current_player) || draw?
    end
    @board.print_board
  end

  def player_input(player)
    loop do
      puts "#{player.symbol} Player#{player.number}'s turn."
      puts 'Enter column number: '
      column = gets.chomp.to_i - 1
      return column if validate_input(column)

      puts "Invalid input!\n\n"
    end
  end

  def validate_input(input)
    input.between?(0, 6) && !@board.full_column?(input)
  end

  def player_turn
    @turn += 1
    @turn.odd? ? @player1 : @player2
  end

  def game_over?(player)
    6.times do |row|
      7.times do |column|
        if @board.check_row(row, column, player.symbol)
          puts "Player#{player.number} won!"
          return true
        end
      end
    end
    false
  end

  def draw?
    if @turn == 42
      puts 'Draw!'
      true
    end
  end
end