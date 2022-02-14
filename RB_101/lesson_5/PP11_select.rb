arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

def of_three?(int)
  int % 3 == 0
end

new = arr.map do |set|
  set.select { |num| of_three?(num) }
end

p new