''' PROBLEM

2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

'''

# Possible answer: 232792560

start = Time.now

rng = 1...20
num = 1
switch = false

while (switch == false)
  rng.each do |d|
    if num % d != 0
      switch = false
      break
    else
      switch = true
    end
  end
  if switch
    puts num
    break
  else
    num += 1
  end
end

finish = Time.now
puts finish - start
