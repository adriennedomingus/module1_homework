require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/node'

class JungleBeatsNodeTest < MiniTest::Test

  def test_node_knows_its_data
    node = Node.new("beep")
    assert_equal "beep", node.data
  end

  def test_node_knows_its_next_node
    n1 = Node.new("beep")
    n2 = Node.new("bop")
    n1.next_node = n2
    assert_equal n2, n1.next_node
  end
end
