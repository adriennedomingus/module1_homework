require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/list'

class ListTest < MiniTest::Test

  def test_the_list_knows_its_head
    n1 = Node.new("beep")
    n2 = Node.new("bop")
    n1.next_node = n2
    list = List.new(n1)
    assert_equal n1, list.head
  end

  def test_it_appends_new_nodes_to_the_end_of_list
    n1 = Node.new("beep")
    n2 = Node.new("bop")
    @head = n1
    n1.next_node = n2
    list = List.new(n1)
    list.append("deep dep")
    assert_equal "beep bop deep dep", list.all
  end

  def test_it_appends_if_the_list_is_empty
    list = List.new(nil)
    list.append("beep")
    assert_equal "beep", list.all
  end

  def test_it_lists_all_data
    n1 = Node.new("beep")
    n2 = Node.new("bop")
    n3 = Node.new("boop")
    @head = n1
    n1.next_node = n2
    n2.next_node = n3
    list = List.new(n1)
    assert_equal "beep bop boop", list.all
  end

  def test_it_counts_all_nodes_in_list
    n1 = Node.new("beep")
    n2 = Node.new("bop")
    n3 = Node.new("boop")
    @head = n1
    n1.next_node = n2
    n2.next_node = n3
    list = List.new(n1)
    assert_equal 3, list.count
  end

  def test_count_is_zero_when_list_is_empty
    @head = nil
    list = List.new()
    assert_equal 0, list.count
  end

  def test_pop_removes_last_element_in_list
    n1 = Node.new("beep")
    n2 = Node.new("bop")
    n3 = Node.new("boop")
    n4 = Node.new("deep")
    @head = n1
    n1.next_node = n2
    n2.next_node = n3
    n3.next_node = n4
    list = List.new(n1)
    list.pop
    assert_equal "beep bop boop", list.all
  end

  def test_pop_removes_head_if_list_has_only_one_item
    n1 = Node.new("beep")
    @head = n1
    list = List.new(n1)
    list.pop
    assert_equal 0, list.count
  end

  def test_prepend_adds_new_elements_to_beginning_of_list
    n1 = Node.new("beep")
    n2 = Node.new("bop")
    n3 = Node.new("boop")
    n1.next_node = n2
    n2.next_node = n3
    list = List.new(n1)
    list.prepend("deep dep")
    assert_equal "deep dep beep bop boop", list.all
  end

  def test_include_returns_true_when_beat_is_in_the_list
    n1 = Node.new("beep")
    n2 = Node.new("bop")
    n3 = Node.new("boop")
    n1.next_node = n2
    n2.next_node = n3
    list = List.new(n1)
    assert_equal true, list.include?("boop")
  end

  def test_include_returns_false_when_beat_is_not_in_the_list
    n1 = Node.new("beep")
    n2 = Node.new("bop")
    n3 = Node.new("boop")
    n1.next_node = n2
    n2.next_node = n3
    list = List.new(n1)
    assert_equal false, list.include?("deep")
  end

  def test_it_inserts_new_node_at_specified_location
    n1 = Node.new("beep")
    n2 = Node.new("bop")
    n3 = Node.new("boop")
    n1.next_node = n2
    n2.next_node = n3
    list = List.new(n1)
    list.insert(2, "tee dee")
    assert_equal "beep bop tee dee boop", list.all
  end

  def test_finds_requested_element
    n1 = Node.new("beep")
    n2 = Node.new("bop")
    n3 = Node.new("boop")
    n4 = Node.new("tee")
    n5 = Node.new("deep")
    n1.next_node = n2
    n2.next_node = n3
    n3.next_node = n4
    n4.next_node = n5
    list = List.new(n1)
    assert_equal "tee deep", list.find(3, 2)
  end

  def test_returns_error_if_finding_beat_beyond_scope_of_list
    n1 = Node.new("beep")
    n2 = Node.new("bop")
    n3 = Node.new("boop")
    n1.next_node = n2
    n2.next_node = n3
    list = List.new(n1)
    assert_equal "Sorry, there are not that many beats in the list", list.find(4,1)
  end

end
