require 'minitest/autorun'
require './robot_classes'

class TestRobot < Minitest::Test

  def setup
    @table = Table.new
  end

  def test_table_limits
    assert_equal(true, @table.in_bounds?(0,0))
    assert_equal(true, @table.in_bounds?(4,4))
    assert_equal(false, @table.in_bounds?(-1,0))
    assert_equal(false, @table.in_bounds?(5,0))
    assert_equal(false, @table.in_bounds?(0,-1))
    assert_equal(false, @table.in_bounds?(0, 5))
  end


end