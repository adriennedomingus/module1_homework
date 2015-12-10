require_relative 'list'

class JungleBeat

  attr_accessor :beat, :list

  def initialize(beat = nil)
    @beat = beat
    if @beat != nil
      beats = @beat.split
      @head = Node.new(beats[0])
      @list = List.new(@head)
      beats[1..-1].each do |beat|
        list.append(beat)
      end
    end
  end

  def append(beats)
    initial_count = @list.count
    appending = beats.split
    appending.each do |beat|
      @list.append(beat)
    end
    return @list.count - initial_count
  end

  def prepend(beats)
    initial_count = @list.count
    prepending = beats.split
    prepending.reverse.each do |beat|
      @list.prepend(beat)
    end
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
