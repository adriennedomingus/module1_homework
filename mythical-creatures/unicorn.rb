class Unicorn

  attr_accessor :name, :color

  def initialize(name, color = "white")
    @name = name
    @color = color
  end

  def white?
    @color == "white" ? true : false
  end

  def say(phrase)
    phrase.insert(0, "**;* ")
    phrase.insert(-1, " **;*")
  end

end
