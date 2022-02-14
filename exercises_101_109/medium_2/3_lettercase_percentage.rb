# In the easy exercises, we worked on a problem where we had to count 
# the number of uppercase and lowercase characters, as well as characters that 
# were neither of those two. Now we want to go one step further.

# Write a method that takes a string, and then returns a hash that contains 
# 3 entries: one represents the percentage of characters in the string that 
# are lowercase letters, one the percentage of characters that are uppercase 
# letters, and one the percentage of characters that are neither.

# You may assume that the string will always contain at least one character.

# input: string
# output: hash with 3 elements ; lowercase, uppercase, neither and percentages

# determine amount of characters in string
# determine how many are lowercase, uppercase, or neither
# - create a hash where the values are the counts of each criteria
#   using `count` and a string
# determine the percentage of the whole that each represents
# - write a percentage method that takes two integers
#   - the amount of characters total and the amount of characters we want to find
#   - (100 / total) * characters use floats
#   - x/100 == 2/10 
# sub our values for the return values of percentage method

# def percentage(total, element)
#   result = (100.00 / total.to_f) * element.to_f
#   format('%.2f', result).to_f
# end

# def letter_percentages(string)
#   { lowercase: percentage(string.size, string.count('a-z')),
#     uppercase: percentage(string.size, string.count('A-Z')),
#     neither: percentage(string.size, string.count('^a-zA-Z')) }
# end

=begin
PROBELM
return a hash that represents 3 items, the percentages of lowercase, uppercse
and niether letter

RULES
neither = anything that isnt upper or lowercase including spaces
represent in a float

ALGORITHM
count the upper case letters, count the lowercase
subtract from total for `neither`

percentage = (char.count / str.size) * 100

1.) create percentage method that takes string

1.) populate hash with words: count  
      count('a-z') upper ('A-Z') and neither ('^a-zA-Z')
2.) transform the values of the hash using the percentage method

=end
def percentage(charcount, str)
  format('%.02f', ( (charcount.to_f / str.size.to_f) * 100 ) ).to_f
end

def letter_percentages(str)
  counts_hash = { lowercase: str.count('a-z'), uppercase: str.count('A-Z'),
                    neither: str.count('^A-Za-z') }
  counts_hash.each { |type, count| counts_hash[type] = percentage(count, str) }
end


p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI')



