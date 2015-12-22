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

  def grab(type)
    @candies.each do |candy|
      if candy.type == type
        @candies.delete(candy)
        return candy
      end
    end
  end

  def take(number)
    @candies.pop(number)
  end
end
