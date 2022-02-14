# This limits the words you can spell with the blocks to just those 
# words that do not use both letters from any given block. 
# Each block can only be used once.

# Write a method that returns true if the word passed in as an argument 
# can be spelled from this set of blocks, false otherwise.

# input: string
# output: boolean
# return true if the string given consists of characters that only appear in 
#   the block once
# return false if the string uses both characters from a string or if the
#   same character is used twice

# - each block can only be used once
# - each letter can only be used once
# - both letters from a block cant be used
# - the strings are not case sensitive

# if we use a nested array for the blocks. we can split the string into
# an array and iterate over that. for each letter we iterate over the
# blocks array, selecting the two-element array which 'includes' the current
# string character.
# add the selected nested array to a 'used' array variable 
# check to see if the used array after uniw is called on it matches itself, then true

# LETTERS_BLOCK = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
# ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
# ['V', 'I'], ['L', 'Y'], ['Z', 'M']]

# def block_word?(strg)
#   used_blocks = []
#   strg.chars.map(&:upcase).each do |letter|
#     used_blocks << LETTERS_BLOCK.select { |block| block.include?(letter) }
#   end
#   used_blocks.uniq == used_blocks
# end

# #BOOK ANSWER:

# BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

# def block_word?(strg)
#   BLOCKS.none? { |block| strg.upcase.count(block) >= 2}
# end

# p block_word?('BATCH') == true
# p block_word?('BUTCH') == false
# p block_word?('jest') == true



=begin
PROBLEM
each letter combo can only be used once, return true or false if that is
the csae or not

RULES
false if any block is used twice
true otherwise

ALGORITHM
create `used` pairs array variable
iterate through upcased argument characters
check if the character is already in the used pairs array
  if not
  iterate through the pairs array and return the subarray that includes the char
a

if any 2 element permutation of the argument == any pair, false
1.) upcase the string and slipt into characters
2.) call permutation(2) on the array
3.) pass permutations into block that checks if that subarray is in the pairs
    constant...immediatley return false if it is
=end


PAIRS = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
          ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
          ['V', 'I'], ['L', 'Y'], ['Z', 'M']]

def block_word?(arg)
  arg.upcase.chars.permutation(2) do |subarray| 
    p subarray
    return false if PAIRS.include?(subarray)
  end
  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true

