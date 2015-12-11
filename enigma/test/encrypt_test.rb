require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/encrypt'

class EncryptTest < MiniTest::Test

  # def test_it_generates_a_random_key
  #   skip
    #twice generate array of 100 random numbers
  # end

  # def test_it_generates_the_date_in_the_correct_format
  #
  # end

  def test_it_returns_a_hash_of_indexed_characters
    e = Encrypt.new
    result = {"a"=>0,"b"=>1,"c"=>2,"d"=>3,"e"=>4,"f"=>5,"g"=>6, "h"=>7,"i"=>8,
              "j"=>9,"k"=>10, "l"=>11, "m"=>12, "n"=>13, "o"=>14, "p"=>15,"q"=>16,
              "r"=>17,"s"=>18,"t"=>19,"u"=>20,"v"=>21,"w"=>22,"x"=>23,"y"=>24,
              "z"=>25,0=>26,1=>27,2=>28,3=>29,4=>30,5=>31,6=>32,7=>33,8=>34,9=>35,
              " "=>36, "."=>37,","=>38}
    assert_equal result, e.character_chart
    assert_equal Hash, result.class
  end

  def test_it_maps_a_single_letter_to_its_index
    e = Encrypt.new
    result = 12
    assert_equal result, e.map_letter("m")
  end

  def test_it_maps_a_word_to_all_indices
    e = Encrypt.new
    result = [12, 4, 18, 18, 0, 6, 4]
    assert_equal result, e.map_message("message")
  end

  def test_it_knows_which_rotator_to_use
    e = Encrypt.new
    index_of_character = [12, 4, 18, 18, 0, 6, 4]
    result = "b rotator"
    assert_equal result, e.which_rotator("message")[1][1]
  end

end
