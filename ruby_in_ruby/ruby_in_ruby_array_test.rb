require 'minitest/autorun'
require 'minitest/pride'
require_relative 'ruby_in_ruby_array'

class SimpleArrayTest < MiniTest::Test

  def test_first
    an_array = SimpleArray.new(['a', 'b', 'c'])
    assert_equal "a", an_array.first
  end

  def test_last
    an_array = SimpleArray.new(['a', 'b', 'c'])
    assert_equal "c", an_array.last
  end

  def test_join_without_connector
    an_array = SimpleArray.new(['a', 'b', 'c'])
    assert_equal "abc", an_array.join
  end

  def test_join_with_connector
    an_array = SimpleArray.new(['a', 'b', 'c'])
    assert_equal "a-b-c", an_array.join("-")
  end

  def test_join_with_longer_connector
    an_array = SimpleArray.new(['a', 'b', 'c'])
    assert_equal "a...b...c", an_array.join("...")
  end

  def test_count
    an_array = SimpleArray.new(['a', 'b', 'c'])
    assert_equal 3, an_array.count
  end

  def test_count_empty_array
    an_array = SimpleArray.new
    assert_equal 0, an_array.count
  end
end
