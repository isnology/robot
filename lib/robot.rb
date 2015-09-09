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

  # execute_command could be pulled out into its own class as it now interacts with both Robot and Table classes
  def execute_command(command, table)
    case command[0].upcase
      when 'MOVE'
        move(table)
      when 'LEFT'
        left
      when 'RIGHT'
        right
      when 'REPORT'
        report
      when 'PLACE'
        place(command[1].to_i, command[2].to_i, command[3].upcase, table)
      when 'PLACE_OBJECT'
        x, y = next_move
        table.add_obstacle(x, y)
      when 'MAP'
        table.map
    end
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
    if @face
      puts "\nOutput: #{@x}, #{@y}, #{@face_name[@face]}"
    else
      puts "\nNo valid PLACE command received yet"
    end
  end

  private

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
