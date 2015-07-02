require 'minitest/autorun'
require '../table'
require '../robot'
require '../input'

class InputTest < Minitest::Test

  def setup
    @table = Table.new
    @robot = Robot.new
    @input = Input.new
  end


end