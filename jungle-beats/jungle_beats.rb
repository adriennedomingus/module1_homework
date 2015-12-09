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
    appending = beats.split
    appending.each do |beat|
      @list.append(beat)
    end
  end

  def prepend(beats)
    prepending = beats.split
    prepending.reverse.each do |beat|
      @list.prepend(beat)
    end
  end

  def all
    @list.all
  end

  def count
    @list.count
  end

  def pop
    @list.pop
  end

  def insert(start_point, data)
    @list.insert(start_point, data)
  end

  def find(start_point, number_of_elements)
    @list.find(start_point, number_of_elements)
  end

  def include?(data)
    @list.include?(data)
  end

  def play
    `say -r 100 -v Boing #{@beat}`
  end
  # count
end
