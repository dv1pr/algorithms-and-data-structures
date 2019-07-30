''' Problem
Traverse through a matrix of letters searching for how many instances of the passed in word that are connected exist. Traverse in any direction
'''

require 'matrix'

@word = ARGV[0].split('')
@size = ARGV[1].to_i
@m = Matrix.build(@size) { @word.sample }
@word_count = 0
# @m.to_a.each {|r| puts r.inspect}

def traverse_from(row, col, i)
  # if current element is what it should in the word index
  if @m[row, col] == @word[i]
    # if it equals and is the last object increase counter and return to previous iteration
    if i == @word.count - 1
      @word_count += 1
    else
      size = @size - 1

      # up
      traverse_from(row, col - 1, i + 1) if col > 0
      # upper right
      traverse_from(row + 1, col - 1, i + 1) if row < size && col < size
      # right
      traverse_from(row + 1, col, i + 1) if row < size
      # down right
      traverse_from(row + 1, col + 1, i + 1) if row < size && col < size
      # down
      traverse_from(row, col + 1, i + 1) if col < size
      # down left
      traverse_from(row - 1, col + 1, i + 1) if row > 0 && col < size
      # left
      traverse_from(row - 1, col, i + 1) if row > 0
      # upper left
      traverse_from(row - 1, col - 1, i + 1) if col > 0 && row > 0
    end
  end
end

start = Time.now
@m.each_with_index do |x, row, col|
  traverse_from(row, col, 0)
end

# @m.to_a.each {|r| puts r.inspect}
p @word_count
puts "#{(Time.now - start).round(2)} seconds"
