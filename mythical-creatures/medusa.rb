class Medusa
  attr_accessor :name, :statues, :alive

  def initialize(name, statues = [], alive = true)
    @name = name
    @statues = statues
    @alive = alive

  end

  def stare(victim)
    if @statues.count < 3
      @statues << victim
    end
    $stoned += 1
  end

  def alive?
    if $stoned < 5
      @alive = true
    else
      @alive = false
    end

  end

end

class Person

  attr_accessor :name, :stoned

  def initialize(name, stoned = 0)
    @name = name
    $stoned = stoned
  end

  def stoned?
    if $stoned > 0
      true
    else
      false
    end
  end

end
