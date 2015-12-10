require_relative 'list'

class JungleBeat

  attr_accessor :list
  attr_reader :beat

  def initialize(beat = nil)
    @beat = beat
    if @beat != nil
      @list = List.new
      @list.append(@beat)
    end
  end

  def append(beats)
    initial_count = @list.count
    @list.append(beats)
    return @list.count - initial_count
  end

  def prepend(beats)
    initial_count = @list.count
    @list.prepend(beats)
    return @list.count - initial_count
  end

  def all
    @list.all
  end

  def count
    @list.count
  end

  def pop(pops)
    popped = []
    pops.times do
      popped << @list.pop
    end
    return popped.reverse.join (" ")
  end

  def insert(start_point, data)
    if start_point > count
      return "Sorry, you can't insert beats beyond the scope of the list."
    else
      @list.insert(start_point, data)
    end
    all
  end

  def find(start_point, number_of_elements)
    @list.find(start_point, number_of_elements)
  end

  def include?(data)
    @list.include?(data)
  end

  def play
    all
    `say -r 500 -v Boing #{all}`
    count
  end
end
