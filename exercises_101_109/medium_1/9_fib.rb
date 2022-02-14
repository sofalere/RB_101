def fibonacci_rec(nth)
  return 1 if nth <= 2
  fibonacci_rec(nth - 1) + fibonacci_rec(nth - 2)
end

# rewrite the recursive fib method to be procedural 
# use looping?
# num1 + num2 = num3
# num2 + num3 = num4
# num3 + num4 = num5
# num4 + num5 = num6

# 1st round [0] + [1] = [2]
# 2nd tounf [1] + [2] = [3]

# start with a 2 element array wiht numbers 1 and 1
# set the third element to equal the 1st two added
# set the 4th element to equal the previous two added
# the sum is always going to the next index location `add 1`
# the index locations of the 'adding' numbers are always sums index location - 2, and the sums index location - 1


# fibonnacci array = [1, 1]
# loop from 0 - arg -1 
# array[parameter + 2] = array[parameter] + array[parameter + 1]


def fibonacci(nth)
  fib = [1, 1]
  (nth - 2).times { |i| fib[i + 2] = fib[i] + fib[i + 1] }
  fib.last
end

#BOOK

def fibonacci(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end
  last
end

p  fibonacci(20)  == 6765
p  fibonacci(100) == 354224848179261915075
p  fibonacci(100_001)