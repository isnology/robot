require 'minitest/autorun'
require './lib/input'

class InputTest < Minitest::Test

  def setup
    @input = Input.new
  end

  def test_input_command_multiple_values
    mimic_input_command("place 1,1,north")
    assert_equal(['place','1','1','north'], @input.command)
  end

  def test_input_command_single_value
    mimic_input_command("move")
    assert_equal(['move'], @input.command)
  end

  def mimic_input_command(str)
    stdin = $stdin
    $stdin = StringIO.new(str)
    @input.enter_command
  ensure
    $stdin = stdin
  end
end