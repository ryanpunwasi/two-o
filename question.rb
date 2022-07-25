class Question
  attr_reader :addend
  attr_reader :sum
  attr_reader :question_string

  def initialize
    @addend = [1 + rand(20), 1 + rand(20)]
    @sum = @addend[0] + @addend[1]
    @question_string = "What does #{@addend[0]} plus #{@addend[1]} equal?"
  end

end
