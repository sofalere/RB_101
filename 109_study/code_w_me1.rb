# given a non-empty string check if it can be constructed by taking a substring of 
# it and appending multiple coppies of the substring together

# PROBLEM
# input: non-empty lowercase string
# output: a boolean value (true or false)

# rules:
# - the entire string is a repeating substring
#   - substrings can be any size
#   - substrings HAVE to be identical 

# EXAMPLES:

# p repeated("aba") == false
# p repeated("abab") == true
# p repeated("abbaabba") == true
# p repeated("abbababb") == false
# p repeated("abcabcabcabc") == true
# p repeated("aaa") == true

# ALGORITHM
# - create an array of all possible substrings from 1 up to the size of half the string size
# - check to see if any of the substrings multiplied by a factor of the string size is equal to the string
#   and return true
#     - confirm that number is a factor using modulo 
#     - 
# - return false at end of method if none match


# def repeated(string)
#   substrings = []
#   1.upto(string.size / 2) do |length|
#     if (string.size % length) == 0
#       substrings << string[0, length]
#     end
#   end
  
#   p substrings
  
#   substrings.each do |substring|
#     multiplier = string.size / substring.size
#     return true if (substring * multiplier) == string
#   end
  
#   false
# end



=begin
PROBLEM
returnt rue or false if a given string can be made out of substrings
of itself

RULES
can be just repeating single letters
the maximum length a substring can be is half the original

ALGORITHM
iterate over indexes
  check if arr.size % length is 0
  check if string can be made from ind[0, length] * (arr.size / length)
  return true if can
  
return false

1.) 0.upto(str.size / 2) do |length|
    go to the next iteration if the size of the string isnt divisble be length
    return true if str == str[0,lenght] * (str.size / length)
=end

def repeated(str)
  1.upto(str.size / 2) do |length|
    next if str.size % length != 0
    return true if str == str[0,length] * (str.size / length)
  end
  false
end


p repeated("aba") == false
p repeated("abab") == true
p repeated("abbaabba") == true
p repeated("abbababb") == false
p repeated("abcabcabcabc") == true
p repeated("aaa") == true