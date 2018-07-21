# least recently used cache list

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


class DoublyLinkedList
  def initialize(data)
    @head = Node.new(data, nil)
  end

  def append(data) 
    curr_node = @head 
    while curr_node.next?
      curr_node = curr_node.next_node 
    end
    new_node = Node.new(data, nil, curr_node)
    curr_node.next_node = new_node
  end

  def prepend(data)
    old_head = @head 
    @head = Node.new(data, old_head)
    old_head.prev_node = @head
  end

  def display
    curr_node = @head 
    while curr_node.next?
      p curr_node.data 
      curr_node = curr_node.next_node
    end
    p curr_node.data
  end

  def find(data)
    curr_node = @head
    position = 1
    found = false
    while curr_node
      if curr_node.data == data 
        found = true
        break
      else 
        curr_node = curr_node.next_node
        position += 1
      end
    end
    if found
      puts "Found Target: #{curr_node.data} is at position #{position}"
      puts "Prev Node: " + (curr_node.prev? ? curr_node.prev_node.data.to_s : "none - target is head node")
      puts "Next Node: " + (curr_node.next? ? curr_node.next_node.data.to_s : "none - target was last node")
    else
      puts "Not found" if !found
    end
  end

  def insert_before(data, target_data)
    curr_node = @head 
    while curr_node.next?
      if curr_node.next_node.data == target_data
        new_node = Node.new(data, curr_node.next_node, curr_node)
        curr_node.next_node = new_node 
        curr_node.next_node.prev_node = new_node
        break
      else
        curr_node = curr_node.next_node
      end
    end
  end
end


# create linked list, initialized with a 1 as head
dll = DoublyLinkedList.new(1)

# append
(2..10).each {|x| dll.append(x)}

# prepend
(-1).downto(-10).each {|x| dll.prepend(x)}

# find
puts "\n----- FIND 4 -----"
dll.find(4)

# find edge cases (literally)
puts "\n----- FIND -10 -----"
dll.find(-10)
puts "\n----- FIND 10 -----"
dll.find(10)
puts "\n----- FIND 15 (out of range) -----"
dll.find(15)

# insert 
dll.insert_before("inserted here", 7)

# display
puts "\n----- DISPLAY -----"
dll.display()
