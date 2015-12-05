class Vampire

  attr_accessor :name, :pet

  def initialize(name = "Dracula", pet = "bat", thirsty = true)
    @name = name
    @pet = pet
    @thirsty = thirsty
  end

  def thirsty?
    thirsty = @thirsty
  end

  def drink
    @thirsty = false
  end

end
