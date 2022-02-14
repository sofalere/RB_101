# Write a method that takes an Array of integers as input, 
# multiplies all the numbers together, divides the result 
# by the number of entries in the Array, and then prints 
# the result rounded to 3 decimal places. Assume the array 
# is non-empty
# input: array
# output: float
# rules:
#   - the method takes an array of any size
#   - the array is non-empty
#   - the float returned will always have 3 decimal places even if 0
# algorithm:
#   - use an iterative method to multiply each number in the array
#   - divide the result by the size of the array
#   - display to the screen the prompt and the number with 3 decimals



def show_multiplicative_average(num_ar)
  num = (num_ar.map(&:to_f).inject(&:*)) / (num_ar.size)
  puts "The result is #{format('%.3f', num)}"
end


p  show_multiplicative_average([3, 5])                # => The result is 7.500
p  show_multiplicative_average([6])                   # => The result is 6.000
p  show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667