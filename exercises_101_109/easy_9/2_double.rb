# method that returns the argument doubled, unless the number is already
# a 'double number'

# rules 
#   - a 'double number' is an even number whos 
#     left and right sides are the same *not reversed, the same
  
# algorithm
#   - method to check if a number is a double number
#     - verify it is even
#     - split into two numbers down the middle and compare the two
#   - if argument is a doble number return it, if not * 2 it and return that


def double?(num)
  num = num.to_s
  if num.size.even?
    true if num == num.slice!(0, (num.size / 2))
  end
end

def twice(num)
  double?(num) ? num : num * 2
end

p  twice(37) == 74
p  twice(44) == 44
p  twice(334433) == 668866
p  twice(444) == 888
p  twice(107) == 214
p  twice(103103) == 103103
p  twice(3333) == 3333
p  twice(7676) == 7676
p  twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p  twice(5) == 10
p  twice(0)