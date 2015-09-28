require 'rspec'
require_relative '../lib/table'
require_relative '../lib/robot'
require_relative '../lib/process_command'

RSpec.describe "Process command" do

  before do
    @table = Table.new
    @robot = Robot.new
    @process_cmd = ProcessCommand.new(@robot, @table)
  end

  context "end to end test" do
    it "should out put correct map of obstacles" do
      expect do
        @process_cmd.execute_command(["place",1,1,"north"], @robot, @table)
        @process_cmd.execute_command(["move"], @robot, @table)
        @process_cmd.execute_command(["place_object"], @robot, @table)
        @process_cmd.execute_command(["right"], @robot, @table)
        @process_cmd.execute_command(["report"], @robot, @table)
        @process_cmd.execute_command(["map"], @robot, @table)
      end.to output(/OOOOO\nOXOOO\nOOOOO\nOOOOO\nOOOOO/).to_stdout
    end
  end
end