# Write a method that displays a 4-pointed diamond in an n x n grid, 
# where n is an odd integer that is supplied as an argument to the method. 
# You may assume that the argument will always be an odd integer.

=begin
PROBLEM
write a method that displays a diamond on a grid n by n, where n is an
odd integer given as an argument


1
*

3
_*            amount of stars goes down by 2 each line
***           there is an n amount of lines so n / 2 is how many lines are
_*            above the middle line    
              it is mirrored on the bottom  
5             everything is centered
__*
_***
*****
_***
__*


define two method a print row method, and a diamond method
print row will print out a singel row as specified by the arguments of diamond

n stars, distance = argument

def print_row(stars, distance)
  puts ('*' * stars).center(distance)
end

def diamond(int)
  (1..5).step(2)
end

ALGORITHM
1. define center line * times n
2. line above is * times n - 2
3. all lines are centered with a width of n
4. the amount of stars is 2 less each time

1.) print out first line which is 1. cetnered to n
2.) second line which is 1 + 2 centered to n
....
3.) break printing when *s == n
=end

# def diamond(num)
#   stars = 1
#   loop do
#     puts ('*' * stars).center(num)
#     stars += 2
#     break if stars > num
#   end
#   stars =
#   loop do
#     stars -= 2
#     puts ('*' * stars).center(num)
#     break if stars == 1
#   end
# end

def print_row(stars, distance)
  puts ('*' * stars).center(distance)
end

def diamond(int)
  (1..int - 1).step(2).to_a.each { |stars| print_row(stars, int) }
  puts '*' * int
  (1..int - 1).step(2).to_a.reverse.each { |stars| print_row(stars, int) }
end

diamond(5)

diamond(1)

# *

diamond(3)

# *
# ***
# *
 
diamond(9)

#     *
#   ***
#   *****
# *******
# *********
# *******
#   *****
#   ***
#     * 

