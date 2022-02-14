# the maximum sum sub array problem consists of finding the maximum sum of 
# a contiguous(touching) sequence in an array of integers

# maxsequence [-2, 1, -3, 4, -1, 2, 1, -5, 4]
# should be 6: [4, -1, 2, 1]
# if array is only positive numbers, the max sum is the sum of all integers in array
# if array is all negative numbers, the return should be `0`
# empty array returns `0`

# input: array of positive/negative integers or empty array
# output: integer
# rules:
# - if all negative return `0`
# - if empty return `0`
# - return the greatest possible sum of numbers located next to each other in the array
# - since position matters we cannot alter the locations (no sorting, so selection)
# - when another integer is added, only continue adding if that result is 
#   higher than the starting result 
#   result = index0 + index1
#   if result < result + index2 then result = result + index2
#   if result < result + index3 then result = result + index3
#   if result > result + index4 then highest << result


# ALGORITHM
# - check if all are positive
#   - iterate through num > 0: if so add all and return sum
# - check if all negative?
#   - iterate through and num < 0: if so return 0
# - intialize result to 0
# - set start to 0
# - create a loop that breaks when `start` is the size of the array 
#   - within the loop set `next_index` to `start`
#   - create another loop that breaks when result > result + array[next_index]
#     - if result < result + array[next_index]. result += array[next_index]
#     - add result to `highest` 
#     - add 1 to next_index
# # 
# # [2,3,-4]
# # result = 0
# # 0 < 0 + 2? yes so
# # result = 2
# # 2 < 2 + 3? yes so
# # result = 5
# # 5 < 5 + (-4)? NO

# # ALGORITHM
# # -all we need to do is add all integers starting from [0] 
# require "pry"

# def max_sequence(integer_array)
#   combinations = [0]
#   starting_index = 0
#   loop do
#     break if starting_index == integer_array.size
#     next_index = starting_index
#     result = integer_array[starting_index]
#     loop do
#       break if next_index == (integer_array.size - 1)
#       next_index += 1
#       result += integer_array[next_index]
#       next if result <= combinations.sort.last
#       combinations << result
#     end
#     starting_index += 1
#   end
#   return 0 if integer_array.all? { |num| num < 0 }
#   return integer_array[0] if integer_array.size == 1
#   combinations.last
# end






# the maximum sum sub array problem consists of finding the maximum sum of 
# a contiguous(touching) sequence in an array of integers

# maxsequence [-2, 1, -3, 4, -1, 2, 1, -5, 4]
# should be 6: [4, -1, 2, 1]
# if array is only positive numbers, the max sum is the sum of all integers in array
# if array is all negative numbers, the return should be `0`
# empty array returns `0`

=begin
PROBLEM
return an integer that is the highest possible number of touching numbers in 
array

RULES
if all positive numbers, sum all integers in array
if all negative, 0
empty? 0

create subarrays of conjoining integers and get their sum
if it is higher than the `highest` variable replace that variable

ALGORITHM
1.) set `highest` = 0
2.) iterate array.size.times do |start|
    iterate 0.upto(array.size - start) do |length|
    test_number = array[start, length]
    highest = test_number if test_number > highest
=end

def max_sequence(array)
  highest = 0
  array.size.times do |start|
    0.upto(array.size - start) do |length|
    test_number = array[start, length].sum
    highest = test_number if test_number > highest
    end
  end
  highest
end

p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0 
p max_sequence([-2, 1, -7, 4, -10, 2 , 1, 5, 4]) == 12