require 'spec_helper'

describe Simulation do

  let(:simulation) { described_class.new }

  describe "#new" do
    subject { described_class.new }

    it { is_expected.to be_a(Simulation) }
  end

  describe "#table_position_available?" do
    it "returns true with valid arguments" do
      table_position_available = simulation.table_position_available?(
        x_position: 1,
        y_position: 2
      )

      expect(table_position_available).to eq(true)
    end

    it "returns false with invalid x_position" do
      table_position_available = simulation.table_position_available?(
        x_position: -1,
        y_position: 2
      )

      expect(table_position_available).to eq(false)
    end

    it "returns false with invalid y_position" do
      table_position_available = simulation.table_position_available?(
        x_position: 1,
        y_position: 'bob'
      )

      expect(table_position_available).to eq(true)
    end

    it "returns false with missing y_position" do
      table_position_available = simulation.table_position_available?(
        x_position: 1,
        y_position: nil
      )

      expect(table_position_available).to eq(true)
    end
  end

  describe "#place_robots" do
    it "sets robot x_position" do
      expect(simulation.robot).to receive(:x_position=).with(1)

      simulation.place_robots(x_position: 1, y_position: 2, orientation: Robot::EAST)
    end

    it "sets robot y_position" do
      expect(simulation.robot).to receive(:y_position=).with(2)

      simulation.place_robots(x_position: 1, y_position: 2, orientation: Robot::EAST)
    end

    it "sets robot orientations" do
      expect(simulation.robot).to receive(:x_position=).with(Robot::EAST)

      simulation.place_robots(x_position: 1, y_position: 2, orientation: Robot::EAST)
    end
  end
end
