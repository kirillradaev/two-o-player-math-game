require "./question.rb"

class Game

  def initialize
    @question = Question.new
    @players = []
  end

  def new_game
    puts "Please enter your names:"
    print "Player 1 > "
    user1 = $stdin.gets.chomp
    print "Player 2 > "
    user2 = $stdin.gets.chomp
    @players << Player.new(user1, 3)
    @players << Player.new(user2, 3)

    puts "Let the the mind combat begin!"
    while @players[0].lives > 0 && @players[1].lives > 0
      @current_player = @players.shift
      @players << @current_player
      results = @question.ask
      correct_answer?(results.to_i)
    end
    game_over
  end
 
  def correct_answer? (answers)
    if @question.correct == answers
      puts "YES! You are correct"
    else
      puts "Seriously? NO!"
      @current_player.lives -= 1
    end
    puts "#{@players[0].name}: #{@players[0].lives}/3 lives vs #{@players[1].name}: #{@players[1].lives}/3 lives"
    puts "-------NEW TURN-------"
  end

  def game_over
    puts "#{@players[0].name} wins with a score of #{@players[0].lives}/3"
    puts "---- That's it folks!----"
  end

end