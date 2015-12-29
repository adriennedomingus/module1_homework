class Werewolf

  attr_reader :name, :location

  def initialize(name, location = "London")
    @name = name
    @location = location
    @human = true
    @werewolf = false
    @hungry = false
  end

  def hungry?
    @hungry
  end

  def human?
    @human
  end

  def werewolf?
    @werewolf
  end

  def change!
    @hungry = true
    if @human
      @human = false
      @werewolf = true
    else
      @human = true
      @werewolf = false
    end
  end
end
