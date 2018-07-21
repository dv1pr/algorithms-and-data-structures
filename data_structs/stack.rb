class Node
  attr_accessor :data, :next_node

  def initialize(data, next_node = nil)
    @data = data
    @next_node = next_node
  end

  def next? 
    !@next_node.nil?
  end
end

class Stack
  def initialize(data)
    @head = Node.new(data)
  end

  def prepend(data) # Prepend to end of stack
    old_head = @head
    @head = Node.new(data, old_head)
  end

  def remove(num = 1) # Remove from beginning of stack
    num.times do
      curr_node = @head
      p curr_node.data
      @head = curr_node.next_node
    end
  end

  def display
    curr_node = @head
    while curr_node.next? 
      p curr_node.data
      curr_node = curr_node.next_node
    end
    p curr_node.data
  end
end

puts "\n----- CREATE HEAD OF 1 -----"
stack = Stack.new(1)
stack.display()

puts "\n----- PREPEND NUMBERS 2 THROUGH 10 -----"
(2..10).each {|n| stack.prepend(n)}
stack.display()

puts "\n----- REMOVE FROM BEGINNING OF STACK THE LAST 3 -----"
stack.remove(3)

puts "\n----- DISPLAY -----"
stack.display()