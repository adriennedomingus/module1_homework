class Hobbit

  attr_accessor :name, :disposition, :age

  def initialize(name = "Bilbo", disposition = "homebody", age = 0)
    @name = name
    @disposition = disposition
    @age = age
  end

  def celebrate_birthday
    @age += 1
  end

  def adult?
    @age > 32 && @age < 101 ? true : false
  end

  def old?
    @age > 100 ? true : false
  end

  def has_ring?
    @name == "Frodo" ? true : false
  end

  def is_short?
    true
  end

end
