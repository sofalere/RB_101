=begin
e a program that reads the content of a text file and then prints 
the longest sentence in the file based on number of words. 
Sentences may end with periods (.), exclamation points (!), 
or question marks (?). Any sequence of characters that are not spaces 
or sentence-ending characters should be treated as a word. 
You should also print the number of words in the longest sentence.


PROBLEM
return the longest word in the pragraph along with its size

RULES
sentence ends in    . ? !
any other characters are just words

ALGORITHM
split the paragraph into sentences at the sentence enders
split the sentence into words at spaces
count the words
return the sentence and count that has the highest count

1.) get index number locations of all enders
    add (-1) to end of array
    iterate through index locations
    
    starting location = 0
    map the index locations to be sentence[startlocation + 1..index location ]
    sentence[start...ind]
    startings location = ind + 1
    [0..3] [4..8] [9..13] [14..-1]
=end

def longest(paragraph)
  locations = []
  paragraph.chars.each_with_index do |char, ind| 
    locations << ind if ['.','?','!'].include?(char) 
  end
  locations << -1
  
  starting = 0
  sentences = locations.map do |index|
    sentence = paragraph[starting..index]
    starting = index + 1
    sentence
  end
  
  counts = sentences.each_with_object({}) do |sent, counts|
    counts[sent] = sent.split.count
  end
  counts.max_by { |key, val| val }
end


p longest("Four score and seven years ago our fathers brought forth
on this continent a new nation, conceived in liberty, and
dedicated to the proposition that all men are created
equal.

Now we are engaged in a great civil war, testing whether
that nation, or any nation so conceived and so dedicated,
can long endure. We are met on a great battlefield of that
war. We have come to dedicate a portion of that field, as
a final resting place for those who here gave their lives
that that nation might live. It is altogether fitting and
proper that we should do this.

But, in a larger sense, we can not dedicate, we can not
consecrate, we can not hallow this ground. The brave
men, living and dead, who struggled here, have
consecrated it, far above our poor power to add or
detract. The world will little note, nor long remember
what we say here, but it can never forget what they
did here. It is for us the living, rather, to be dedicated
here to the unfinished work which they who fought
here have thus far so nobly advanced. It is rather for
us to be here dedicated to the great task remaining
before us -- that from these honored dead we take
increased devotion to that cause for which they gave
the last full measure of devotion -- that we here highly
resolve that these dead shall not have died in vain
-- that this nation, under God, shall have a new birth
of freedom -- and that government of the people, by
the people, for the people, shall not perish from the
earth.")


# Write a program that reads the content of a text file and then prints the 
# longest sentence in the file based on number of words. Sentences may end 
# with periods (.), exclamation points (!), or question marks (?). 
# Any sequence of characters that are not spaces or sentence-ending characters 
# should be treated as a word. You should also print the number of words in 
# the longest sentence.

# input: string
# output: string and integer
# rules: 
# - spaces separate words
# - (?) (.) (!) separate sentences
# - anything except spaces and word ending chars are considered 'words'

# ALGORITHM
# - set an empty array variable to house your split string
# - create a loop that iterates over the 'sentence' breaking characters and
#   passes them as the pattern for splitting the 
# - create an empty hash to house the substring arrays and word length
# - iterate over the array of sentences and for each sentence split on the
#   whitespace and count that array, save the count number as a value and the 
#   sentence, after joining back together, as the key
# - sort the hash values and print the last (highest) key and value

# def longest_word(string)
#   split_string = string.split('.')
#   split_array = []
#   ['?', '!'].each do |sentence_ender|
#     split_string.each do |split_sentence|
#       split_array << split_sentence.split(sentence_ender)
#     end
#   end
#   counts = {}
#   split_array.flatten.each do |sentence|
#     counts[sentence] = sentence.split(' ').count
#   end
#   puts "The longest sentence is #{counts.values.sort.last} words long:"
#   puts counts.key(86)
# end


# longest_word('Four score and seven years ago our fathers brought forth
# on this continent a new nation, conceived in liberty, and
# dedicated to the proposition that all men are created
# equal.

# Now we are engaged in a great civil war, testing whether
# that nation, or any nation so conceived and so dedicated,
# can long endure. We are met on a great battlefield of that
# war. We have come to dedicate a portion of that field, as
# a final resting place for those who here gave their lives
# that that nation might live. It is altogether fitting and
# proper that we should do this.

# But, in a larger sense, we can not dedicate, we can not
# consecrate, we can not hallow this ground. The brave
# men, living and dead, who struggled here, have
# consecrated it, far above our poor power to add or
# detract. The world will little note, nor long remember
# what we say here, but it can never forget what they
# did here. It is for us the living, rather, to be dedicated
# here to the unfinished work which they who fought
# here have thus far so nobly advanced. It is rather for
# us to be here dedicated to the great task remaining
# before us -- that from these honored dead we take
# increased devotion to that cause for which they gave
# the last full measure of devotion -- that we here highly
# resolve that these dead shall not have died in vain
# -- that this nation, under God, shall have a new birth
# of freedom -- and that government of the people, by
# the people, for the people, shall not perish from the
# earth.') == 'It is rather for
# us to be here dedicated to the great task remaining
# before us -- that from these honored dead we take
# increased devotion to that cause for which they gave
# the last full measure of devotion -- that we here highly
# resolve that these dead shall not have died in vain
# -- that this nation, under God, shall have a new birth
# of freedom -- and that government of the people, by
# the people, for the people, shall not perish from the
# earth.' 