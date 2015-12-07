class Wizard

  attr_accessor :name, :bearded, :rested

  def initialize(name, bearded = true, rested = 0)
    @name = name
    @bearded = bearded
    @rested = rested
  end

  def bearded?
    @bearded == true ? true : false
  end

  def rested?
    @rested < 3 ? true : false
  end

  def cast
    @rested += 1
    "MAGIC MISSILE!"
  end

  def incantation(incantation)
    "sudo " + incantation
  end

end
