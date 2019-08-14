def twoStrings(s1, s2)
  hist = {}

  if s1.length <= s2.length
    smaller, larger = s1, s2
  else
    larger, smaller = s1, s2
  end

  smaller.each_char do |s|
    hist[s] ? hist[s] += 1 : hist[s] = 0
  end

  larger.each_char do |l|
    if hist[l]
      p "YES"
      return
    end 
  end

  p "NO"
end

pairs = [["hello", "world"], ["hi", "world"]]
pairs.map{|p| twoStrings(p[0], p[1]) }
