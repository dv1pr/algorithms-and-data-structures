''' PROBLEM
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
'''
def init
  n = 1000
  def sum_multiples(multiple, to)
    k = (to-1) / multiple
    k * (k+1) / 2 * multiple
  end

  return sum_multiples(3, n) + sum_multiples(5, n) - sum_multiples(15, n)
end

start = Time.now()
puts init()
puts Time.now() - start


# total = 0
# (1...1000).each do |n|
#   total += n if n % 3 == 0 || n % 5 == 0
# end
#
# puts total
