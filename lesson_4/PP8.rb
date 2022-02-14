numbers = [1, 2, 3, 4]
x = numbers.each do |number|
  p number
  numbers.pop(1)
end
p x
p numbers

# This code will print the first element `1` to the screen. The next line will 
# permanently remove one element from the end of the array, so `4` is deleted.
# Then, on the second iteration `2` will be printed to the screen, and the last
# element is deleted again, so `3` is gone too. Iteration stop here as there are no 
# more elements left to iterate over.
# This is very bad practice as you should never mutate the calling collection.
# # while iterating through it.