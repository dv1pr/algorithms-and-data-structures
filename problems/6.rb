''' PROBLEM

The sum of the squares of the first ten natural numbers is,

1^2 + 2^2 + ... + 10^2 = 385
The square of the sum of the first ten natural numbers is,

(1 + 2 + ... + 10)^2 = 55^2 = 3025
Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

'''
start = Time.now



sum_of_squares = 0
sum = 0

(1..100).each do |d|
  sum_of_squares += (d ** 2)
  sum += d
end

puts (sum_of_squares - (sum ** 2)).abs

puts Time.now - start
