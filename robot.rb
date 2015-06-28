# simple robot moves on a 5 X 5 grid
# until a valid place command is received @face will be nil

require './robot_classes'

table = Table.new
robot = Robot.new
command = Command.new

loop do
  command.input
  break if command.quit?
  command.execute(robot, table)
end
