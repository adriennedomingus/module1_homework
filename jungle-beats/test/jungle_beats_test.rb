require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/jungle_beats'


class JungleBeatTest < MiniTest::Test

  def test_it_appends
    jb = JungleBeat.new("deep tee")
    jb.append("deep bop bop deep")
    assert_equal "deep tee deep bop bop deep", jb.all
  end

  def test_all
    jb = JungleBeat.new("deep dep dep deep")
    assert_equal "deep dep dep deep", jb.all
  end

  def test_prepend_adds_new_elements_to_beginning_of_list
    jb = JungleBeat.new("deep dep dep deep")
    jb.prepend("deep bop bop deep")
    assert_equal "deep bop bop deep deep dep dep deep", jb.all
  end

  def test_it_includes_requested_elements
    jb = JungleBeat.new("deep dep dep deep")
    assert jb.include?("dep")
  end

  def test_it_does_not_include_requested_elements
    jb = JungleBeat.new("deep dep dep deep")
    refute jb.include?("bop")
  end

  def test_pop_removes_last_element_in_list
    jb = JungleBeat.new("deep dep dep deep")
    jb.pop(1)
    assert_equal "deep dep dep", jb.all
  end

  def test_it_can_remove_more_than_one_element
    jb = JungleBeat.new("deep dep dep deep")
    jb.pop(2)
    assert_equal "deep dep", jb.all
  end

  def test_it_counts_all_beats
    jb = JungleBeat.new("deep dep dep deep")
    assert_equal 4, jb.count
  end

  def test_it_inserts_new_node_at_specified_location
    jb = JungleBeat.new("deep dep dep deep")
    jb.insert(1, "tee beep")
    assert_equal "deep tee beep dep dep deep", jb.all
  end

  def test_it_finds_beats_at_requested_location
    jb = JungleBeat.new("deep dep beep bop")
    assert_equal "dep", jb.find(1, 1)
  end


end
