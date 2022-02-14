# write a method that takes an array of words and prints out a 
# nested array of all the anograms

# rules:
#   - anorgrams are words that have the same letters but in a different order
#   - all inputs have te same amount of letters

# algorithm
#   - set empty array
#   - iterate through array for each element place it in a loop that checks
#     every index character of the following element
#   - if one character isnt included the loop it goes to the next element
#   - add ones that pass all 'inlcusions' into array

require 'pry'

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']


def anograms(words)
  result = {}
  words.each do |word|
    key = word.chars.sort.join
    if result.has_key?(key)
      result[key].push(word)
    else
      result[key] = [word]
    end
  end 
result.each_value do |v|
  puts "------"
  p v
end
end


# def anograms(words)
#   results = []
#   words.each do |word|
#     counter = 0
#     chars = words[counter].chars
    
#     loop do 
#       index = 0
#       loop do
#         break if word.include?(chars[index]) == false
#         index += 1 
#         if index == 3
#           results << (words[counter])
#           break
#         end
#       end
#       counter += 1
#       break if counter >= words.size
#     end
#   end
  
#   results.uniq.sort
# end

p anograms(words)

a = 'hey'
counter = 0
while counter < 3
  
  a = 34
  counter += 1 
end
p a