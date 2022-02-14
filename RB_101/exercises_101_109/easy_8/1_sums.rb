# PROBLEM:
# Write a method that takes an Array of numbers and then
# returns the sum of the sums of each leading subsequence 
# for that Array. You may assume that the Array always 
# contains at least one number.
# rules:
#   - each number is added to each number before it, that is added to the total

# algorithm:
#   - set a sums variable to 0
#   - set a sum variable to 0 
#   - iterate through each number adding it to sums
#   - add those sums to sum

def sum_of_sums(arr)
  sums = 0
  sum = 0
  arr.each do |num|
    sums += num
    sum += sums
  end
  sum
end

p  sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p  sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p  sum_of_sums([4]) == 4
p  sum_of_sums([1, 2, 3, 4, 5]) == 35