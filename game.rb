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
    while @players[0][@lives] > 0 && @players[1][@lives] > 0
      @current_player = @players.shift
      results = @question.ask
      correct_answer?(results.to_i)
      @players << @current_player
    end
  end
 
  def correct_answer? (answers)
    if @question.correct == answers
      puts "YES! You are correct"
      puts "P1: #{@lives}/3 lives vs P2: #{@lives}/3 lives"
      puts "-------NEW TURN-------"
    else
      puts "Seriously? NO!"
      # @current_player[@lives] -= 1
      puts "P1: lives vs P2: lives"
      puts "-------NEW TURN-------"
    end
  end

  def game_over
    puts " wins with a score of 1/3"
    puts "---- That's it folks!----"
  end

end