class Dragon

  attr_reader :name, :color, :rider

  def initialize(name, color, eaten = 0, rider)
    @name = name
    @color = color
    @eaten = eaten
    @rider = rider
  end

  def eat
    @eaten += 1
  end

  def hungry?
    @eaten < 3
  end
end
