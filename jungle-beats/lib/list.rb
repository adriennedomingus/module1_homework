require_relative 'node'

class List

  attr_accessor :head, :next_node, :data

  def initialize(head = nil)
    @head = head
  end

  def append(data)
      if @head == nil
        node = Node.new(data)
      else
        current_node = @head
        until current_node.next_node == nil do
          current_node = current_node.next_node
        end
        current_node.next_node = Node.new(data)
      end
  end

  def prepend(beat)
    if @head == nil
      node = Node.new(beat)
      @head = node
    else
      node = Node.new(beat)
      node.next_node = @head
      @head = node
    end
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

  def insert(start_point, data)
  current_node = @head
  counter = 0
  inserting = data.split.reverse
    inserting.each do |beat|
      if start_point == 0
        placeholder = @head
        @head = Node.new(data)
        @head.next_node = placeholder
      else
        until counter == (start_point - 1)
          current_node = current_node.next_node
          counter += 1
        end
        placeholder = current_node.next_node
        current_node.next_node = Node.new(beat, placeholder)
      end
    end
  end

  def find(start_point, number_of_elements)
    current_node = @head
    counter = 0
    requested_nodes = []

    (start_point-1).times do
      current_node = current_node.next_node
      counter += 1
    end

    number_of_elements.times do
      current_node = current_node.next_node
      requested_nodes << current_node.data
    end

    requested_nodes.join(" ")
  end

end
