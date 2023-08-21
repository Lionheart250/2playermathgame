# main.rb
require_relative 'player'
require_relative 'question'
require_relative 'game'

puts "Welcome to the Math Game!"
print "Enter Player 1's name: "
player1_name = gets.chomp
print "Enter Player 2's name: "
player2_name = gets.chomp

game = Game.new(player1_name, player2_name)
game.play
