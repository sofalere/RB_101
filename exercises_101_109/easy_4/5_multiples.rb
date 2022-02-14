=begin
Write a method that searches for all multiples of 3 or 5 that 
lie between 1 and some other number, and then computes the sum 
of those multiples. For instance, if the supplied number is 20, 
the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

problem:
method that searches for all multiples of 3 or 5 between 1 and a given number
and then adds those numbers

input - integer
output - integer
other data types? arrays?

implicit:
  - if a number is a factor of both 3 and 5 only add it once

examples:

multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168

algorithm
  finding multiples of 3 and 5:
    -define method that takes an integer and if it is evenly divisible by 3
     returns true
    -repeat for 5
  define a method that takes one integer
  set a range between one and that integer
  select the numbers in the range that are multiples of 3 or 5
  add the elements of the array together
  
=end

def of_three?(integer)
  integer % 3 == 0
end

def of_five?(integer)
  integer % 5 == 0
end

def multisum(integer)
  (1..integer).select { |int| of_three?(int) || of_five?(int) }.inject(:+)
end

# Write a method that searches for all multiples of 3 or 5 
# that lie between 1 and some other number, 
# and then computes the sum of those multiples. 
# For instance, if the supplied number is 20, 
# the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# find numbers that are multiples of 3 from 1 to the arg
# find multiples of the same way 5
# add those

def multisum(num)
  multiples = []
  (1..num).each do |number|
    multiples << number if number % 3 == 0 || number % 5 == 0
  end
  multiples.inject(:+)
end

p  multisum(3) == 3
p  multisum(5) == 8
p  multisum(10) == 33
p  multisum(1000) == 234168


p multisum(10)
p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168