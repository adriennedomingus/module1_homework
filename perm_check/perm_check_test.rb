require 'minitest/autorun'
require 'minitest/pride'
require './perm_check'

class PermCheckTest < MiniTest::Test
  def test_permutation
    assert_equal(1, solution([4, 3, 1, 2]))
  end

  def test_not_permutation
    assert_equal(0, solution([4, 3, 1]))
  end

  def test_first_element_missing
    assert_equal(0, solution([4, 2, 3]))
  end

  def test_single_element_input
    assert_equal(1, solution([1]))
  end

  def test_two_element_input
    assert_equal(1, solution([2, 1]))
  end

end
