class Wizard

  attr_accessor :name, :bearded, :rested

  def initialize(name, bearded = true, rested = 0)
    @name = name
    @bearded = bearded
    @rested = rested
  end

  def bearded?
    if @bearded == true
      true
    else
      false
    end
  end

  def rested?
    if @rested < 3
      true
    else
      false
    end
  end

  def cast
    @rested += 1
    "MAGIC MISSILE!"
  end

  def incantation(incantation)
    "sudo " + incantation
  end

end
