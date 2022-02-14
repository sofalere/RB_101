#method that adds together each element of an integer

def sum(int)
  p int.digits.sum
end

sum(1234)

puts sum(123_456_789) == 45
