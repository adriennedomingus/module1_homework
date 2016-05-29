class CyclicRotation
  attr_reader :starting_array

  def initialize(starting_array)
    @starting_array = starting_array
  end

  def solution(rotator)
    result = []
    starting_array.each_with_index do |item, index|
      result[new_index(index, rotator)] = item
    end
    result
  end

  def new_index(index, rotator)
    (index + rotator) % starting_array.length
  end

end
