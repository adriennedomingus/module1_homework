require 'minitest/autorun'
require 'minitest/pride'
require_relative 'ruby_in_ruby_string'

class SimpleStringTest < Minitest::Test
  def test_length
    a_string = SimpleString.new("hello")
    assert_equal 5, a_string.length
  end

  def test_length_of_empty_string
    a_string = SimpleString.new("")
    assert_equal 0, a_string.length
  end

  def test_true_end_with_single_character
    a_string = SimpleString.new("hello")
    assert a_string.end_with?("o")
  end

  def test_false_end_with_single_character
    a_string = SimpleString.new("hello")
    refute a_string.end_with?("x")
  end

  def test_true_end_with_multiple_characters
    a_string = SimpleString.new("hello")
    assert a_string.end_with?("llo")
  end

  def test_false_end_with_multiple_characters
    a_string = SimpleString.new("hello")
    refute a_string.end_with?("elo")
  end

  def test_upcase_single_character
    a_character = SimpleString.new
    assert_equal "M", a_character.upcase_character("m")
  end

  def test_upcase_longer_string
    a_string = SimpleString.new("hello")
    assert_equal "HELLO", a_string.upcase
  end

  def test_adds_two_strings_together
    a_string = SimpleString.new("hello")
    second_string = SimpleString.new("BYE")
    assert_equal "helloBYE", a_string + second_string 
  end
end
