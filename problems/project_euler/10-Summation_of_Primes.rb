''' PROBLEM
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below 2000000.
'''

start = Time.now
total = 0
# cache = Array.new(2000000)

(2..2000000).each do |i|
  d = Math.sqrt(i)
  if i % 2 != 0
    flag = true
    while flag == true do
      while d >= 2 do
        if i % d == 0
          flag = false
          break
        end
        d -= 1
      end
    end
    if flag
      total += i
    end
  end
end

puts total
puts Time.now - start

# start = Time.now
# def sieve_of_eratosfen(number)
#   arr = Array.new(number, 1)
#   arr[1] = 0
#   k = Math.sqrt(number)
#
#   (2..k).each do |i|
#     if (arr[i] == 1)
#       if i % 2 == 0
#           arr[i] == 0
#       else
#         j = i**2
#         while j <= number do
#           arr[j] = 0
#           j += i
#         end
#       end
#     end
#   end
#
#   arr
# end
#
# p sieve_of_eratosfen(2_000_000).each_with_index.map {|e, i| i if e == 1}.compact.sum
# puts Time.now - start
