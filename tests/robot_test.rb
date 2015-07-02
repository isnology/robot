require 'minitest/autorun'
require '../table'
require '../robot'

class RobotTest < Minitest::Test

  def setup
    @table = Table.new
    @robot = Robot.new
  end

  def test_responds_to_move
    assert_respond_to(@robot, :move)
  end

  def test_responds_to_left
    assert_respond_to(@robot, :left)
  end

  def test_responds_to_right
    assert_respond_to(@robot, :right)
  end

  def test_responds_to_report
    assert_respond_to(@robot, :report)
  end

  def test_responds_to_place
    assert_respond_to(@robot, :place)
  end

  def test_invalid_report_message
    assert_output(/No valid PLACE command received yet/) do
      @robot.report
    end
  end

  def test_place_and_valid_report_messages
    assert_output(/Output: 1, 2, NORTH/) do
      @robot.place(1,2,"NORTH", @table)
      @robot.report
    end
  end

  def test_move_message
    assert_output(/Output: 1, 2, NORTH/) do
      @robot.place(1,1,"NORTH", @table)
      @robot.move(@table)
      @robot.report
    end
  end

  def test_right_message
    assert_output(/Output: 2, 1, EAST/) do
      @robot.place(1,1,"NORTH", @table)
      @robot.right
      @robot.move(@table)
      @robot.report
    end
  end

  def test_left_message
    assert_output(/Output: 0, 1, WEST/) do
      @robot.place(1,1,"NORTH", @table)
      @robot.left
      @robot.move(@table)
      @robot.report
    end
  end

  def test_additional_place_message
    assert_output(/Output: 1, 1, NORTH/) do
      @robot.place(1,1,"NORTH", @table)
      @robot.place(0,5,"WEST", @table)
      @robot.report
    end
  end

  def test_ignore_invalid_move_message
    assert_output(/Output: 0, 1, WEST/) do
      @robot.place(1,1,"WEST", @table)
      @robot.move(@table)
      @robot.move(@table)
      @robot.report
    end
  end
end