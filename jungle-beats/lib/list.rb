require_relative 'node'

class List

  attr_accessor :head, :next_node, :data

  def initialize(head = nil)
    @head = head
  end

  def append(beat)
    if @head == nil
      n1 = Node.new(beat)
      n1 = @head
    else
      current_node = @head
      until current_node.next_node == nil do
        current_node = current_node.next_node
      end
      current_node.next_node = Node.new(beat)
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
  current_node = @head
  counter = 0
  inserting = data.split.reverse
    inserting.each do |beat|
      if start_point == 0
        placeholder = @head
        @head = Node.new(data)
        @head.next_node = placeholder
      else
        # if start_point - 1  <= counter
          until counter == (start_point - 1)
            current_node = current_node.next_node
            counter += 1
          end
          placeholder = current_node.next_node
          current_node.next_node = Node.new(beat, placeholder)
        # else
        #   return "Sorry, you can't insert beats beyond the scope of the list."
        # end
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
    if start_point -1 <= counter
      number_of_elements.times do
        current_node = current_node.next_node
        requested_nodes << current_node.data
      end
    else
      return "Sorry, there are not that many beats in the list"
    end


    requested_nodes.join(" ")
  end

end
