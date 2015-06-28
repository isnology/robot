require 'minitest/autorun'
require './robot_classes'

class TestRobot < Minitest::Test

  def setup
    @table = Table.new
    @robot = Robot.new
    @command = Command.new
  end

  def test_table_limits
    assert_respond_to(@table, :in_bounds?)
    assert_equal(true, @table.in_bounds?(0,0))
    assert_equal(true, @table.in_bounds?(4,4))
    assert_equal(false, @table.in_bounds?(-1,0))
    assert_equal(false, @table.in_bounds?(5,0))
    assert_equal(false, @table.in_bounds?(0,-1))
    assert_equal(false, @table.in_bounds?(0, 5))
  end

  def test_robot_commands
    assert_respond_to(@robot, :move)
    assert_respond_to(@robot, :left)
    assert_respond_to(@robot, :right)
    assert_respond_to(@robot, :report)
    assert_respond_to(@robot, :place)
  end

  def test_command_output
    assert_output(/Output: 1, 2, NORTH/) do
      @robot.place(1,2,"NORTH", @table)
      @robot.report
    end
    assert_output(/Output: 1, 2, NORTH/) do
      @robot.place(1,1,"NORTH", @table)
      @robot.move(@table)
      @robot.report
    end
  end
end