# simple robot moves on a 5 X 5 grid

# model of MVC

class Table

  require 'set'

  attr_reader :obstacles

  X_MAX = Y_MAX = 4

  def initialize
    @obstacles = Set.new
  end

  def add_obstacle(x, y)
    @obstacles << [x, y] if in_bounds?(x, y)
  end

  def valid_move?(x, y)
    in_bounds?(x, y) and !obstacle_location?(x, y)
  end

  def obstacle_location?(x, y)
    @obstacles.include?([x, y])
  end

  def map
    puts
    Y_MAX.downto(0) do |y|
      0.upto(X_MAX) do |x|
        print @obstacles.include?([x, y]) ? "X" : "O"
      end
      puts
    end
  end

  private

    def in_bounds?(x, y)
      !(x > X_MAX || x < 0 || y > Y_MAX || y < 0)
    end
end
