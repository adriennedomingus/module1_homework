require_relative 'node'

class List

  attr_accessor :head, :nextnode, :data

  def initialize(head = nil)
    @head = head
  end

  def append(data)
    appending = data.split
    appending.each do |beat|
      if @head == nil
        node = Node.new(beat)
      else
        current_node = @head
        loop do
          current_node = current_node.next_node
          break if current_node.next_node == nil
        end
        current_node.next_node = Node.new(beat)
      end
    end
  end

  def prepend(data)
    prepending = data.split
    prepending.reverse.each do |beat|
      if @head == nil
        node = Node.new(beat)
        @head = node
      else
        node = Node.new(beat)
        node.next_node = @head
        @head = node
      end
    end
  end

  def all
    if @head == nil
      ""
    else
      all_nodes = [@head.data]
      current_node = @head
      loop do
        current_node = current_node.next_node
        all_nodes << current_node.data
        break if current_node.next_node == nil
      end
      all_nodes.join(" ")
    end
  end

  def count
    total = 1
    current_node = @head
    if @head == nil
      total
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
      @head = nil
    else
      loop do
        current_node.next_node = nil if current_node.next_node.next_node == nil
        current_node = current_node.next_node
        break if current_node == nil
      end
    end
  end

  def include?(data)
    current_node = @head
    if current_node.data == data
      true
    else
      current_node = current_node.next_node
      current_node.data == data ? true : false
    end
  end

end
