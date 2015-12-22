require_relative '../lib/costume'
require_relative '../lib/bag'
require_relative '../lib/candy'

class TrickOrTreater

  attr_reader :costume, :bag, :sugar_level

  def initialize(costume, sugar_level = 0)
    @costume = costume
    @bag = Bag.new
    @sugar_level = sugar_level
  end

  def dressed_up_as
    costume.style
  end

  def has_candy?
    !bag.empty?
  end

  def candy_count
    bag.count
  end

  def eat
    candy = bag.candies.pop
    @sugar_level += candy.sugar
  end
end
