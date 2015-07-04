# simple robot moves on a grid

require './lib/table'
require './lib/robot'
require './lib/input'

table = Table.new
robot = Robot.new
input = Input.new

loop do
  input.command
  break if input.quit?
  input.execute_command(robot, table)
end
