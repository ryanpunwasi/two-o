class Game

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
    # Return 'new turn' seperator if there is no winner, return 'game over' seperator otherwise
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

  def get_other_player(current_player)
    # Return index of the non-current player
    current_player + 1 % 2
  end

  def start

    while !@winner # Run game while there is no winner

      # Print question and retrieve user answer
      puts "#{@players[@current_player].name}: #{@question.question_string}"
      player_input = gets.chomp!

      # Validate answer
      if player_input == @question.sum.to_s
        puts "#{@players[@current_player].name}: YES! You are correct."
      else
        puts "#{@players[@current_player].name}: Seriously? No!"
        @players[@current_player].decrement_lives

        # Set winner to non-current player if current player has run out of lives
        if @players[@current_player].lives == 0
          @winner = @players[get_other_player(@current_player)]
        end
      end

      @turn = @turn + 1
      change_current_player
      change_question
      
      # Print score
      puts score(@players[0].lives, @players[1].lives)

      # Print winner if winner is declared, seperator if no winner declared
      if @winner
        puts "#{@winner.name} wins with a score of #{@winner.lives}/3"
      end
      puts seperator(@winner)
      
    end
  end

end