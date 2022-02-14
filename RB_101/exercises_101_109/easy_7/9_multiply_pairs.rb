# Write a method that takes two Array arguments in 
# which each Array contains a list of numbers, and 
# returns a new Array that contains the product of
# every pair of numbers that can be formed between 
# the elements of the two Arrays. 
# The results should be sorted by increasing value.

# inputs: 2 arrays
# output: 1 arrays

# rules:
#   - multiply each number by each number in the next array
#   - populate a new array with the results
#   - sort by increasing value



def multiply_all_pairs(ar1, ar2)
  ar1.map { |num| ar2.map { |num2| num * num2 } }.flatten.sort
end


p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
