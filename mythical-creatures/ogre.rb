class Ogre

  attr_accessor :name, :home, :encounter_counter, :swings, :hit

  def initialize(name, home = "Swamp", encounter_counter = 0, swings = 0)
    @name = name
    @home = home
    @encounter_counter = encounter_counter
    @swings = swings
    $hit = hit
  end

  def encounter
    @encounter_counter += 1
    @swings += 1
  end

  def swing_a_club
    @swings += 1
  end

  def hit?(human)
    $hit = true if @swings % 2 == 0
  end

  def apologize(human)
    $hit = false
  end

end

class Human

  attr_accessor :name

  def initialize(name = "Jane")
    @name = name
  end

  def notices_ogre?
    @encounter_counter = 0
    true if @encounter_counter % 3 == 0
  end

  def knocked_out?
    $hit == true ? true : false
  end

end
