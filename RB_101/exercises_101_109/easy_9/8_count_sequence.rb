# method that takes two arguments. the first is the amount of elmenents
# the array will have, the second is the number whos multiples will
# populate the array

# rules
#   - the second argument is multiplied by the iteration the loop is on
#     *so if we need three elements we add an element three times
#     multiplying by 1 the 1st time, 2 the 2nd and so on
#   - return empty array if 0

# algorithm
#   - define an empty array
#   - create a loop that will go '1st argument' amount of times
#     adding an element to the empty array
#   - ensure the element is correctly multiplied before each addition
#   - return array

def sequence(length, int)
  results = []
  for num in 1..length
    results << int * num
  end
  results
end

p  sequence(5, 1) == [1, 2, 3, 4, 5]
p  sequence(4, -7) == [-7, -14, -21, -28]
p  sequence(3, 0) == [0, 0, 0]
p  sequence(0, 1000000) == []