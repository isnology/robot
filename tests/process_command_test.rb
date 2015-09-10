require 'minitest/autorun'
require_relative '../lib/table'
require_relative '../lib/robot'
require_relative '../lib/process_command'

class ProcessCommandTest < Minitest::Test

  def setup
    @process_cmd = ProcessCommand.new
    @table = Table.new
    @robot = Robot.new
  end

  # end to end test
  def test_end_to_end_from_process_command
    assert_output(/Output: 1, 2, EAST\n\nOOOOO\nOXOOO\nOOOOO\nOOOOO\nOOOOO/) do
      @process_cmd.execute_command(["place",1,1,"north"], @robot, @table)
      @process_cmd.execute_command(["move"], @robot, @table)
      @process_cmd.execute_command(["place_object"], @robot, @table)
      @process_cmd.execute_command(["right"], @robot, @table)
      @process_cmd.execute_command(["report"], @robot, @table)
      @process_cmd.execute_command(["map"], @robot, @table)
    end
  end
end