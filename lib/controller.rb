
require_relative '../lib/table'
require_relative '../lib/robot'
require_relative '../lib/input'
require_relative '../lib/process_command'

class Controller

  def main
    table = Table.new
    robot = Robot.new
    input = Input.new
    process_cmd = ProcessCommand.new

    loop do
      input.enter_command
      break if input.quit?
      process_cmd.execute_command(input.command, robot, table)
    end
  end

end