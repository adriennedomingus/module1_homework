class Werewolf

  attr_reader :name, :location

  def initialize(name, location = "London")
    @name = name
    @location = location
    @human = true
    @hungry = false
  end

  def hungry?
    @hungry
  end

  def human?
    @human
  end

  def werewolf?
    !@human
  end

  def change!
    @hungry = true
    if @human
      @human = false
    else
      @human = true
    end
  end
end
