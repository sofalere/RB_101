# inputs: 2 arrays
# outputs: 1 new array

# rules:
#   - multiply numbers at the same index
#   - the result populates the corresponding index at the new array
#   - same number of elmements in each array
  
# algorithm:
#   - initialize empty new array
#   - iterate over each element in array1 with its index
#   - multiply each element by the elment at the same index in array2
#   - populate new array with the result 

# def multiply_list(ar1, ar2)
#   multiplied = []
#   ar1.each_with_index do |num, ind|
#     multiplied << num * ar2[ind]
#   end
#   multiplied
# end


def multiply_list(ar1, ar2)
  ar1.zip(ar2).map { |pair| pair.inject(:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
