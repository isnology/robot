# simple robot moves on a 5 X 5 grid

class Table

  def initialize
  end

  def in_bounds?(x, y)
    !(x > 4 || x < 0 || y > 4 || y < 0)
  end
end
