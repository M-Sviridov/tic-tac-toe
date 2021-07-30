# frozen_string_literal: true

# Module represeting the rules of the game (valid moves, who is winner...)
module GameRules
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

  def check_if_winner
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

# Class representing a player of the game
class Players
  attr_accessor :name, :marker
end

# Class representing the action of playing the game
class Game
  include GameRules

  attr_accessor :board
  attr_reader :winning_combinations

  def initialize(player1, player2)
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @player1 = player1
    @player2 = player2
  end

  def print_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '-----------'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '-----------'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]}\n "
  end

  def play_game
    while check_if_winner == false
      player1_play
      print_board
      return print "#{@player1.name} is the winner!\n" if check_if_winner

      player2_play
      print_board
      return print "#{@player2.name} is the winner!\n" if check_if_winner
    end
  end

  def player1_play
    print "#{@player1.name}, make your move: "
    player1_selection = gets.chomp.to_i
    while check_player1_move(player1_selection) == false
      print "#{@player1.name}, make your move: "
      player1_selection = gets.chomp.to_i
    end
    @board[player1_selection - 1] = @player1.marker
    print "\n"
  end

  def player2_play
    print "#{@player2.name}, make your move: "
    player2_selection = gets.chomp.to_i
    while check_player2_move(player2_selection) == false
      print "#{@player2.name}, make your move: "
      player2_selection = gets.chomp.to_i
    end
    @board[player2_selection - 1] = @player2.marker
    print "\n"
  end
end

player1 = Players.new
print 'Player 1, enter your name: '
name = gets.chomp
player1.name = name

print "#{player1.name}, enter your marker: "
marker = gets.chomp
player1.marker = marker

player2 = Players.new
print 'Player 2, enter your name: '
name = gets.chomp
player2.name = name

print "#{player2.name}, enter your marker: "
marker = gets.chomp
player2.marker = marker
print "\n"

game = Game.new(player1, player2)
game.print_board
game.play_game
