require 'minitest/autorun'
require_relative '../lib/table'

class TableTest < Minitest::Test

  def setup
    @table = Table.new
  end

  def test_southwest_limit
    assert_equal(true, @table.valid_move?(0,0))
  end

  def test_northeast_limit
    assert_equal(true, @table.valid_move?(4,4))
  end

  def test_western_out_of_bounds
    assert_equal(false, @table.valid_move?(-1,0))
  end

  def test_eastern_out_of_bounds
    assert_equal(false, @table.valid_move?(5,0))
  end

  def test_southern_out_of_bounds
    assert_equal(false, @table.valid_move?(0,-1))
  end

  def test_northern_out_of_bounds
    assert_equal(false, @table.valid_move?(0, 5))
  end

  def test_add_obstacle
    @table.add_obstacle(1,1)
    assert_equal(true, @table.obstacles.include?([1,1]))
  end

  def test_add_obstacle_out_of_bounds
    @table.add_obstacle(-1,1)
    assert_equal(0, @table.obstacles.length)
  end

  def test_add_duplicate_obstacle_coordinates
    @table.add_obstacle(1,1)
    @table.add_obstacle(1,1)
    assert_equal(1, @table.obstacles.length)
  end

  def test_obstacle_location?
    @table.add_obstacle(1, 2)
    assert_equal(true, @table.obstacle_location?(1, 2) )
  end

  def test_map_output
    assert_output(/OOOOO\nOOOOO\nOOOOO\nOXOOO\nOOOOO/) do
      @table.add_obstacle(1,1)
      @table.map
    end
  end
end