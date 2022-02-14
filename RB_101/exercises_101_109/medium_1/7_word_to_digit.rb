# Write a method that takes a sentence string as input, 
# and returns the same string with any sequence of the words 
# 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' 
# converted to a string of digits.

# input = string
# output = string with words representing digits converted to digits
# rules
# - all digit represeting words are lowercase
# - the spacing is the same in the original string as the converted

# ALGORITHM
# - split string into an array
# - set a constant hash DIGIT_WORDS = { 'one' => '1', 'two' => '2'.... etc }
# - initialize a 'transformed' array to the retunr value of `map`
# - iterate over the first array using `map`
#   - check to see if the current word is one of the constant keys?
#     - DIGIT_WORDS.include?(current word)
#   - if it is, replace it with the constants value
#     - DIGIT_WORDS[current_word]
#   - if not have the block return the current word 
# - join the transformed array together with a space (' ')

DIGIT_WORDS = { 'one' => '1',
                'two' => '2',
                'three'=> '3',
                'four' => '4',
                'five' => '5',
                'six' => '6',
                'seven' => '7',
                'eight' => '8',
                'nine' => '9',
                'zero' => '0'
}

def word_to_digit(string)
  DIGIT_WORDS.keys.each do |word|
    string.gsub!(word, DIGIT_WORDS[word])
  end
  string
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
