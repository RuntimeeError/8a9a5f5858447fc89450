require 'command'

module Commands
  class Move < ::Command

    def execute
      return unless valid?

      place_command.execute
    end

    def valid?
      @simulation.robot_placed? && place_command.valid?
    end

    private

    def place_command
      @place_command ||= Commands::Place.new(
        simulation: @simulation,
        arguments: @simulation.next_robot_position(:move).values
      )
    end
  end
end
