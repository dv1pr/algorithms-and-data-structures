class Node
  attr_accessor :data, :next_node, :prev_node

  def initialize(data, next_node = nil, prev_node = nil)
    @data = data
    @next_node = next_node
    @prev_node = prev_node
  end

  def next? 
    !@next_node.nil?
  end

  def prev?
    !@prev_node.nil?
  end
end

class Stack
  def initialize(data)
    @head = Node.new(data)
    @tail = @head
  end

  def push(data)
    old_head = @head
    @head = Node.new(data, old_head)
    old_head.prev_node = @head
  end

  def shift(num = 1)
    num.times do
      curr_node = @tail
      p curr_node.data
      @tail = curr_node.prev_node
    end
  end

  def display
    curr_node = @head
    while curr_node.next? && curr_node != @tail
      p curr_node.data
      curr_node = curr_node.next_node
    end
    p curr_node.data
  end
end


stack = Stack.new(1)
(2..10).each {|n| stack.push(n)}

puts "\n----- SHIFT -----"
stack.shift(3)

puts "\n----- DISPLAY -----"
stack.display()