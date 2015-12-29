class Wizard

  attr_reader :name, :spells, :bearded

  def initialize(name, bearded: true)
    @name = name
    @bearded = bearded
    @spells = 0
  end

  def bearded?
    bearded
  end

  def incantation(command)
    "sudo #{command}"
  end

  def rested?
    @spells < 3
  end

  def cast
    @spells += 1
    "MAGIC MISSILE!"
  end
end
