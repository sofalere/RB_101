# Write a method that displays an 8-pointed star in an nxn grid, 
# where n is an odd integer that is supplied as an argument to the method. 
# The smallest such star you need to handle is a 7x7 grid.
=begin

return a series of lines with different amounts of starts, displaying
an 8 pointed star, the dimensions of which are the odd argument given

RULES
smallest possible = 7
1st, the middle and the last line are 7

every other line has 3 stars w different spaces

ALGORITHM
-. print a row that is 3 stars joined by x amount of spaces and centered n width
     width = n
  x spaces = n - 3 == y / 2 == starting pamount of spaces, down to  0

-. iterate over (( n - 3 ) / 2).downto(0)
      for each number print a row with num spaces
-. print middle row
-. iterate up to for bottom half

*--*--*   line above that has      n characters       4 spaces      7
-*-*-*    line above that has      n - 1 characters   3 spaces    downto
--***     line above middle has    n - 2 characters   2 spaces  ((n / 2) + 2)
*******   middle line is all stars (n * stars)        full line

*---*---*
-*--*--*
--*-*-*
---***            
*********

*  *  *
 * * *
  ***
*******
  ***
 * * *
*  *  *

=end


def print_row(spaces, width)
  stars = ['*'] * 3
  puts stars.join(' ' * spaces).center(width)
end

def star(num)
  (( num - 3 ) / 2).downto(0) { |spaces| print_row(spaces, num) }
  puts '*' * num
  0.upto(( num - 3 ) / 2) { |spaces| print_row(spaces, num) }
end

star(7)
