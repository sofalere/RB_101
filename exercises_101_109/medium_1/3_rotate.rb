# PROBLEM:
# If you take a number like 735291, and rotate it to the left, 
# you get 352917. If you now keep the first digit fixed in place, 
# and rotate the remaining digits, you get 329175. Keep the first 
# 2 digits fixed in place and rotate again to 321759. 
# Keep the first 3 digits fixed in place and rotate again to get 321597. 
# Finally, keep the first 4 digits fixed in place and rotate the 
# final 2 digits to get 321579. The resulting number is called the 
# maximum rotation of the original number.

# Write a method that takes an integer as argument, 
# and returns the maximum rotation of that argument. 
# You can (and probably should) use the rotate_rightmost_digits method 
# from the previous exercise.

# Note that you do not have to handle multiple 0s.

# rules:
# - leading 0s get dropped
# - 1st round [0] moves to back, [1]..[size - 1] shift left
# - 2nd round [0] stays, [1] moves to back, [2]..[size - 1] shift left
# - 3rd round [0] [1] stays, [2] moves to back, [3]..[size - 1] shift left
# - etc...
# - rotate is called on the entire array, then the entire array starting at [1],
#   then [2] and so on until it reaches the index number 2 smaller than the size
# input: integer
# output: rotated integer

# ALGORTIHM
# - transform digit into string array
# - create a loop that changes the `n` argument starting from the size of the array
# - transform array in place
# - break when the `n` argument is two smaller than the size
require "pry"

# def max_rotation(digit)
#   all_digits = digit.to_s.chars
#   rotator = all_digits.size
#   loop do
#     break digit if rotator == 1
#     digit = rotate_rightmost_digits(digit, rotator)
#     rotator -= 1
#   end
# end

def max_rotation(digit)
  all_digits = digit.to_s.chars
  all_digits.size.downto(2) do |rotator|
    all_digits = rotate(all_digits, rotator)
  end
end

def rotate(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(digits, rotated)
  dig_array = digits.to_s.chars
  dig_array[-rotated..-1] = rotate(dig_array[-rotated..-1])
  dig_array.join.to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845