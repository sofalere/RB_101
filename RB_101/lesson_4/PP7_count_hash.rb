
#create a hash that expresses the frequency with which each letter occurs in this string:

# algorithm
#   -count the amount of times a character is in a string
#   -set the characters as the key and the amounts as the value of a new hash


statement = "The Flintstones Rock"

###manual loops

hash = {}
counter = 0
array = statement.chars

loop do
  current_letter = array[counter]
  count = 0
  break if counter == array.size
  num = 0 
  
  loop do
    if current_letter == array[count]
      num += 1
      hash[current_letter] = num
    end
    
    break if count == array.size
    count += 1
    
  end
  
  counter += 1
  
  hash
  
end
puts hash

###setting empty hash and iterating with each

hash = {}
arr = statement.gsub(' ', '').chars
arr.each do |char|
  hash[char] = arr.count(char)
end

p hash

###trying to shorten it using each_with_object

arr = statement.gsub(' ','').chars
new_hash = arr.each_with_object({}) do |char, hash|
  hash[char] = arr.count(char)
end

p new_hash

####book answer

result = {}
letters = ('A'.."Z").to_a + ('a'..'z').to_a

letters.each do |letter|
  letter_frequency = statement.count(letter)
  result[letter] = letter_frequency if letter_frequency > 0
end
