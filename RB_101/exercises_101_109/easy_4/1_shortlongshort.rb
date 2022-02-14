# PROBLEM
# takes two strings as arguments, 
# determines the longest of the two strings, 
#   - place two strings in array and sort it
# and then returns the result of concatenating the shorter string, 
#   the longer string, and the shorter string once again.
#   - add teh 1st element(shortest) to end and join



def short_long_short(string1, string2)
  sorted = [string1, string2].sort_by { |str| str.size }
  sorted.push(sorted[0]).join
# OR
  shortest, longest = [string1, string2].sort_by { |str| str.size }
  shortest + longest + shortest
end

# PROBLEM
# takes two strings as arguments, 
# determines the longest of the two strings, 
#   - if a > b a = longest, reverse
# and then returns the result of concatenating the shorter string, 
#   the longer string, and the shorter string once again.
#   - short, long, short, join


def short_long_short(string1, string2)
  if string1.size > string2.size
    longest = string1 
    shortest = string2
  elsif string1.size < string2.size
    longest = string2 
    shortest = string1
  end
# OR
  string1.length > string2.length ? string2 + string1 + string2 : string1 + string2 + string1
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"