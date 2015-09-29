require 'rspec'
require_relative '../spec/spec_helper'
require_relative '../lib/input'
require_relative '../lib/application'

RSpec.describe 'End to end test' do

  before do
    @app = Application.new
  end


  it 'should out put correct map of obstacles' do
    allow_any_instance_of(Input).to receive(:puts)
    allow_any_instance_of(Input).to receive(:gets).and_return("place 1,1,north\n", "move\n", "place_object\n",
                                                             "right\n", "report\n", "map\n", "quit\n")
    expect { @app.run }.to output(/Output: 1, 2, EAST\n\nOOOOO\nOXOOO\nOOOOO\nOOOOO\nOOOOO/).to_stdout
  end

end