
require_relative '../lib/table'
require_relative '../lib/robot'
require_relative '../lib/input'

class Application

  def initialize
    @table = Table.new
    @robot = Robot.new
    @input = Input.new
  end

  def run
    loop do
      @input.enter_command
      break if @input.quit?
      @robot.__send__(@input.command[0].downcase, @input.command, @table)
    end
  end

end