def reverse_words(string)
  ar = string.split.map do |word|
                            word.length >= 5 ? word.reverse : word
                        end  
  ar.join(' ')
end

puts reverse_words("hey there how ya doing")
puts reverse_words("Launch School word up")


