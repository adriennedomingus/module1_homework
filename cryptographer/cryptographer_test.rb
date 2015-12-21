require 'minitest/autorun'
require 'minitest/pride'
require_relative 'cryptographer'

class EncryptionEngineTest < MiniTest::Test
end

class RotatorTest < MiniTest::Test

  def test_a_character_knows_its_index
    r = Rotator.new
    result = 12
    assert_equal result, r.map_single_letter("m")
  end

  def test_it_maps_all_characters_in_message
    r = Rotator.new
    result = [33, 4, 11, 11, 14]
    assert_equal result, r.map_message("Hello")
  end
end

class EncryptTest < MiniTest::Test

  def test_it_rotates_initial_index_to_new_index
    r = Encrypt.new
    result = [46, 17, 24, 24, 27]
    assert_equal result, r.rotate_message("Hello")
  end

  def test_it_rotates_initial_index_to_new_index_with_wraparound
    r = Encrypt.new
    result = [46, 17, 24, 24, 27, 10]
    assert_equal result, r.rotate_message("Hello?")
  end

  def test_it_maps_rotated_indices_to_new_message
    r = Encrypt.new
    result = "UryyB"
    assert_equal result, r.encrypt("Hello")
  end
end

class DecryptTest < MiniTest::Test

  def test_it_rotates_initial_index_to_new_index
    r = Decrypt.new
    result = [33, 4, 11, 11, 14]
    assert_equal result, r.rotate_message("UryyB")
  end

  def test_it_rotates_initial_index_to_new_index_with_wraparound
    r = Decrypt.new
    result = [33, 4, 11, 11, 14, 82]
    assert_equal result, r.rotate_message("UryyBk")
  end

  def test_it_maps_rotated_indices_to_new_message
    r = Decrypt.new
    result = "Hello"
    assert_equal result, r.decrypt("UryyB")
  end
end
