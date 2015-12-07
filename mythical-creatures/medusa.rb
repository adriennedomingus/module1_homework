class Medusa

  attr_accessor :name, :statues, :alive, :stoned

  def initialize(name, statues = [], alive = true, stoned = 0)
    @name = name
    @statues = statues
    @alive = alive
    @stoned = stoned
  end

  def stare(victim)
    @stoned += 1
    @statues << victim
    victim.got_stoned
    if @statues.count > 3
      @statues.shift.unstone
    end
  end

  def alive?
    if @stoned < 5
      @alive = true
    else
      @alive = false
    end
  end

end

class Person

  attr_accessor :name, :stoned

  def initialize(name, stoned = false)
    @name = name
    @stoned = stoned
  end

  def stoned?
    @stoned
  end

  def got_stoned
    @stoned = true
  end

  def unstone
    @stoned = false
  end
end
