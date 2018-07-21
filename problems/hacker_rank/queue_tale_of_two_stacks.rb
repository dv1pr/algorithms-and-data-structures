'''Takes command line arguments as such:
10
1 42
2
1 14
3
1 28
3
1 60
1 78
2
2
'''


queue = []

ARGF.each do |line|
  line = line.gsub(/\R+/, '')
  if line.to_i == 1
    arr = line.split(' ').map(&:to_i)
    queue.push(arr[1])
  elsif line.to_i == 2
    queue.shift()
  elsif line.to_i == 3
    p queue.first
  end
end
