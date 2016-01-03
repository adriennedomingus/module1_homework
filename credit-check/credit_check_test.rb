#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'credit_check'

class CreditCheckTest < Minitest::Test
  def test_doubles_every_other
    number = "4929735477250543"
    assert_equal [8, 9, 4, 9, 14, 3, 10, 4, 14, 7, 4, 5, 0, 5, 8, 3], CreditCheck.double_every_other(number)
  end

  def test_adds_digits_of_two_digit_numbers
    number = "4929735477250543"
    assert_equal [8, 9, 4, 9, 5, 3, 1, 4, 5, 7, 4, 5, 0, 5, 8, 3], CreditCheck.add_double_digits(number)
  end

  def test_adds_all_together
    number = "4929735477250543"
    assert_equal 80, CreditCheck.add_all(number)
  end

  def test_valid_number
    number = "5541808923795240"
    assert CreditCheck.valid?(number)
  end

  def test_invalid_number
    number = "6011797668868728"
    refute CreditCheck.valid?(number)
  end

  def test_valid_amex
    number = "342804633855673"
    assert CreditCheck.valid?(number)
  end

  def test_invalid_amex
    number = "342801633855673"
    refute CreditCheck.valid?(number)
  end

end
