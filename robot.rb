# simple robot moves on a 5 X 5 grid

class Table
  attr_accessor :grid

  def initialize
    @grid = [][]

  end
end

class Robot

  def initialize
    @face = 0
    @face_name = ['North', 'East','South','West']
    @pos = [0,0]

  end

  def left
    @face -= 1
    @face = 3 if @face < 0
  end

  def right
    @face += 1
    @face = 0 if @face > 3
  end

  def move

  end
end

class Command

end