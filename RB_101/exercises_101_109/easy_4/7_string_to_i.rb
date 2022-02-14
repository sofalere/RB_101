# DIGITS = {
#   '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
#   '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
# }

# youll have an array of digits
# you need to get the digits together
# - [4, 3, 2, 1]
#   4321 
#         4000 == 4 * 1000 == 4 * 10 * 10 * 10
#         300  == 3 * 100  == 3 * 10 * 10
#         20   == 2 * 10   == 2 * 10
#         1    == 1 * 1    == 1 * 1
#         
# if the size of the array > 1 then multiply the 
# element in the 2nd from the back index by 10
#                3rd from the back index by 10 twice
#                4th from the back index by 10 thrice

# - get array of integers
# - set `place` variable to be array.size - 1
# - iterate over them
#   - the multiply the current integer by 10 the amount of times 
#     that is specified in the `place` variable, add result to `integer` var
#   - update `place` variable by subtracting one for each iteration

# def string_to_integer(string)
#   num_array = string.chars.map { |char| DIGITS[char] }
#   place = num_array.size - 1
#   integer = 0
#   num_array.each do |num|
#     integer += num * 10**place
#     place -= 1
#   end
# end

# def string_to_integer(string)
#   digits = string.chars.map { |char| DIGITS[char] }

#   value = 0
#   digits.each { |digit| value = 10 * value + digit }
#   value
# end



# take second index number [-2] * 10
# add index number [-3] and add a (* 10)
# add all nums to sum variable
# def string_to_integer(string)
#   num_array = string.chars.map { |let| DIGITS[let] }
#   sum = num_array[-1]
#   deci = 10
#   index = 2
#   if num_array.size > 1
#     counter = 1
#     loop do
#       sum += num_array[-index] * (deci**counter)
#       counter += 1
#       index += 1
#       break sum if counter >= num_array.size
#     end
#   else
#     num_array
#   end
# end

# p string_to_integer('4321') == 4321
# p string_to_integer('570') == 570

HEX_DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
  'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
}

# case doesnt matter
# '4D9f' =  4 * ( 16 * 16 * 16) + 13 * (16 * 16) + 9 * 16 + 15

#           16_384              + 3_328          + 144    + 15

# iterate over each element
# 1st element is multiplied by the result of multiplying 16 by 16 n times
#   n times = array.size - 1 
# subtract 1 from n 
# continue for each element

# my solution makes things unnecceraily complicated
# the books answer is better
# the book, iterates through the array like I do
# but on the first iteration the first number in the array is added to the total
# second iteration the total is multiplied by 16 (or 10) and the next element
# in the array is added to the total, next iteration, same thing until the
# digit has been multiplied by 16 or 10 the correct amount of times 

#   value = 0
#   digits.each { |digit| value = 16 * value + digit }
#   value

# '4D9f' =  0 * 16 + (4) = 4
#           4 * 16 + (13) = 77
#           77 * 16 + (9) = 1_241
#           1_241 * 16 + (15) = 19_871

def hexadecimal_to_integer(string)
  hex_array = string.chars.map { |char| HEX_DIGITS[char.upcase] }
  total = 0
  place = hex_array.size - 1
  hex_array.each do |dig|
    total += dig * (16**place)
    place -= 1
  end
  total
end

p hexadecimal_to_integer('4D9f') == 19871
