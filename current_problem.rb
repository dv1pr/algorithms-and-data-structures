class Node
  attr_accessor :data, :left, :right
  def initialize(data)
    @data = data
  end
end

root = Node.new(7)
root.left = Node.new(3)
root.right = Node.new(12)
