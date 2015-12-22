require_relative 'candy'

class Bag

  def initialize(count = 0)
    @count = count
    @candies = []
  end

  def empty?
    @candies.count == 0
  end

  def count
    @candies.length
  end

  def candies
    @candies
  end

  def <<(candy)
    @candies << candy
  end

  def contains?(type)
    @candies.any? do |candy|
      candy.type == type
    end
  end
end
