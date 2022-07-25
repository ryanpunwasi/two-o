class Player
  attr_reader :name
  attr_reader :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def decrement_lives
    @lives = @lives - 1
  end

end