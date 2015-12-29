class Pirate

  attr_reader :name, :job, :cursed, :booty

  def initialize(name, job = "Scallywag")
    @name = name
    @job = job
    @cursed = 0
    @booty = 0
  end

  def cursed?
    @cursed > 2
  end

  def commit_heinous_act
    @cursed += 1
  end

  def rob_ship
    @booty += 100
  end
end
