=begin

defne a method that takes two parameters, a sentence and a character and returns thecharacter the amount
of ties it shows  up in the string sentence

rules:
  -contains only alphabetical characters

algorithm
  -2 param method
  -set empty new string
  -set counter to 0
  -check is the charcter refrenced at the counter index is equal to the argument character
  -if it is place a copy of it into the new string
  -repeat until all characters have been checked
  -return new stirng
  
  
=end

def select_letter(sentence, character)
  character_string = ''
  counter = 0
  
  loop do
    break if counter == sentence.size
    
    character_string << character if sentence[counter] == character

    counter += 1
     character_string
  end
  
  #character_string
end


question = 'How many times does a particular character appear in this sentence?'
p select_letter(question, 'a') # => "aaaaaaaa"
p select_letter(question, 't') # => "ttttt"
p select_letter(question, 'z') # => ""

