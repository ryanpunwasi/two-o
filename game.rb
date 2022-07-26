class Game
  attr_accessor :winner

  def initialize

    @winner = nil
    @turn = 0
    @players = [Player.new('Player 1'), Player.new('Player 2')]
    @current_player = @turn % @players.length
    @question = Question.new

  end

  def change_current_player
    @current_player = @turn % @players.length
  end

  def change_question
    @question = Question.new
  end

  def seperator(winner)
    if !winner
      string = '----- NEW TURN -----'
    else
      string = "----- GAME OVER -----\nGoodbye!"
    end

    string
  end

  def score(lives_1, lives_2)
    "P1: #{lives_1}/3 vs P2: #{lives_2}/3"
  end

  def start
    while !winner
      puts "#{@players[@current_player].name}: #{@question.question_string}"
      player_input = gets.chomp!

      if player_input == @question.sum.to_s
        puts "#{@players[@current_player].name}: YES! You are correct."
      else
        puts "#{@players[@current_player].name}: Seriously? No!"
        @players[@current_player].decrement_lives

        if @players[@current_player].lives == 0
          @winner = @players[0]
        end
      end

      @turn = @turn + 1
      change_current_player
      change_question
      
      puts score(@players[0].lives, @players[1].lives)
      puts seperator(@winner)
    end
  end

end