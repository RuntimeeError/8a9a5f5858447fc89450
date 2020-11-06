class Table

  attr_reader :x_range
  attr_reader :y_range

  def initialize(dimentions: [5, 5])
    @x_range = Range.new(0, dimentions[0] - 1)
    @y_range = Range.new(0, dimentions[1] - 1)
  end
end
