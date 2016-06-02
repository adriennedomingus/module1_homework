require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'odd_occurences'

class OddOccurencesTest < MiniTest::Test
  def test_finds_odd_one_out
    assert_equal(7, solution([9, 3, 9, 3, 9, 7, 9]))
  end

  def test_finds_odd_one_out_with_match
    assert_equal(7, solution([9, 3, 9, 3, 9, 7, 9, 7, 7]))
  end

end
