require 'command'

module Commands
  class Right < ::Command

    def execute
      return unless valid?

      place_command.execute
    end

    def valid?
      @simulation.robot_placed?
    end

    private

    def place_command
      @place_command ||= Commands::Place.new(
        simulation: @simulation,
        arguments: @simulation.next_robot_position(:right).values
      )
    end
  end
end
