# require 'pry'

# Rotate the last `n` digits of an array


# rules:
#   - n is always positive
#   - rotating by 1 results in the original number being returned
#   - 'rotating' means movinging the first element to the end 
#     and shifting the elements to the right of that element one space to the left

# input: digit, the amount of digits that will be rotated
# output: rotated digit

# ALGORITHM
# - transform digits into array and split into two arrays using element reference
# - perform the rotation
# - combine the number

def rotate(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(digits, rotated)
  dig_array = digits.to_s.chars
  dig_array[-rotated..-1] = rotate(dig_array[-rotated..-1])
  dig_array.join.to_i
end

# def rotate_rightmost_digits(digits, rotated)
#   digits_array = digits.to_s.chars
#   return rotate(digits_array).join.to_i if digits_array.size == rotated

#   left = digits_array[0..digits_array.size - rotated - 1]
#   right = rotate(digits_array[-rotated..-1])

#   (left + right).join.to_i
# end

# p  rotate_rightmost_digits(735291, 1) == 735291
# p  rotate_rightmost_digits(735291, 2) == 735219
# p  rotate_rightmost_digits(735291, 3) == 735912
# p  rotate_rightmost_digits(735291, 4) == 732915
# p  rotate_rightmost_digits(735291, 5) == 752913
# p  rotate_rightmost_digits(735291, 6) == 352917

# # Write a method that can rotate the last n digits of a number. For example:
# # Note that rotating just 1 digit results in the original number being returned.

# # You may assume that n is always a positive integer.

# # PROBLEM
# # a method that rotates the last `n` digits of a number

# # RULES
# # the numbers that will be rotated ar the last `n` if n = 1 its numar[-1, `n`]
# =begin
# # ALGORITHM
# -. rotate an array method
#     -. [2, 9, 1]
#         [1..-1] + [0]
#   array[1..-1] + [array[0]]

# -. pass the array of a certain size into the rotate method
#       number_array = integer.digits.reverse
#       rotated_array = rotate_method(numberarray[-1, `n`])
#       [number_array[0..n - 2] + rotated_array].flatten.join.to_i
# =end

# def rotate_array(arr)
#   arr[1..-1] + [arr[0]]
# end

# def rotate_rightmost_digits(int, n)
#   number_array = int.digits.reverse
#   rotated_array = rotate_array(number_array[number_array.size - n..-1])
#   (number_array[0, number_array.size - n] + rotated_array).join.to_i
# end

# p rotate_rightmost_digits(735291, 1) == 735291
# p rotate_rightmost_digits(735291, 2) == 735219
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917
