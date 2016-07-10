require 'minitest/autorun'
require 'minitest/pride'
require './triangle'

class TriangleTest < MiniTest::Test

  def test_given_example_true
    assert_equal(1, solution([10, 2, 5, 1, 8, 20]))
  end

  def test_given_example_false
    assert_equal(0, solution([10, 50, 5, 1]))
  end
end
