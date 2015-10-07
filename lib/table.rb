# simple robot moves on a 5 X 5 grid

# model of MVC
require_relative '../lib/robot'
require 'set'

class Table

  attr_reader :obstacles

  X_MAX = Y_MAX = 4
  X_MIN = Y_MIN = 0

  def initialize
    @obstacles = Set.new
  end

  def place_object(*args, robot)
    coordinates = robot.next_move
    #@obstacles << coordinates.to_sym if in_bounds?(coordinates)
    @obstacles << coordinates if in_bounds?(coordinates)
  end

  def map(*args)
    puts
    coord = Coordinates.new
    Y_MAX.downto(Y_MIN) do |y|
      coord.y = y
      X_MIN.upto(X_MAX) do |x|
        coord.x = x
        #print @obstacles.include?(coord.to_sym) ? 'X' : 'O'
        print @obstacles.include?(coord) ? 'X' : 'O'
      end
      puts
    end
  end

  def valid_move?(coordinates)
    in_bounds?(coordinates) and !obstacle_location?(coordinates)
  end

  def method_missing(meth, *args)
    puts "\n\"#{meth}\" not a valid command"
  end

  private

    def obstacle_location?(coordinates)
      #@obstacles.include?(coordinates.to_sym)
      @obstacles.include?(coordinates)
    end

    def in_bounds?(coords)
      !(coords.x > X_MAX || coords.x < X_MIN || coords.y > Y_MAX || coords.y < Y_MIN)
    end
end
