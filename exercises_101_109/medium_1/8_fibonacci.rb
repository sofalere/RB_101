# recursive methods call themselves at least once
# they have a condition that stops the recursion
# they use their own return value

# fib series = 
# - sequence where each next number is the sum of the previous two
# 1, 1, 2, 3, 5, 8, 13, 21

# F(1) = 1
# F(2) = 1
# F(n) = F(n - 1) + F(n - 2) where n > 2

# write a method that returns the nth number in the fib series

# input: integer
# output: integer
# finds 2nd number in sequence
# find 5th number in sequence

# 1, 1, 2, 3, 5, 8, 13, 21

def fibonacci(n)
  return 1 if n <= 2
  fibonacci(n - 1) + fibonacci(n - 2)
end

p  fibonacci(1) == 1
p  fibonacci(2) == 1
p  fibonacci(3) == 2
p  fibonacci(4) == 3
p  fibonacci(5) == 5
p  fibonacci(12) == 144
p  fibonacci(200) == 6765