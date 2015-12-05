class Dragon

  attr_accessor :name, :rider, :color, :eaten

  def initialize(name = "Ramoth", color = :gold, rider, eaten = 0)
    @name = name
    @color = color
    @rider = rider
    @eaten = eaten
  end

  def eating
    @eaten += 1
  end

  def hungry?
    if @eaten < 3
      true
    else
      false
    end
  end

end
