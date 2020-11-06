require 'spec_helper'

describe CommandInterpreter do

  subject(:command_interpreter) { described_class.new(simulation: simulation) }

  let(:simulation) { instance_double(Simulation)}

  describe "#parse" do
    {
      "SELF DESTRUCT"           => Commands::Null,
      "PLACE 1, 2, EAST"        => Commands::Null,
      "PLACEit 1, 2, EAST"      => Commands::Null,
      "PLACE"                   => Commands::PLACE,
      "PLACE 1, 2, EAST"        => Commands::PLACE,
      " PLACE 1, 2, EAST"       => Commands::PLACE,
      "PLACE 1, 2,east"         => Commands::PLACE,
      "PLACE 1, 2,north,east"   => Commands::PLACE,
      "REPORT"                  => Commands::REPORT,
      "REPORT 123"              => Commands::REPORT,
      "MOVE"                    => Commands::MOVE,
      "MOVE me"                 => Commands::MOVE,
      "LEFT"                    => Commands::LEFT,
      "RIGHT"                   => Commands::RIGHT,
    }.each do |input, command|
      it "with input '#{input}' it returns a #{command} object" do
        expect(command_interpreter.parse(input).to be_a(command))
      end
    end
  end
end
