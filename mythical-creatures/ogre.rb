class Ogre

  attr_reader :name, :home, :swings, :encounter_counter

  def initialize(name, home = "Swamp")
    @name = name
    @home = home
    @swings = 0
    @encounter_counter = 0
  end

  def swing_a_club
    @swings += 1 if @encounter_counter % 3 == 0
  end

  def encounter(human)
    swing_a_club
    @encounter_counter += 1
    human.notices_ogre = true if @encounter_counter % 3 == 0
  end

  def hit?(human)
    human.knocked_out = true
  end

  def apologize(human)
    human.knocked_out = false
  end
end

class Human

  attr_reader :name
  attr_accessor :knocked_out, :notices_ogre

  def initialize(name = "Jane")
    @name = name
    @knocked_out = false
    @notices_ogre = false
  end

  def notices_ogre?
    notices_ogre
  end

  def knocked_out?
    knocked_out
  end
end
