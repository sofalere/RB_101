=begin
PROB
take word, return anagrams

RULES
- must be all of word
- same word doesnt count
- case insensitive


APPROACH
define `match` method. returns empty array if none of the passed in wrods
are anagrams of the @word, returns array no matter waht. 

word_hash: 
  creates hash of word letters and theyre occurance num

match method:
  init `results` arr
  for each word in array
  downcase
  check if passed in array is same length as @word
  if TRUE
    count each letter, create hash
    check if hash is same as @word hash
    if TRUE
      add that word to `results`
    if FALSE
      next
  if FALSE
    next
  
  return `results`
=end

class Anagram
  attr_reader :word_hash, :word
  
  def initialize(word)
    @word = word.downcase
    @word_hash = letter_count(word)
  end

  def match(ar)
    ar.select do |matcher|
        matcher.downcase != word &&
        letter_count(matcher) == word_hash
    end
  end
  
  private

  def letter_count(word_to_count)
    word_to_count = word_to_count.downcase

    word_to_count.chars.each_with_object({}) do |char, word_count|
      word_count[char] = word_to_count.count(char)
    end
  end
end
