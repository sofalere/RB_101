# create a number that takes a positive integer number and returns the next
# bigger number formed by the same digits
# if no bigger number can be formed, return -1

# input: integer
# output: integer
#   rules:
#     - output must be the NEXT largest number made by the same integers
#     - if none exists, -1 is the output

# ALGORITHM
#   - determine maximum number by reverse sorting
#   - create a range of numbers from the given number to the maximum number
#       -return `-1` if the given number is the max number
#   - iterate over array and return the first number which has the same characters
#     as the given number
# #   - determine numbers that have the same characters
# #       - 
  
def bigger(integer)
  max_number = integer.to_s.chars.sort.reverse.join.to_i

  (integer + 1..max_number).each do |combination|
    if integer.to_s.chars.sort == combination.to_s.chars.sort
      return combination
    end
  end
  
  -1
end

# create a number that takes a positive integer number and returns the next
# bigger number formed by the same digits
# if no bigger number can be formed, return -1

=begin
PROBLEM
return the next biggest number that can be formed by the same digits,
if none exits return -1

RULES
all permutations woudl take too long
what I need to do is focus on the last few digits, 
if its 1 digit, return -1

check if the numbers at index[-2] < index[-1]
  TRUE swap them and return integer
  FALSE return - 1

=end


def bigger(int)
  dig = int.digits.reverse
  dig.combination
end

p bigger(9) == -1
p bigger(12) == 21
p bigger(513) == 531
p bigger(592) == 925
p bigger(2017) == 2071
p bigger(111) == -1
p bigger(531) == -1
p bigger(123456789) == 123456798