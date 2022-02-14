=begin
In the modern era under the Gregorian Calendar, leap years occur in 
every year that is evenly divisible by 4, unless the year is also 
divisible by 100. If the year is evenly divisible by 100, then it is 
not a leap year unless the year is evenly divisible by 400.
if the year is a leap year, or false if it is not a leap year
Assume this rule is good for any year greater than year 0. Write a method that 
takes any year greater than 0 as input, 
and returns true if the year is a leap year, or false if it is not a leap year

problem:
  write a method that reutnrs true or false if the year is or isnt a leap year
  
explicit rules:
  -any year greater than 0 is considered
  -leap year = 
              a year evenly divisible by 4
              unless also divisible by 100
              but if also divisble by 400 then it is a leapyear
  -return boolean values

implicit rules:
  -no need to validate integers or negatives

data structures:
  integer input
  boolean output
  
  no other conversions possibly, just use logical operators and conditionals
  modulo operator will find what is evenly divisible
  
algorithm:
  method that takes one argumnent, an integer
  conditional that returns true if int is evenly divisible by 400
  conditional that returns true if int is not 100 but is evenly divisble by 4

=end
# BOOK ANSWER
# def leap_year?(year)
  
#   if year % 400 == 0
#     true
#   elsif year % 4 == 0 && year % 100 != 0
#     true
#   else 
#     false
#   end
  
# end

# In the modern era under the Gregorian Calendar, 
# is a leap year if it is is evenly divisible by 4, 
#                     unless the year is also divisible by 100. 
# is a leap year if it is also evenly divisible by 400.

# Assume this rule is good for any year greater than year 0. 
# Write a method that takes any year greater than 0 as input, 
# and returns true if the year is a leap year, 
# or false if it is not a leap year.

# ALGOROTHM
# if divisible by 400 then true
# if divisible by 100 then false
# if divisible by 4 then true

def leap_year?(year)
  return true if year % 400 == 0
  return false if year % 100 == 0
  return true if year % 4 == 0
  false
end

# BACKWARDS
def leap_year?(year)
  if year % 4 == 0
    if year % 100 == 0
      return true if year % 400 == 0
    return false
    end
  return true
  end
end

p leap_year?(400) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true