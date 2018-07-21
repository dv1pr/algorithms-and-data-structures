require 'benchmark/ips'

module BinaryTree
  class Node
    attr_reader :value
    attr_accessor :left, :right

    def initialize(v)
      @value = v
    end

    def insert(v)
      case value <=> v 
        when 1 then left ? left.insert(v) : self.left = Node.new(v)
        when -1 then right ? right.insert(v) : self.right = Node.new(v)
        when 0 then false  # Current node is value
      end
    end

    def include?(v)
      case value <=> v
      when 1 
        left ? left.include?(v) : false
      when -1 
        right ? right.include?(v) : false
      when 0 then true
      end
    end

    def inspect
      "{#{value}::#{left.inspect}|#{right.inspect}}"
    end
  end
end

test_array = []
test_array |= [(rand 50000)] until test_array.size == 5000

tree = BinaryTree::Node.new(test_array.first) 
test_array.each { |v| tree.insert(v) }

Benchmark.ips do |bm|
  bm.report("test_array include"){ (1..50000).each { |n| test_array.include? n } }
  bm.report("test_array bsearch"){ (1..50000).each { |n| test_array.bsearch { |x| x == n } } }
  bm.report("binary tree search"){ (1..50000).each { |n| tree.include? n } }
  bm.compare!
end











# tree = BinaryTree::Node.new(10)               #=> {10:{}|{}}
# [5, 15, 3].each {|value| tree.insert(value) } #=> {10:{5:{3:{}|{}}|{}}|{15:{}|{}}}
# puts tree.include?(10) #=> true
# puts tree.include?(15) #=> true
# puts tree.include?(20) #=> false
# puts tree.include?(3)  #=> true
# puts tree.include?(2)  #=> false
# p tree
