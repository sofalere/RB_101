# rules 
#   - return middle character of string
#   - 1 if odd, 2 if even
#   - include spaces
#   - if 1 char, print that char

# algorithm
#   - determine if the string is odd or even
#   - print the string index that is the halfway point for the size of the string


def center_of(str)
  mid = (str.size / 2)
  str.size.odd? ? str[mid] : str[(mid - 1), 2]
end

p  center_of('I love ruby') == 'e'
p  center_of('Launch School') == ' '
p  center_of('Launch') == 'un'
p  center_of('Launchschool') == 'hs'
p  center_of('x') == 'x'