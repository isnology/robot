require 'minitest/autorun'
require '../table'

class TableTest < Minitest::Test

  def setup
    @table = Table.new
  end

  def test_responds_to_in_bounds?
    assert_respond_to(@table, :in_bounds?)
  end

  def test_southwest_limit
    assert_equal(true, @table.in_bounds?(0,0))
  end

  def test_northeast_limit
    assert_equal(true, @table.in_bounds?(4,4))
  end

  def test_western_out_of_bounds
    assert_equal(false, @table.in_bounds?(-1,0))
  end

  def test_eastern_out_of_bounds
    assert_equal(false, @table.in_bounds?(5,0))
  end

  def test_southern_out_of_bounds
    assert_equal(false, @table.in_bounds?(0,-1))
  end

  def test_northern_out_of_bounds
    assert_equal(false, @table.in_bounds?(0, 5))
  end
end