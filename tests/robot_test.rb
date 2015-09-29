require 'rspec'
require_relative '../spec/spec_helper'
require_relative '../lib/table'
require_relative '../lib/robot'
require_relative '../lib/Coordinates'

RSpec.describe Robot do

  before do
    @table = Table.new
    @robot = Robot.new
  end

  context 'enter a command before a valid "place" command' do
    it 'should output an error message' do
      expect { @robot.report }.to output(/No valid PLACE command received yet/).to_stdout
    end
  end

  context 'enter a valid place command' do
    it 'should report position and direction' do
      @robot.place(['place','1','2','north'], @table)
      expect { @robot.report }.to output(/Output: 1, 2, NORTH/).to_stdout
    end
  end

  context 'enter a "move" command' do
    it 'should do a move in the given direction' do
      @robot.place(['place','1','1','north'], @table)
      @robot.move(['move'], @table)
      expect { @robot.report }.to output(/Output: 1, 2, NORTH/).to_stdout
    end
  end

  context 'enter a "right" command' do
    it 'should turn to the right' do
      @robot.place(['place','1','1','north'], @table)
      @robot.right
      @robot.move(['move'], @table)
      expect { @robot.report }.to output(/Output: 2, 1, EAST/).to_stdout
    end
  end

  context 'enter a "left" command' do
    it 'should turn left' do
      @robot.place(['place','1','1','north'], @table)
      @robot.left
      @robot.move(['move'], @table)
      expect { @robot.report }.to output(/Output: 0, 1, WEST/).to_stdout
    end
  end

  context 'enter an additional "place" command' do
    it 'should place the robot at new coordinates and direction' do
      @robot.place(['place','1','1','north'], @table)
      @robot.place(['place','2','2','west'], @table)
      expect { @robot.report }.to output(/Output: 2, 2, WEST/).to_stdout
    end
  end

  context 'enter an additional but invalid "place" command' do
    it 'should ignore it' do
      @robot.place(['place','1','1','north'], @table)
      @robot.place(['place','0','5','west'], @table)
      expect { @robot.report }.to output(/Output: 1, 1, NORTH/).to_stdout
    end
  end

  context 'enter an invalid "move" command' do
    it 'should ignore it' do
      @robot.place(['place','1','1','west'], @table)
      @robot.move(['move'], @table)
      @robot.move(['move'], @table)
      expect { @robot.report }.to output(/Output: 0, 1, WEST/).to_stdout
    end
  end

  context 'obstacle blocking move' do
    it 'should not move there' do
      @robot.place(['place','1','1','north'], @table)
      @table.place_object(['place_object'], @robot)
      @robot.move(['move'], @table)
      expect { @robot.report }.to output(/Output: 1, 1, NORTH/).to_stdout
    end
  end

end