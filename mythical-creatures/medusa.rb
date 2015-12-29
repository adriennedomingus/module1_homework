class Medusa

  attr_reader :name, :statues

  def initialize(name)
    @name = name
    @statues = []
    @alive = true
    @stares = 0
  end

  def stare(victim)
    @statues << victim
    if @statues.length > 3
      @statues.shift.unstone
    end
    @stares += 1
    victim.got_stoned
  end

  def alive?
    @stares < 5
  end
end

class Person

  attr_reader :name

  def initialize(name)
    @name = name
    @stoned = false
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
