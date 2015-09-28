require 'rspec'
require_relative '../lib/table'
require_relative '../lib/robot'
require_relative '../lib/coordinates'

RSpec.describe "testing Table class -" do

  before do
    @table = Table.new
    @robot = Robot.new
  end

  context "outer limits" do
    it "should be valid south-west position" do
      expect(@table.valid_move?(Coordinates.new(0,0))).to be true
    end

    it "should be valid north-east position" do
      expect(@table.valid_move?(Coordinates.new(4,4))).to be true
    end
  end

  context "out of bounds should be invalid" do
    it "on western edge" do
      expect(@table.valid_move?(Coordinates.new(-1,0))).to be false
    end

    it "on eastern edge" do
      expect(@table.valid_move?(Coordinates.new(5,0))).to be false
    end

    it "on southern edge" do
      expect(@table.valid_move?(Coordinates.new(0,-1))).to be false
    end

    it "on northern edge" do
      expect(@table.valid_move?(Coordinates.new(0, 5))).to be false
    end
  end

  context "add an obstacle when in bounds" do
    it "should increase set count by one" do
      @robot.place(["place","1","1","north"], @table)
      @table.place_object(["place_object"], @robot)
      expect(@table.obstacles.size).to eq(1)
    end

    it "should be an invalid move" do
      @robot.place(["place","1","1","north"], @table)
      @table.place_object(["place_object"], @robot)
      expect(@table.valid_move?(Coordinates.new(1, 2))).to be false
    end

    it "in the same place twice should only add to set count once" do
      @robot.place(["place","1","1","north"], @table)
      @table.place_object(["place_object"], @robot)
      @table.place_object(["place_object"], @robot)
      expect(@table.obstacles.size).to eq(1)
    end
  end

  context "add an obstacle when out of bounds" do
    it "should not increase set count" do
      @robot.place(["place","0","0","south"], @table)
      @table.place_object(["place_object"], @robot)
      expect(@table.obstacles.size).to eq(0)
    end
  end

  describe "output from 'map' command" do
    it "should output to stdout" do
      @robot.place(["place","1","1","north"], @table)
      @table.place_object(["place_object"], @robot)
      expect { @table.map(["map"], @robot) }.to output(/OOOOO\nOOOOO\nOXOOO\nOOOOO\nOOOOO/).to_stdout
    end
  end
end