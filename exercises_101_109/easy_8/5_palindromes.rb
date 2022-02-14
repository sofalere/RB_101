def leading_substrings(string)
  (0..string.size - 1).map { |range_end| string[0..range_end] }
end

def substrings(string)
  substrings = []
  string.size.times do |start_range|
    substrings.concat(leading_substrings(string[start_range..-1]))
  end
  substrings
end


def palindromes(string)
  substrings(string).select do |str| 
    str.reverse == str && str.size > 1
  end
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

# Write a method that returns a list of all substrings of a 
# string that are palindromic. That is, each substring must 
# consist of the same sequence of characters forwards as it 
# does backwards. The return value should be arranged in the 
# same sequence as the substrings appear in the string. 
# Duplicate palindromes should be included multiple times.

# You may (and should) use the substrings method you wrote 
# in the previous exercise.

# For the purposes of this exercise, you should consider all 
# characters and pay attention to case; that is, "AbcbA" is 
# a palindrome, but neither "Abcba" nor "Abc-bA" are. 
# In addition, assume that single characters are not palindromes.

# rules
#   - find palindromes within the strings
#     *palindromic substrings, same sequence forwards and backwards
#     *anything more than 1 same char is a palindrome
#   - return value is an array of strings
#   - return value arranged in same order as palindromes appear
#   - case sensitive

# implicit rules:
#   - separate words at spaces
#   - include characters like '-'

# data structures
#   - input = string
#   - output = array 
#   - substrings method returns an array of all possible substrings

# algorithm
#   - separate the string into individual words if applies
#   - create an array of all possible substrings in order from left to right
#     for each word
#   - iterate over the substrings checking to see which ones are
#     the same backwards and forwards
#   - populate an array with the substrings that match, in step 3 so they
#     appear in the correct order
  

# def leading_substrings(string)
#   strings = []
#   string = string.delete('^A-Za-z0-9-')
#   0.upto(string.size - 1) do |num|
#     strings << (string[0..num])
#   end
#   strings
# end

# def substrings(string)
#   results = []
#   0.upto(string.size) do |num|
#     results.concat(leading_substrings(string[num..-1]))
#   end
#   results
# end

# def palindrome?(str)
#   (str.size > 1) && (str.downcase == str.downcase.reverse)
# end

# def palindromes(str)
#   substrings = str.split(' ').map { |word| substrings(word) }.flatten
#   substrings.select { |word| palindrome?(word) }
# end



# p palindromes('abcd') == []
# p palindromes('madam') == ['madam', 'ada']
# p palindromes('hello-madam-did-madam-goodbye') == [
#     'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#     'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#     '-madam-', 'madam', 'ada', 'oo'
#   ]
# p palindromes('knitting cassettes') == [
#     'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
#   ]
  
# p palindromes("hey-yeh ABA aba aBA")