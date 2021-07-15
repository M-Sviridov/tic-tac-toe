# frozen_string_literal: true

# Class representing the players of the game
class Players
  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end
end

# Class representing the tic tac toe game board
class GameBoard
  attr_accessor :board

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def print_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '-----------'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '-----------'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def board_update
    print 'Player 1, make your move: '
    player1_selection = gets.chomp
    @board[player1_selection] = player1.marker
    # check if winner
    print 'Player 2, make your move: '
    player2_selection = gets.chomp
    @board[player2_selection] = player2.marker
  end

  def check_if_winner
    @board.combination(3).each do |combination|
      winner = combination[0] if combination.all? { |x| x == combination[0] }
      print winner
    end
  end
end

game_board = GameBoard.new
game_board.print_board

def create_players
  print 'Enter name of player 1: '
  name = gets.chomp
  print 'Enter maker of player 1: '
  marker = gets.chomp
  player1 = Players.new(name, marker)
  print 'Enter name of player 2: '
  name = gets.chomp
  print 'Enter maker of player 2: '
  marker = gets.chomp
  player2 = Players.new(name, marker)
end
