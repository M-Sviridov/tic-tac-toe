# frozen_string_literal: true

# Class representing the rules of the game
class GameRules
  def initalize(board)
    @board = board
  end

  def winner?
    winner = false
    winning_combinations = [
      [board[0], board[1], board[2]], [board[3], board[4], board[5]],
      [board[6], board[7], board[8]], [board[0], board[3], board[6]],
      [board[1], board[4], board[7]], [board[2], board[5], board[8]],
      [board[0], board[4], board[8]], [board[6], board[4], board[2]]
    ]
    winning_combinations.each do |combination|
      winner = true if combination.all? { |x| x == combination[0] }
    end
    winner
  end
end
