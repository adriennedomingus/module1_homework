require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './tape_equilibrium'


class TapeEquilibriumTest < MiniTest::Test
  def test_returns_lowest_value
    assert_equal(1, solution([3, 1, 2, 4, 3]))
  end

  def test_another_lowest_value
    assert_equal(5, solution([7, 4, 37, 21, 17, 5]))
  end

  def test_two_elements
    assert_equal(9, solution([12, 3]))
  end

  def test_two_same_elements
    assert_equal(0, solution([1, 1]))
  end
end
