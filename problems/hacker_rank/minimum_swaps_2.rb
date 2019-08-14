def minimumSwaps(arr)
  swaps = 0
  first, last = 0, arr.length - 1
  p arr

  until first == last
    while arr[first] == first + 1 && first < last
      first += 1
    end
    
    if first < last
      arr[arr[first] - 1], arr[first] = arr[first], arr[arr[first] - 1]
      swaps += 1 
    end
    p arr
  end
  
  return swaps
end

p minimumSwaps("2 3 4 1 5".split(' ').map(&:to_i))
p minimumSwaps("1 3 5 2 4 6 7".split(' ').map(&:to_i))

























