require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/decrypt'

class DecryptTest < MiniTest::Test


  def test_it_rotates_the_message_to_new_index
    static_date = Time.new 2015, 12, 10
    d = Decrypt.new("message", 54321, static_date)
    result = [30, 37, 23, 31, 18, 0, 9]
    assert_equal result, d.rotate_message("message")
  end

end
