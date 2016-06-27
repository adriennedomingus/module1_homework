require 'minitest/autorun'
require 'minitest/pride'
require './frog_river_one'

class FrogRiverOneTest < MiniTest::Test

  def test_given_example
    assert_equal(6, solution(5, [1, 3, 1, 4, 2, 3, 5, 4]))
  end

  def test_not_possible
    assert_equal(-1,solution(5, [1, 3, 1, 4, 3, 5, 4]))
  end
end
