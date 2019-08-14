def arrayManipulation(n, queries)
  largest = 0
  arr = Array.new(n + 1, 0)

  queries.each do |q|
    floor, ceil, amt = q[0] - 1, q[1] - 1, q[2]
    arr.each_with_index do |el, idx| 
      if (floor..ceil).include? (idx)
        arr[idx] += amt

        largest = arr[idx] if arr[idx] > largest
      end
    end
  end

  p largest
end

arrayManipulation(5, [[1,2,100],[2,5,100],[3,4,100]])