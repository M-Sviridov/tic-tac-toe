# frozen_string_literal: true

require_relative 'game_rules'
require_relative 'board'
require_relative 'players'
require 'pry'
# Class representing the game
class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def play_game
    while game_rules.winner? == false
      player1_play
      print_board
      return print "#{@player1.name} is the winner!\n" if game_rules.winner?

      player2_play
      print_board
      return print "#{@player2.name} is the winner!\n" if game_rules.winner?
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

# Adding a method to the Object class to check if variable is number
class Object
  def number?
    to_f.to_s == to_s || to_i.to_s == to_s
  end
end

player1 = Players.new
print 'Player 1, enter your name: '
name = gets.chomp
player1.name = name

print "#{player1.name}, enter your marker (anything except digits): "
marker = gets.chomp
while marker.strip.number?
  print "#{player1.name}, enter correct marker (anything except digits): "
  marker = gets.chomp
  player1.marker = marker
end
player1.marker = marker

player2 = Players.new
print 'Player 2, enter your name: '
name = gets.chomp
player2.name = name

print "#{player2.name}, enter your marker (anything except digits): "
marker = gets.chomp
while marker.strip.number?
  print "#{player2.name}, enter correct marker (anything except digits): "
  marker = gets.chomp
  player2.marker = marker
end
player2.marker = marker
print "\n"

binding.pry

game = Game.new(player1, player2)
board = Board.new
board.print_board
# game.play_game
