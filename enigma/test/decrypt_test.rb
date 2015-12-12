require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/decrypt'

class CrackTest < MiniTest::Test

  def test_it_rotates_the_message_to_new_indexen
    static_date = Time.new 2015, 12, 10
    d = Decrypt.new(54321, static_date)
    assert_equal 1, d.rotate_message("message")
  end
end
