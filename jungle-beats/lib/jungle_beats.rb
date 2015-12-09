require_relative 'list'

class JungleBeat

  attr_accessor :beat, :list

  def initialize(beat)
    @beat = beat
    beats = @beat.split
    @head = Node.new(beats[0])
    @list = List.new(@head)
    beats[1..-1].each do |beat|
      list.append(beat)
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
    @list.insert(start_point, data)
    all
  end

  def find(start_point, number_of_elements)
    @list.find(start_point, number_of_elements)
  end

  def include?(data)
    @list.include?(data)
  end

  def play
    beats = all
    `say -r 100 -v Boing #{all}`
    count
  end
end
