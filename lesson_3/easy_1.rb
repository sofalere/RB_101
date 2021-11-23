### 1.
# numbers = [1, 2, 2, 3]
# numbers.uniq

# puts numbers

# the variable ```numbers``` is initialized and assigned to the array
# when the numbers variable is passed to the puts method on line 4
# the output is each element of the original array on a newline, 
# with a return value of nil. The uniq method invoked on line 2 is 
# a non-mutating method so the numbers variable is unnaffected. 
# This demonstrates how a non mutating method makes ruby appear to be 
# pass-by-value

### 2.

# what is != and where should you use it?
# The not equals operator, in a comparison expression

# put ! before something, like !user_name
# the 'not' gate, will reverse the objects truthy or falsey value

# put ! after something, like words.uniq!
# the bang symbol, usually informs of a mutating method

# put ? before something
# ? : ternary operator

# put ? after something
# signifies that a method will return a boolean object

# put !! before something, like !!user_name
# turns the object into its corresponding true or false value

### 3.
# advice = "Few things in life are as important as house training your pet dinosaur."
# advice.gsub!('important','urgent')

### 4.
# numbers = [1, 2, 3, 4, 5]
# p numbers.object_id

# p numbers.delete_at(1)
# p numbers
# p numbers.delete(1)
# p numbers.object_id


# the delete_at method is invoked on line 42 on the numbers variable,
# with a 1 passed as an argument. This will return the integer 2
# and permanently change the numbers array to not include the element at
# the 1 index location.
# The delete method is called on the numbers variable with an intger 1
# passed as an argument, this will return an integer one and permanently
# remove the 1 from the array. The element is removed but the arrays
# object_id remains the same

### 5.
# p (1..100) === 42
# p (1..100).include?(42)
# p (1..100).cover?(42)

### 6.
# famous_words = "seven years ago..."
# p "Four score and " + famous_words
# p famous_words.prepend("Four score and ")
# p "Four score and " << famous_words
# p famous_words

# both prepend and the shovel operator are mutating methods, while the
# first option is string concatenation

### 8.
# flintstones = { "Fred" => 0, 
#                 "Wilma" => 1, 
#                 "Barney" => 2, 
#                 "Betty" => 3, 
#                 "BamBam" => 4, 
#                 "Pebbles" => 5 }

# p flintstones.assoc("Barney")

# The assoc method is called on the flintstones variable with a
# string passed as an argument. 
# The assoc method is called on the flinstones variable, it will return a two 
# element array of the first key-value pair who's key matches the 
# argument passed to the assoc method. 

