def leading_substrings(str)
  string_ar = str.chars
  leading = []
  counter = 0
  loop do
    break if counter > str.size - 1
    letters = string_ar[0..counter]
    leading << letters.join
    counter += 1
  end
  leading
end

p  leading_substrings('abc') == ['a', 'ab', 'abc']
p  leading_substrings('a') == ['a']
p  leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# Write a method that returns a list of all substrings of a string that 
# start at the beginning of the original string. 
# Return value should be arranged in order from shortest to longest substring.

=begin
PROBLEM
write a method that returns an array of all substrings that start at the
beginning of the original string

INPUT: string
OUPUT: an array 

RULES
add one letter to the element at a time, saving each iteration
same amount of substrings as letters

ALOGRITHM
split string into array of characters
add first element to the array
add the next element to the most recent element in the array 
then add that result to the array

set `substrings` to empty array
string.chars to split into array
iterate over each character
  initialize current_character to sibstrings.last + character
  add current_character to substrings array 
=end

# def leading_substrings(string)
#   substrings = []
#   string.chars.each do |char|
#     current_character = substrings.last.to_s + char
#     substrings << current_character
#   end
#   substrings
# end

# p leading_substrings('abc') == ['a', 'ab', 'abc']
# p leading_substrings('a') == ['a']
# p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']


=begin
substring = string[0]
            string[0] + string[1]
            string[0] + string[1] + string[2]

ALGORITHM
set empty current substring variable
update current substring with the return value from a range of orginal string 
  range end = 0, 1, 2 or string.size - 1 OR times 
  (0..0)
  (0..1)
  (0..2)
add current substring to substrings
=end

# def leading_substrings(string)
#   substrings = []
#   string.size.times do |range_end|
#     substrings << string[0..range_end]
#   end
#   substrings
# end 
  

def leading_substrings(string)
  (0..string.size - 1).map { |range_end| string[0..range_end] }
end
  

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
