class Dragon

  attr_accessor :name, :color, :eaten, :rider

  def initialize(name = "Ramoth", color = :gold, eaten = 0, rider)
    @name = name
    @color = color
    @eaten = eaten
    @rider = rider
  end

  def eat
    @eaten += 1
  end

  def hungry?
    @eaten < 3 ? true : false
  end

end
