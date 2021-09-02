# input: one integer argument
#output: one boolean, true if the argument is odd, false if not

#a method which returns true if the argument is odd, false if it isnt

def odd(num)
  num % 2 != 0                #if the remainder of the number divided by two is anyhting but zero, it is an odd number
end

p odd(9)
p odd(2)
p odd(-17)
p odd(-2)