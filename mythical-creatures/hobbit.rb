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
    if @age < 33
      false
    else
      true
    end
  end

  def old?
    if @age > 100
      true
    else
      false
    end
  end

  def has_ring?
    if @name == "Frodo"
      true
    else
      false
    end
  end

  def is_short?
    true
  end

end
