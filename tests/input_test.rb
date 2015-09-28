require 'rspec'
require_relative '../lib/input'

RSpec.describe "Testing Input class -" do

  before do
    @input = Input.new
  end

  it "should place multi part command into an array" do
    allow(@input).to receive(:gets) { "place 1, 1,north\n" }
    @input.enter_command
    expect(@input.command).to eq(['place','1','1','north'])
  end

  it "should place single value command into array" do
    allow(@input).to receive(:gets) { "move\n" }
    @input.enter_command
    expect(@input.command).to eq(["move"])
  end

end