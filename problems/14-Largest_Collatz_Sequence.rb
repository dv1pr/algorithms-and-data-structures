''' Largest Collatz Sequence
The following iterative sequence is defined for the set of positive integers:

n → n/2 (n is even)
n → 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:
13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

It can be seen that this sequence (starting at 13 and finishing at 1)
contains 10 terms. Although it has not been proved yet (Collatz Problem),
it is thought that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.
'''
def collatz(num)
  current_chain = 0
  largest_chain = 0
  solution = 0
  @cache = Array.new(num)

  1.upto(num) do |n|
    c = n
    until c == 1
      if @cache[c]
        current_chain += @cache[c]
        break
      else
        c.even? ? (c /= 2) : (c = c * 3 + 1)
        current_chain += 1
      end
    end
    if current_chain > largest_chain
      solution = n
      largest_chain = current_chain
    end
    @cache[n] = current_chain
    current_chain = 0
  end

  return solution
end

start = Time.now()
puts collatz(1000000)
puts Time.now() - start
