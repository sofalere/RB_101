### 1.
# if false
#   greeting = "hello world"
# end

# greeting

# the ```greeting``` local variable, is pointing to nothing, since the
# condition on ```line 2``` is false so the line of code assigning ```greeting```
# to an object is not met. If a variable is initialized within a conditional, 
# and that condition is not met, the variable is initialized to  ```nil```, so it 
# will return ```nil```. Unlike when an unitialized or out of scope local 
# variable is referenced and Ruby raises an excpetion.

### 2.
# greetings = { a: 'hi' }
# informal_greeting = greetings[:a]
# informal_greeting << ' there'

# puts informal_greeting  #  => "hi there"
# puts greetings

# Here the local variable ```informal_greeting``` is initialized to point to 
# the actual value of the ```a``` key in the ```greetings``` hash. That value 
# is then appended with the string ' there' using the mutating string shovel method.
# The ```greetings``` hash value for ```a``` is now 'hi there' because the 
# ```informal_greeting``` variable is referencing the actual hash value object,
# and that value was mutated, impacting any variable that point to it.

# ### 3.
# def mess_with_vars(one, two, three)
#   one = two
#   two = three
#   three = one
# end

# one = "one"
# two = "two"
# three = "three"

# mess_with_vars(one, two, three)

# puts "one is: #{one}"
# puts "two is: #{two}"
# puts "three is: #{three}"

# Each of the paramters in the ```mess_with_vars``` method definitoin is reassigned.
# Reassignment is not a method, and crucially, is non-mutating. The local variables
# initialzied on lines 37 - 39 are passed as its arguments when the ```mess_with_vars```
# method is invoked on line 41. Because the method body doesnt mutate the arguments
# the strings printed to the screen from the puts methods will show the values of
# the variables ```one``` ```two``` and ```three``` are the same as they were when they
# were initialized.

### 4.
# def mess_with_vars(one, two, three)
#   one = "two"
#   two = "three"
#   three = "one"
# end

# one = "one"
# two = "two"
# three = "three"

# mess_with_vars(one, two, three)

# puts "one is: #{one}"
# puts "two is: #{two}"
# puts "three is: #{three}"

# The local varibales ```one``` ```two``` and ```three``` remain unchanged
# from being passed into the ```mess_with_vars``` method call as arguments. 
# The method definition on ```lines 56 - 60``` shows that its parameters are 
# reassigned, which is non-mutating, and will have no permanent affect on the
# values passed into the method. 
# ```lines 68 - 70``` passes an intrapolated string as an argumet to a puts 
# method call per line. Printing three strings to the screen, with a new line
# following each and a return value of ```nil```.

### 5.

# def mess_with_vars(one, two, three)
#   one.gsub!("one","two")
#   two.gsub!("two","three")
#   three.gsub!("three","one")
# end

# one = "one"
# two = "two"
# three = "three"

# mess_with_vars(one, two, three)

# puts "one is: #{one}"
# puts "two is: #{two}"
# puts "three is: #{three}"

# The object that variables initialized on ```lines 89 - 91``` point to are passed 
# in as arguments to
# the ```mess_with_vars``` method invoked on ```line 93```. ```lines 95 - 97```
# prints intrapolated strings to the screen displaying that the values of 
# variables ```one``,  ```two```, and ```three``` have been mutated by the 
# method call. The ```gsub!``` mutating method, when called on a string, replaces
# any characters specified in the first argument, with ones from the second.
# Since the actual object is mutated this will affect the local varibles that
# point to those objects outside of the method.


### 6.

def is_an_ip_number?(word)
  word =~ /[^A-Za-z]/
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  if dot_separated_words.size == 4
    return true if dot_separated_words.all? { |word| is_an_ip_number?(word) }
  end
  false
end

p dot_separated_ip_address?("45.3.22")
