def penultimate(string)
  words = string.split
  words[-2]
end  
  
  
p  penultimate('last word') == 'last'
p  penultimate('Launch School is great!') == 'is'

require 'pry'

def midtimate(string)
  words = string.split
  midpoint = (words.size / 2) 
  if words.empty?
    ''
  elsif words.size.odd?
    words[midpoint]
  else
    words[(midpoint - 1), 2].join(' ')
  end
end

p  midtimate('last word') == 'last word'
p  midtimate('Launch School is so great!') == 'is'
p  midtimate('') == ''
p  midtimate('Launch School is great!') == 'School is'