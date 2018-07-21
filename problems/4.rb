''' PROBLEM

A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.

'''
def is_palindrome?(product)
  product == product.to_s.reverse.to_i
end

start = Time.now

n = 101110
rng = 100...999
max = 0

rng.each do |a|
  rng.each do |b|
    product = a * b
    if is_palindrome?(product) && (product < n) && (product > max)
      max = product
    end
  end
end

puts max
puts Time.now - start
