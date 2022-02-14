=begin

split sentence into words

split each array into sub arrays by character (map, chars) ?
put first and last letter into new array, reverse it, put [0] and [1] back as 
first and last
join the word back
join the sentence back .join(" ")

=end
require 'pry'

# def swap(str)
#   letters = []
#   words = str.split.map { |word| word.chars }.each do |sub|
#     letters << sub.first + sub.last
#   end
  
#   letters.map! { |let| let.reverse.chars }
  
#   letters.each_with_index do |sub, ind|
#     words.map! do |word|
#       if ind == words.index(word)
#         word[word.index(word.last)].replace(sub[1])
#         word[0].replace(sub[0])
#       end
#       word
#     end
#   end
  
#   words.map { |w| w.join }.join(' ')
# end

def swap_first_last_letter(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(str)
  backwards = str.split.map do |word|
    swap_first_last_letter(word)
  end
  backwards.join(' ')
end

p  swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p  swap('Abcde') == 'ebcdA'
p  swap('a') == 'a'