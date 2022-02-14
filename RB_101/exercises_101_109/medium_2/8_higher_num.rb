# A featured number (something unique to this exercise) is an odd number that 
# is a multiple of 7, and whose digits occur exactly once each. 
# So, for example, 49 is a featured number, but 98 is not (it is not odd), 
# 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

# Write a method that takes a single integer as an argument, and returns the next 
# featured number that is greater than the argument. Return an error message 
# if there is no next featured number.

# input: integer
# output: NEXT greatest 'featured' integer

# rules:
# - there are no higher 'featured' nums after 9_999_999_999
# - featured number =
#     - odd
#     - divisble by 7
#     - each digit doesnt repeat

# - determine the next featured number
# - keep adding 1 to the argument until the result is divisble by 7
#   -if it is 
#     - check that its odd, 
#       - if not add 7
#     - check that no numbers repeat, 
#       - if not go back to adding 7 
# -return that number

def featured(number)
  number = number
  
  for num in number + 1..9_999_999_999 
    if num % 7 == 0
      loop do
        if num.odd? && num.to_s.chars.uniq == num.to_s.chars
          return num 
        else 
          num += 7
          break if num >= 9_999_999_999 
        end
      end
    end

  end
  
end

  
p  featured(12) == 21
p  featured(20) == 21
p  featured(21) == 35
p  featured(997) == 1029
p  featured(1029) == 1043
p  featured(999_999) == 1_023_547
p  featured(999_999_987) == 1_023_456_987
  
p  featured(9_999_999_999)