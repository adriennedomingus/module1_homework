require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'frog_jump'

class FrogJumpTest < MiniTest::Test

  def test_farther_than_distance
    assert_equal 3, solution(10, 85, 30)
  end

  def test_exactly_to_distance
    assert_equal 3, solution(10, 85, 25)
  end

  def test_larger_numbers
    assert_equal 615, solution(3, 10456, 17)
  end
end
