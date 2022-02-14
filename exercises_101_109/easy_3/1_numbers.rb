=begin
PROBLEM
program that asks for 6 numbers, and checks to see if the 6th was included in the previous 5

input: 6 numubers
output: boolean response

DATA STRUCTURES
user strings in array 
array to boolean

ALGORITHM
ask user for 5 numbers
populate array with users numbers
ask user for final number 
check to see if finalnumber is in array 
output according response to user


loop for getting user input:
while loop that starts at 1 until 6
to get user input set the "__th" number as the incerement using string intrepolation
save user input into array

method for creating the correct ending of a number in a list:
gets one string argument
if num.end_with? 1 "st"
elsif 2 "nd"
elsif 3 'rd'
else 'th'

=end



def number_ordinal(num)
  if num.end_with?("1") 
    "st"
  elsif num.end_with?("2") 
    "nd"
  elsif num.end_with?("3") 
    'rd'
  else 
    'th'
  end
end

def valid?(input)
  input.to_i.to_s == input
end


counter = 1
numberarray = []

while counter < 6
  loop do 
    puts "Please enter the #{counter}#{number_ordinal(counter.to_s)} number:"
    number = gets.chomp
    
      if valid?(number)
        numberarray << number 
        break
      else
        puts "Not a valid number..."
      end
  end
  
  counter += 1
end

puts "Enter the last number:"
lastnum = gets.chomp

if numberarray.include?(lastnum)
  puts "The number #{lastnum} appears in #{numberarray}"
else
  puts "The number #{lastnum} does not appear in #{numberarray}"
end

# Write a program that solicits 6 numbers from the user, 
# then prints a message that describes whether or not the 
# 6th number appears amongst the first 5 numbers.

# PROBLEM
# returns true or false if the 6th digit retrieved from user is one of the first 5\


# ALGORITHM
# initialzie an empty array
# 1. push a user input string into a results array 6 times
# 2. check if resulst array inlcudes the results array pop

# results = []
# 6.times do 
#   results << gets.chomp
# end
# p results.include?(results.pop)