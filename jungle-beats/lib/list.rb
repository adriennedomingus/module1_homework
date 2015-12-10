require_relative 'node'

class List

  attr_accessor :head
  attr_reader :data, :next_node

  def initialize(head = nil)
    @head = head
  end

  def append(beat)
    insert(count, beat)
  end

  def prepend(beat)
    insert(0, beat)
  end

  def all
    if @head == nil
      ""
    else
      all_nodes = [@head.data]
      current_node = @head
      until current_node.next_node == nil do
        current_node = current_node.next_node
        all_nodes << current_node.data
      end
      all_nodes.join(" ")
    end
  end

  def count
    total = 1
    current_node = @head
    if @head == nil
      total = 0
    else
      loop do
        total += 1
        current_node = current_node.next_node
        break if current_node.next_node == nil
      end
    end
    total
  end

  def pop
    current_node = @head
    if @head.next_node == nil
      temp = @head.data
      @head = nil
      return temp
    else
      until current_node.next_node.next_node == nil do
        current_node = current_node.next_node
      end
      temp = current_node.next_node.data
      current_node.next_node = nil
      return temp
    end
  end

  def include?(data)
    current_node = @head
    until current_node == nil
      return true if current_node.data == data
      current_node = current_node.next_node
    end
    false
  end

  def insert(start_point, data)
    data.split.each_with_index do |beat, index|
      insert_node(start_point + index, Node.new(beat))
    end
  end

  def insert_node(start_point, node)
    current_node = @head
    if start_point == 0
      node.next_node = current_node
      @head = node
    else
      (start_point - 1).times do
        current_node = current_node.next_node
      end
      placeholder = current_node.next_node
      node.next_node = placeholder
      current_node.next_node = node
    end
  end

  def find(start_point, number_of_elements)
    current_node = @head
    counter = 0
    requested_nodes = []
    if start_point > count
      return "Sorry, there are not that many beats in the list"
    else
      (start_point-1).times do
        current_node = current_node.next_node
        counter += 1
      end
        number_of_elements.times do
          current_node = current_node.next_node
          requested_nodes << current_node.data
        end
    end
    requested_nodes.join(" ")
  end

end
