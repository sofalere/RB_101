=begin
PART 5 VIDEOS

###problem###
return the size of the longest palindrome substring within a given string

If the length of the substring is 0, return 0.

INPUT: string
OUTPUT: integer

RULES:
palindrome = reads the same backwards and forwards
            if the substring is reversed it == the substring
            characters must be next to each other
            

return the length of the largest palindrome


ALGORITHM
- create all possible substrings of a string
  - split string into array
  - 1st element, 2nd element
  - 1st
  - 1st, 2nd
  - 1st, 2nd, 3rd
  -      2nd, 3rd
  -           3rd
  add first char to sub array
  add first char plus 2nd char to sub array
  add first char plus 2nd char plus 3rd char to sub array
  add 2nd char to sub array
  ...
  array[0]
  array[0] + array[1]
  array[0] + array[1] + array[2]
  array[1]
  array[1] + array[2]
  array[2]
  
  each_with_index? 
  where for each character you loop through adding the char at the next index to
  the current char updating a 'current string' variable as you go

- find palindromes in substrings
  - if they can be reverse and are the same they are a palindrome
- count their characters
- return the largest number


=end


# def longest_pal(string)
#   string_arr = string.chars
#   substrings = []

#   string_arr.each_with_index do |char, index|
#     current_string = char
#     next_index = index + 1
    
#     loop do
#       substrings << current_string
#       break if next_index >= string_arr.size
#       current_string = current_string + string_arr[next_index]
#       next_index += 1
#     end
#   end
  
#   palindromes = substrings.uniq.select { |subs| subs.reverse == subs }
#   palindromes.max_by { |pal| pal.size }.size
# end


# p longest_pal("a") == 1
# p longest_pal("aa") == 2
# p longest_pal("aab") == 2
# p longest_pal("baa") == 2
# p longest_pal("baabcd") == 4
# p longest_pal("baablkj12345432133d") == 9
# p longest_pal("I like racecars that go fast") == 7


def letter_count(str)
  p str.chars.to_h { |key| [key.to_sym, str.count(key)]}
end

p letter_count('hiyahey')

p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}