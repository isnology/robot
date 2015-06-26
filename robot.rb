# simple robot moves on a 5 X 5 grid
# until a valid place command is received @face will be nil

class Table
  attr_accessor :grid

  def initialize
    @grid = []

  end

  def in_bounds?(x,y)
    return false if (x > 4 || x < 0) || (y > 4 || y < 0)
    true
  end
end

class Robot

  def initialize
    @face = nil
    @face_name = ['NORTH', 'EAST', 'SOUTH', 'WEST']
    @x, @y = 0, 0
  end

  def left
    if @face
      @face -= 1
      @face = 3 if @face < 0
    end
  end

  def right
    if @face
      @face += 1
      @face = 0 if @face > 3
    end
  end

  def move(table)
    case @face
      when 0
        @y += 1 if table.in_bounds?(@x, @y + 1)
      when 1
        @x += 1 if table.in_bounds?(@x + 1, @y)
      when 2
        @y -= 1 if table.in_bounds?(@x, @y - 1)
      when 3
        @x -= 1 if table.in_bounds?(@x - 1, @y)
    end
  end

  def place(x,y,face,table)
    if table.in_bounds?(x, y)
      @x, @y = x, y
      @face = @face_name.index(face.upcase)
    else
      @face = nil
    end
  end

  def report
    if @face
      puts "X =  #{@x}, Y = #{@y}, Facing #{@face_name[@face]} "
    else
      puts "No valid PLACE command received yet"
    end
  end
end

class Command

  def initialize
    @commands = ['MOVE','LEFT','RIGHT','REPORT','PLACE']
  end

  def input
    puts "Enter a command:"
    @a_command = gets.chomp.split(',').upcase
  end

  def quit?
    return true if @a_command[0] == 'QUIT'
    false
  end

  def execute(robot, table)
    case @a_command[0]
      when 'MOVE'
        robot.move(table)
      when 'LEFT'
        robot.left
      when 'RIGHT'
        robot.right
      when 'REPORT'
        robot.report
      when 'PLACE'
        robot.place(@a_command[1], @a_command[2], @a_command[3], table)
    end
  end
end

# main line

table = Table.new
robot = Robot.new
command = Command.new

loop do
  command.input
  break if command.quit?
  command.execute(robot, table)
end

