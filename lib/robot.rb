# until a valid place command is received @face will be nil
require_relative '../lib/coordinates'

# model of MVC

class Robot

  NINETY_DEGREES = 1
  LOOP_AROUND = 0x03

  def initialize
    @face = nil
    @face_name = ['NORTH', 'EAST', 'SOUTH', 'WEST']
    @move = [Coordinates.new(0,1), Coordinates.new(1,0), Coordinates.new(0,-1), Coordinates.new(-1,0)]
    @coordinates = Coordinates.new(-1,-1)
  end

  def left(*args)
    @face = @face - NINETY_DEGREES & LOOP_AROUND if placed?
  end

  def right(*args)
    @face = @face + NINETY_DEGREES & LOOP_AROUND if placed?
  end

  def move(*args, table)
    # ignore command if result invalid
    @coordinates = next_move if placed? && table.valid_move?(next_move)
  end

  def place(command, table)
    new_coord = Coordinates.new(command[1].to_i, command[2].to_i)
    face = command[3].upcase

    # ignore command if invalid
    if table.valid_move?(new_coord) && @face_name.index(face)
      @coordinates = new_coord
      @face = @face_name.index(face)
    end
  end

  def report(*args)
    puts placed? ? "\nOutput: #{@coordinates.x}, #{@coordinates.y}, #{@face_name[@face]}" :
             "\nNo valid PLACE command received yet"
  end

  def next_move
    @coordinates + @move[@face.to_i]
  end

  def placed?
    @face != nil
  end

  def method_missing(meth, *args)
    # method may be in Table object so delegate
    # received -> meth(command, table) send -> table.meth(command, robot)
    args[1].__send__(meth, args[0], self)
  end
end
