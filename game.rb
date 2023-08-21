# game.rb
require_relative 'player'
require_relative 'question'

class Game
  def initialize(player1_name, player2_name)
    @player1 = Player.new(player1_name)
    @player2 = Player.new(player2_name)
    @current_player = @player1
  end

  def switch_player
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  def play
    while @player1.lives > 0 && @player2.lives > 0
      question = Question.new
      puts "#{@current_player.name}: #{question.text}"
      user_answer = gets.chomp.to_i

      if user_answer == question.answer
        puts "Correct!"
      else
        puts "Incorrect!"
        @current_player.reduce_lives
      end

      puts "Scores: #{@player1.name}: #{@player1.lives}, #{@player2.name}: #{@player2.lives}"
      switch_player
    end

    winner = (@player1.lives > 0) ? @player1 : @player2
    puts "#{winner.name} wins with a score of #{winner.lives}/3"
    puts "Game Over!"
  end
end
