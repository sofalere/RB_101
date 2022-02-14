arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

# hash = {}
# arr.each do |key, value|
#   hash[key] = value
# end

#above makes no sense but it worked?

hash = {}
arr.each do |set|
  hash[set[0]] = set[1]
end

p hash