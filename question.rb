class Question
  attr_reader :addend
  attr_reader :sum

  def initialize
    @addend = [1 + rand(20), 1 + rand(20)]
    @sum = @addend[0] + @addend[1]
  end

end
