#Write a method that takes two arguments, a string and a positive integer, 
#and prints the string as many times as the integer indicates

# inputs: a string and an integer
#outputs: prints out the string <integer> amount of times

def repeat(string, num)
  num.times { |num| puts string }                   #the times Integer method is used here
end


repeat("hey",3)

