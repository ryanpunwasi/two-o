class Game
  attr_accessor :winner
  def initialize
    @winner = nil
    @players = [Player.new('Player 1'), Player.new('Player 2')]
    @current_player = @players[0]
    @question = Question.new
  end
end