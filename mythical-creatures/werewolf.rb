class Werewolf
  attr_accessor :name, :location, :human, :werewolf, :hungry

  def initialize(name, location = "London", human = true, werewolf = false, hungry = false)
    @name = name
    @location = location
    @human = human
    @werewolf = werewolf
    @hungry = hungry
  end

  def human?
    true if @human == true
  end

  def werewolf?
    true if @werewolf == true
  end

  def hungry?
    true if @hungry == true
  end

  def change!
    if @human == true
      @human = false
      @werewolf = true
      @hungry = true
    else
      @human = true
      @werewolf = false
      @hungry = true
    end
  end
end
