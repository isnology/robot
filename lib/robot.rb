# until a valid place command is received @face will be nil
require_relative '../lib/coordinates'

# model of MVC

class Robot

  NORTH = 0
  EAST = 1
  SOUTH = 2
  WEST = 3
  NINETY_DEGREES = 1
  LOOP_AROUND = 0x03

  def initialize
    @face = nil
    @face_name = ['NORTH', 'EAST', 'SOUTH', 'WEST']
    @move = [Coordinates.new(0,1), Coordinates.new(1,0), Coordinates.new(0,-1), Coordinates.new(-1,0)]
    @coordinates = Coordinates.new(-1,-1)
  end

  def left(command = nil, table = nil)
    @face = @face - NINETY_DEGREES & LOOP_AROUND if @face
  end

  def right(command = nil, table = nil)
    @face = @face + NINETY_DEGREES & LOOP_AROUND if @face
  end

  def move(command, table)
    # ignore command if result invalid
    ( @coordinates = next_move if table.valid_move?(next_move) ) if @face
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

  def report(command = nil, table = nil)
    puts @face ? "\nOutput: #{@coordinates.x}, #{@coordinates.y}, #{@face_name[@face]}" :
             "\nNo valid PLACE command received yet"
  end

  def next_move
    @coordinates + @move[@face.to_i]
  end
end
