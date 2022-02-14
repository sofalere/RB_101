# https://www.codewars.com/kata/5c55ad8c9d76d41a62b4ede3/train/ruby


# ALGORITHM
# 1. sort array
# 2. slice when number is different
#     [1], [2, 2], [5, 5]
#     [1], [2, 2, 2, 2], [6, 6], [20, 20]
#     [0, 0, 0, 0, 0]
# 3. divide each arr size that is more than 1 by 2, add those numbers


# def pairs(arr)
#   subarrays = arr.sort.slice_when { |x, y| x != y }.to_a
#   pairs = 0
#   subarrays.each do |sub|
#     pairs += sub.size / 2 if sub.size > 1
#   end
#   pairs
# end

# def pairs(array)
#   pairs = 0
#   array.uniq.each do |num|
#     count = array.count(num)
#       pairs += ( count / 2 ) if count > 1
#   end
#   pairs
# end