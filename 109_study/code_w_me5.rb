# =begin
# PART 5 VIDEOS

# ###problem###
# return the size of the longest palindrome substring within a given string

# If the length of the substring is 0, return 0.

# INPUT: string
# OUTPUT: integer

# RULES:
# palindrome = reads the same backwards and forwards
#             if the substring is reversed it == the substring
#             characters must be next to each other
            

# return the length of the largest palindrome


# ALGORITHM
# - create all possible substrings of a string
#   - split string into array
#   - 1st element, 2nd element
#   - 1st
#   - 1st, 2nd
#   - 1st, 2nd, 3rd
#   -      2nd, 3rd
#   -           3rd
#   add first char to sub array
#   add first char plus 2nd char to sub array
#   add first char plus 2nd char plus 3rd char to sub array
#   add 2nd char to sub array
#   ...
#   array[0]
#   array[0] + array[1]
#   array[0] + array[1] + array[2]
#   array[1]
#   array[1] + array[2]
#   array[2]
  
#   each_with_index? 
#   where for each character you loop through adding the char at the next index to
#   the current char updating a 'current string' variable as you go

# - find palindromes in substrings
#   - if they can be reverse and are the same they are a palindrome
# - count their characters
# - return the largest number


# =end

# def substrings(string)
#   substrings = []
#   string.size.times do |range_start|
#     string.size.times do |range_end|
#       substrings << string[range_start..range_end]
#     end
#   end
#   substrings.uniq
# end

# def palindrome?(string)
#   string.reverse == string
# end

# def longest_pal(string)
#   longest = 0
#   substrings(string).each do |substring|
#     longest = substring.size if palindrome?(substring) && substring.size > longest
#   end
#   longest
# end


# # def longest_pal(string)
# #   string_arr = string.chars
# #   substrings = []

# #   string_arr.each_with_index do |char, index|
# #     current_string = char
# #     next_index = index + 1
    
# #     loop do
# #       substrings << current_string
# #       break if next_index >= string_arr.size
# #       current_string = current_string + string_arr[next_index]
# #       next_index += 1
# #     end
# #   end
  
# #   palindromes = substrings.uniq.select { |subs| subs.reverse == subs }
# #   palindromes.max_by { |pal| pal.size }.size
# # end


# ###problem###
# return the length of the longest palindrome substring within a given string

# If the length of the substring is 0, return 0.

# INPUT: string
# OUTPUT: integer

=begin
PROBLEM
return the length of the longest palindrome in the string

RULES
if string has 1 character return that character
if string == 0 return 0
if a palindrome in the string is larger than the last largest, that is
the new largest
a string is plaindromic if it is the same forwards and back (reversed)

ALGORITHM
-.) find the palindromic substrings in the string:

    -.) find all substrings
        -.) check if palindromic && larger than the current largest palindrome
        
-.) return the size of the largest one


1. palindrome?(str)
    str.reverse == str

2. initiaize count varibale to 0

3. iterate over the index locations 0..arr.size - 1 as `start`
    iterate over lengths 0..arr.size - index as `length`
    if palindrome?string[start, length] 
      count = length if length > count
=end

def palindrome?(str)
  str.reverse == str
end

def longest_pal(str)
  count = 0
  str.size.times do |start|
    0.upto(str.size - start) do |length|
      substring = str[start, length]
      if palindrome?(substring)
        count = length if length > count
      end
    end
  end
  count
end

p longest_pal("a") == 1
p longest_pal("aa") == 2
p longest_pal("aab") == 2
p longest_pal("baa") == 2
p longest_pal("baablkj12345432133d") == 9
p longest_pal("I like racecars that go fast") == 7