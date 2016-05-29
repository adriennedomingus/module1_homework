require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './cyclic_rotation'

class CyclicRotationTest < MiniTest::Test
  def test_rotates_less_than_length
    cr = CyclicRotation.new([1, 2, 3, 4, 5])
    result = [4, 5, 1, 2, 3]

    assert_equal(result, cr.solution(2))
  end

  def test_rotates_again
    cr = CyclicRotation.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
    result = [5, 6, 7, 8, 9, 1, 2, 3, 4]

    assert_equal(result, cr.solution(5))
  end

  def test_rotates_greater_than_length
    cr = CyclicRotation.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
    result = [5, 6, 7, 8, 9, 1, 2, 3, 4]

    assert_equal(result, cr.solution(14))
  end
end
