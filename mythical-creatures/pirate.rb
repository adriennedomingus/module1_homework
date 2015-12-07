class Pirate

  attr_accessor :name, :job, :booty, :cursed

  def initialize(name, job = "Scallywag", booty = 0, cursed = 0)
    @name = name
    @job = job
    @booty = booty
    @cursed = cursed
  end

  def cursed?
    @cursed > 2 ? true : false
  end

  def commit_heinous_act
    @cursed += 1
  end

  def rob_ship
    @booty += 100
  end

end
