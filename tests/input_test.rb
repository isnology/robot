require 'minitest/autorun'
require './table'
require './robot'
require './input'

class InputTest < Minitest::Test

  def setup
    @table = Table.new
    @robot = Robot.new
    @input = Input.new
  end

  def test_place_and_report_command
    mimic_input_command("place 1,1,north")
    @input.execute_command(@robot, @table)
    assert_output(/Output: 1, 1, NORTH/) do
      @robot.report
    end
  end

  def test_move_command
    mimic_input_command("place 1,1,north")
    @input.execute_command(@robot, @table)
    mimic_input_command("move")
    @input.execute_command(@robot, @table)
    assert_output(/Output: 1, 2, NORTH/) do
      @robot.report
    end
  end

  def test_left_command
    mimic_input_command("place 1,1,north")
    @input.execute_command(@robot, @table)
    mimic_input_command("left")
    @input.execute_command(@robot, @table)
    assert_output(/Output: 1, 1, WEST/) do
      @robot.report
    end
  end

  def test_right_command
    mimic_input_command("place 1,1,north")
    @input.execute_command(@robot, @table)
    mimic_input_command("right")
    @input.execute_command(@robot, @table)
    assert_output(/Output: 1, 1, EAST/) do
      @robot.report
    end
  end

  def mimic_input_command(str)
    stdin = $stdin
    $stdin = StringIO.new(str)
    @input.command
  ensure
    $stdin = stdin
  end
end