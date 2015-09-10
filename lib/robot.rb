# until a valid place command is received @face will be nil

# model of MVC

class Robot

  NORTH = 0
  EAST = 1
  SOUTH = 2
  WEST = 3
  NINETY_DEGREES = 1

  def initialize
    @face = nil
    @face_name = ['NORTH', 'EAST', 'SOUTH', 'WEST']
    @x, @y = 0, 0
  end

  def left
    if @face
      @face -= NINETY_DEGREES
      @face = WEST if @face < NORTH
    end
  end

  def right
    if @face
      @face += NINETY_DEGREES
      @face = NORTH if @face > WEST
    end
  end

  def move(table)
    x, y = next_move
    # ignore command if result invalid
    @x, @y = next_move if table.valid_move?(x, y)
  end

  def place(x, y, face, table)
    # ignore command if invalid
    if table.valid_move?(x, y) && @face_name.index(face)
      @x, @y = x, y
      @face = @face_name.index(face)
    end
  end

  def report
    puts @face ? "\nOutput: #{@x}, #{@y}, #{@face_name[@face]}" : "\nNo valid PLACE command received yet"
  end

  def next_move
    case @face
      when NORTH
        return @x, (@y + 1)
      when EAST
        return (@x + 1), @y
      when SOUTH
        return @x, (@y - 1)
      when WEST
        return (@x - 1), @y
    end
  end
end
