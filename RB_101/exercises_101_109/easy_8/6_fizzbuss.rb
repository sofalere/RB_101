# Write a method that takes two arguments: 
# the first is the starting number, and 
# the second is the ending number. 
# Print out all numbers between the two numbers, 
# except if a number is divisible by 3, print "Fizz", 
# if a number is divisible by 5, print "Buzz", 
# if a number is divisible by 3 and 5, print "FizzBuzz".

# problem
#   explicit rules:
#     - 2 arguments
#     - 1st starting num 2nd ending num 'num1..num2'
#     - print all numbers in the range
#     - if a number is divisible by 3 print 'Fizz'
#     - if a number is divisible by 5 print 'Buzz'
#     - if a number is divisible by both 3 and 5 print 'FizzBuzz'
    
# data structures
#   input = 2 integers
#   output = a display of integers and strings
#   range? upto?

# algorithm
#     - create a range between nums 1..2 including the nums
#     - iterate through each number checking for 3 & 5 first
#     - then the other 2
#     - then p regular number
    
def fizzbuzz(num1, num2)
  results = (num1..num2).to_a.map do |num|
            case
            when (num % 3) == 0 && (num % 5 == 0)
              'FizzBuzz'
            when (num % 3) == 0
              'Fizz'
            when (num % 5) == 0
              'Buzz'
            else
              num
            end
  end
  results.join(', ')
end

p fizzbuzz(1, 15) 
# -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
