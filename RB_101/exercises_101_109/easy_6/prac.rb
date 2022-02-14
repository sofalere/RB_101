# Write a method that calculates and returns the index of the first Fibonacci 
# number that has the number of digits specified as an argument. 
# (The first Fibonacci number has index 1.)
=begin
PROBLEM
return the index number of the first fibonacci number that has the amount of 
digits specified by the argument

RULES
fib = [1,1,2,3,5....]
index 1 == first number

ALGORITHM
find fibs:
      [1,1,2,3,5....]
  -. 1st = 1                  1st = 1     1st = 2
    2nd = 1 add them toghert  2nd = 2     2nd = 3

  -. have a counter for each new fib number start at 2
  1st = 1 and 2nd = 1    counter == 2
  1nd = 1     2nd = 2
  1st = 2     2nd = 3
  1st = 3     2nd = 5
  1st = 5     2nd = 8
  1st = 8     2nd = 13    counter == 7
  
  -. checking that the second number is the size that the argument specified
  -. if true return the counter
  
-. set counter = 2
-. 1st = 1
-. 2nd = 1
-. until the second number as digits is the size of the argument
-. 1st, 2nd = 2nd, (1st + 2nd)
-. add 1 to the counter

=end


def find_fibonacci_index_by_length(num)
  counter = 2
  first = 1
  second = 1
  until second.digits.size == num
    first, second = second, (first + second)
    counter += 1
  end
  
  counter
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847