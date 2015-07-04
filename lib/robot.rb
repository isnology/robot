# until a valid place command is received @face will be nil

class Robot

  NORTH = 0
  EAST = 1
  SOUTH = 2
  WEST = 3

  def initialize
    @face = nil
    @face_name = ['NORTH', 'EAST', 'SOUTH', 'WEST']
    @x, @y = 0, 0
  end

  def left
    if @face
      @face -= 1
      @face = WEST if @face < NORTH
    end
  end

  def right
    if @face
      @face += 1
      @face = NORTH if @face > WEST
    end
  end

  def move(table)
    # ignore command if result invalid
    case @face
      when NORTH
        @y += 1 if table.in_bounds?(@x, @y + 1)
      when EAST
        @x += 1 if table.in_bounds?(@x + 1, @y)
      when SOUTH
        @y -= 1 if table.in_bounds?(@x, @y - 1)
      when WEST
        @x -= 1 if table.in_bounds?(@x - 1, @y)
    end
  end

  def place(x, y, face, table)
    # ignore command if invalid
    if table.in_bounds?(x, y) && @face_name.index(face.upcase)
      @x, @y = x, y
      @face = @face_name.index(face.upcase)
    end
  end

  def report
    if @face
      puts "Output: #{@x}, #{@y}, #{@face_name[@face]} "
    else
      puts "No valid PLACE command received yet"
    end
  end
end
