#https://github.com/turingschool/waypoints#object-oriented-programming

class Horse

  def initialize(gallop = false)
    @gallop = gallop
  end

  def galloping?
    if @gallop == true
      true
    else
      false
    end
  end

  def gallop
    @gallop = true
  end

  def rest
    @gallop = false
  end
end
