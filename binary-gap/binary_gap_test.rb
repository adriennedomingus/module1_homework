require 'minitest/autorun'
require 'minitest/pride'
require_relative './binary_gap'

class BinaryGapTest < MiniTest::Test
  def test_converts_to_binary
    bg = BinaryGap.new(9)
    assert_equal( bg.to_binary, "1001")
  end

  def test_no_gap
    bg = BinaryGap.new(15)

    assert_equal(bg.solution, 0)
  end

  def test_measures_one_gap
    bg = BinaryGap.new(20)

    assert_equal(bg.solution, 1)
  end

  def test_measures_two_gaps
    bg = BinaryGap.new(529)

    assert_equal(bg.solution, 4)
  end
end
