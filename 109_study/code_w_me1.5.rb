# given an array of strings made oly of lowercase letters, return an array of all 
# characters that show up in all strings within the given array (including duplicates)
# For example, if a character occurs 3 times in all strings but not 4 times, you
# need to include it 3 times in your final answer.

# PROBLEM:
# input: array of strings
# output: array of single character strings
# rules:
#   - lowercase letters
#   - a character has to appear in all strings in the array
#   - each character is addressed individually

# ALGORITHM
#   - create empy included chars array
#   - split first element into individual characters
#   - iterate through those characters and check if it is included in all the other elements in array
#     and add those which are to the array
#   - iterate through other elements in the array and delete that occurence of the character
#   - return the array

# def common_chars(array)
#   array = array.map { |word| word.dup }
  
#   array[0].chars.select do |character|
#     array.all? { |string| string.sub!(character, '') }
#   end
# end

# x = ['bella', 'label', 'roller']

# given an array of strings made only of lowercase letters, return an array of all 
# characters that show up in all strings within the given array (including duplicates)
# For example, if a character occurs 3 times in all strings but not 4 times, you
# need to include it 3 times in your final answer.

=begin
PROBLEM
given an array of strings return an array of the letters that occur in
all strings

RULES
if a letter appears twice in each string there will be two of that letter 
in the returned array


if we sort the strings by size and iterate over the smallest one.uniw   [c,l,o]
letter by letter we can scan each word in the array for that letter     lock.scan(c) 
                                                                        returns ['c'][ 'c'][ 'c']
                                            ['o', 'o'] [o] [o,o]        add to matches array
                                                                        sort by size of subarrays, smallest
                                                                        multiply the [letter] by that size
                                                                        and push into array
go on to the next iteration (to the next letter) if any scan returns empty

- initialize an empty characters array
- sort the words by size and pick the smallest to call uniq on and iterate over
- for each letter 
  
  amounts = []
  iterate over each srting in array for |word|
    amounts << word.scan(letter).size
  end
  
  sort amounts by size and push letter into chracters array 
  smallest size amount of times
=end


def common_chars(array)
  characters = []
  array.min_by { |word| word.size }.chars.uniq.each do |letter|
    amounts = []
    array.each { |word| amounts << word.scan(letter).size }
    amounts.min.times { characters << letter }
  end
  characters
end
x = ['bella', 'label', 'roller']

p common_chars(x) == ['e', 'l', 'l']
p common_chars(['cool', 'lock', 'cook']) == ['c', 'o']
p common_chars(['goodbye', 'hello', 'booya', 'random']) == ['o']
p common_chars(['aaabbbb', 'ccccddddd', 'eeeefffff', 'gggghhh']) == []


p x