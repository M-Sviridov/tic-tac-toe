# frozen_string_literal: true

# Class reprenting the board of the game and associated methods
class Board
  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def print_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '-----------'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '-----------'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]}\n "
  end

  def check_player1_move(player1_selection)
    valid = true
    if @board[player1_selection - 1] == @player1.marker ||
       @board[player1_selection - 1] == @player2.marker
      valid = false
    elsif player1_selection < 1 || player1_selection > 9
      valid = false
    end
    valid
  end

  def check_player2_move(player2_selection)
    valid = true
    if @board[player2_selection - 1] == @player1.marker ||
       @board[player2_selection - 1] == @player2.marker
      valid = false
    elsif player2_selection < 1 || player2_selection > 9
      valid = false
    end
    valid
  end
end