class Centaur

  attr_accessor :name, :breed, :crank, :standing, :laying, :rested

  def initialize(name, breed, crank = 0, standing = true, laying = false, rested = 0)
      @name = name
      @breed = breed
      @crank = crank
      @standing = standing
      @laying = laying
      @rested = rested
  end

  def cranky?
    @crank > 2 ? true : false
  end

  def standing?
    true if @standing == true
  end

  def laying?
    true if @laying == true
  end

  def shoot
    @crank += 1
    if @crank > 2
      "NO!"
    elsif @laying == true
      "NO!"
    else
      "Twang!!!"
    end
  end

  def run
    @crank += 1
    if @crank > 2
      "NO!"
    elsif @laying == true
      "NO!"
    else
      "Clop clop clop clop!!!"
    end
  end

  def sleep
    @crank = 0
    if @standing == true
      "NO!"
    end
  end

  def lay_down
    @laying = true
    @standing = false
  end

  def stand_up
    @standing = true
    @laying = false
  end

  def drink_potion
    if @laying == false
      @rested += 1
    else
      @rested = 0
    end
  end

  def rested?
    @rested > 0 ? true : false
  end

  def sick?
    true if @rested > 1
  end

end
