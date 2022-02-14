require 'pry'

def word_sizes(str)
  letter_counter = {}
  str.split.each do |word|
    if letter_counter.has_key?(word.size)
      letter_counter[word.size] += 1
    else
      letter_counter[word.size] = 1
    end
  end
  letter_counter
end

# could have left out the if/else and did:

  # counts = Hash.new(0)
  # str.split.each do |word|
  #   counts[word.size] += 1
  # end
  # counts
  
# the 'Hash.new(0)' makes the += possible since an empty hash would raise 
# an exception the first time, but the 0 forces references non-existing keys
# to return 0

p  word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p  word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p  word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p  word_sizes('') == {}