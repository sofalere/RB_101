# write a method that checks to see if a portion of str1 characters can
# be rearranged to match str2
# input: 2 strings
# output: boolean, return true if you can constuct string2 from a combination
#         of characters from string1

# rules:
# - only a-z, no numbers or special characters
# - each letter from str1 can only be used once
# - each letter in string2 must be included in the string1
# - not all letters from string1 have to be used

# check to see if there is any possible combination of any of the letters from
# str1 that can 'construct' string2

# algorithm:
# - count the amount of times each letter is in string 2
# - check if string1 has the same counts

# def scramble(string1, string2)
#   str2 = string2.chars.each_with_object({}) do |char, str2|
#     str2[char] = string2.count(char)
#   end
#   str1 = string1.chars.each_with_object({}) do |char, str1|
#     str1[char] = string1.count(char)
#   end
#   str2.all? do |letter, occurance|
#     str1[letter] >= str2[letter] if str1.has_key?(letter)
#   end
# end

def scramble(str1, str2)
  str2.chars.all? do |str2char|
    str2.count(str2char) <= str1.count(str2char)
  end
end




# write a method that checks to see if a portion of str1 characters can
# be rearranged to match str2
# input: 2 strings
# output: boolean, return true if you can constuct string2 from a combination
#         of characters from string1

# rules:
# - only a-z, no numbers or special characters
# - each letter from str1 can only be used once
# - each letter in string2 must be included in the string1
# - not all letters from string1 have to be used


# ALGORITHM
# 1.) iterate over the uniq characters in str2
# 2.) check if for all? the characters the char count in str1 >= char count in str2

def scramble(str1, str2)
  str2.chars.uniq.all? do |char|
    str1.count(char) >= str2.count(char)
  end
end


p scramble("javaass", "jjss") == false
 p scramble("rkqodlw", "world") == true
p scramble("cedewaraaossoqqyt", "codewars") == true
p scramble("katas", "steak") == false
p scramble("scriptjava", "javascript") == true
p scramble("scriptingjava", "javascript") == true