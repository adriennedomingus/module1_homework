class Centaur

  attr_reader :name, :breed

  def initialize(name, breed)
    @name = name
    @breed = breed
    @crank = 0
    @standing = true
    @rested = 0
  end

  def shoot
    if cranky? || laying?
      "NO!"
    else
      @crank += 1
      "Twang!!!"
    end
  end

  def run
    if cranky? || laying?
      "NO!"
    else
      @crank += 1
      "Clop clop clop clop!!!"
    end
  end

  def sleep
    @crank = 0
    if standing?
      "NO!"
    end
  end

  def cranky?
    @crank > 2
  end

  def standing?
    @standing
  end

  def laying?
    !@standing
  end

  def lay_down
    @standing = false
  end

  def stand_up
    @standing = true
  end

  def rested?
    @rested > 0
  end

  def drink_potion
    standing? ? @rested += 1 : @rested = 0
  end

  def sick?
    @rested > 1
  end
end
