require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/crack'

class CrackTest < MiniTest::Test

  def test_it_shrinks_the_message_to_4_characters
    static_date = Time.new 2015, 12, 10
    c = Crack.new(static_date)
    result = [38, 2, 13, 24]
    assert_equal result, c.map_last_four_of_encrypted("fd7gw n4,cny")
  end

  def test_it_knows_a_b_c_d_overall_rotations
    static_date = Time.new 2015, 12, 10
    c = Crack.new(static_date)
    result = [25, 38, 15, 26]
    assert_equal result, c.overall_rotators("fd7gw n4,cny")
  end

  def test_it_returns_a_number_by_which_to_shift_rotators
    static_date = Time.new 2015, 12, 10
    c = Crack.new(static_date)
    result = 2
    assert_equal result, c.order_of_rotators("mfd7gw n4,cny")
  end

  def test_it_puts_rotators_in_correct_order
    static_date = Time.new 2015, 12, 10
    c = Crack.new(static_date)
    result = [15, 26, 25, 38]
    assert_equal result, c.combined_rotation("adfd7gw n4,cny")
  end

  def test_it_decrypts_message
    static_date = Time.new 2015, 12, 10
    c = Crack.new(static_date)
    result = "test ..end.."
    assert_equal result, c.crack("fd7gw n4,cny", static_date)
  end

end
