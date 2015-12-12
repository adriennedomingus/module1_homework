require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/enigma'

class EnigmaTest < MiniTest::Test

  def test_it_generates_a_random_key
    skip
  end

  def test_it_encrypts_a_message
    static_date = Time.new 2015, 12, 10
    e = Enigma.new("test ..end..", 97521, static_date)
    result = "fd7gw n4,cny"
    assert_equal result, e.encrypt(@message)
  end

  def test_it_decrypts_message
    static_date = Time.new 2015, 12, 10
    e = Enigma.new("fd7gw n4,cny", 97521, static_date)
    result = "test ..end.."
    assert_equal result, e.decrypt("fd7gw n4,cny")
  end

  def test_it_cracks_and_decrypts_message
    static_date = Time.new 2015, 12, 10
    e = Enigma.new("fd7gw n4,cny", static_date)
    result = "test ..end.."
    assert_equal result, e.crack(@input)
  end
end
