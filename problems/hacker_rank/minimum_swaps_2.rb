def minimumSwaps(arr)
  swaps = 0

  until (arr.each_cons(2).all? {|a,b| (a <=> b) == -1 }) do
    arr.each_with_index do |n, i|
      if n != i + 1
        arr[n-1], arr[i] = arr[i], arr[n-1]
        swaps += 1
      end
    end
  end
  return swaps
end

p minimumSwaps("2 3 4 1 5".split(' ').map(&:to_i))
p minimumSwaps("1 3 5 2 4 6 7".split(' ').map(&:to_i))