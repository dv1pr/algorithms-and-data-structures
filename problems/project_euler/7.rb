''' PROBLEM
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10,001st prime number?
'''
start = Time.now



p_numbers = []

i = 2
until p_numbers.count == 10001 do
  d = i - 1
  flag = true
  while d != 1 && flag == true do
    if i % d == 0
      flag = false
    end
    d -= 1
  end
  if flag
    p_numbers.push(i)
  end

  i += 1
end



puts Time.now - start
