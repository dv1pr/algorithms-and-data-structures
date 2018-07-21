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
  def initialize(str)
    str.each_char {|n| push(n)}
    @hsh = {'}': '{', ']': '[', ')': '('}
  end

  def push(data)
    if !@head
      @head = Node.new(data)
      @tail = @head
    else
      old_head = @head
      @head = Node.new(data, old_head)
      old_head.prev_node = @head
    end
  
  end

  def shift(num = 1)
    num.times do
      @tail = @tail.prev_node
    end
  end

  def is_match? 
    curr_node = @head
    match = true
    until curr_node.next_node == @tail
      if @tail.data == @hsh[curr_node.data.to_sym] 
        
        self.shift()
        curr_node = curr_node.next_node
      else
        match = false
        break
      end
    end
    puts (match ? "YES" : "NO")
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


# stack = Stack.new("{[()]}")
# # stack.display()
# stack.is_match?()

# stack = Stack.new("{[(])}")
# stack.is_match?()

# stack = Stack.new("{{[[(())]]}}")
# stack.is_match?()

# stack = Stack.new("{()[][{}]}")
# stack.is_match?()
# stack = Stack.new("({}{[]})({)}")
# stack.is_match?()
# stack = Stack.new("()[]")
# stack.is_match?()
# stack = Stack.new("[()][{}]{[({})[]]}")
# stack.is_match?()
# stack = Stack.new("((){)}")
# stack.is_match?()


'''
yes
no
yes

yes
no
yes
yes
no
'''


def is_balanced(expression)
  exp_stack = []
  expression.each_char do |char|
      if char == '{'
          exp_stack.push('}')
      elsif char == '['
          exp_stack.push(']')
      elsif char == '('
          exp_stack.push(')')
      else
          p char
          if (exp_stack.empty? || char != exp_stack.last)
              return false
          end
          exp_stack.pop
      end
    p exp_stack
  end
  return exp_stack.empty?
end

# p is_balanced("{[()]}")
p is_balanced("{[(])}")
# p is_balanced("{{[[(())]]}}")

# p is_balanced("{()[][{}]}")
# p is_balanced("({}{[]})({)}")
# p is_balanced("()[]")
# p is_balanced("[()][{}]{[({})[]]}")
# p is_balanced("((){)}")
