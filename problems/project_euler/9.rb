''' PROBLEM
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

a2 + b2 = c2
For example, 32 + 42 = 9 + 16 = 25 = 52.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
'''
start = Time.now

a = b = c = 1

while a < 1000 do
  while b < 1000 do
    while c < 1000 do
      if (((a ** 2) + (b ** 2)) == c ** 2) && (a + b + c == 1000)
        puts Time.now - start
        abort((a * b * c).to_s)
      end
      c += 1
    end
    b += 1
    c = 1
  end
  a += 1
  b = 1
end
