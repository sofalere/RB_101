# input: string
#output: reveresed version of that string

#needs to:
  #-be true if not reversed
  #-any number of spaces returns ""

def reverse(string)
  string.split.reverse.join(' ')
end

puts reverse("hello there")
puts reverse("hey") == "hey"

puts reverse("     ") == ""