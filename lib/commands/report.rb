require 'command'

module Commands
  class Report < :Command

    def execute
      return unless valid?

      puts @simulation.current_robot_position.values.join(',')
    end

    def valid?
      valid_table_position? && valid_orientation?
    end

    private

    def valid?
      @simulation.robot_placed?
    end
  end
end
