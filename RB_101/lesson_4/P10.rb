x = [1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end


# This method call will print the integers `2` and `3` to the screen, each with
# a new line and return the array `[1, nil, nil]`.

# The map method performs transformation on a collection. Each element of the 
# calling array collection is assigned to the `num` argument, and passed in to 
# the block one at a time and ran. `map` will return a new array, that is the 
# same size as the original, populated with the return values of iteration of the block. 
# The return value of each iteration of 
# the block is the return value of the last line of code executed. Which, in
# this case for the first iteration, is the value bound to the `num` variable, 
# since the `if` conditional is not met and the code following the `else` keyword
# is ran. The next two iterations the `if` conditional is met so the objects
# bound to the `num` variable are passed as arguments to the `puts` method,
# that is why they are printed to the screen but since `puts` returns `nil`, it 
# is also why `nil` is what they are 'transformed' to in the new collection returned by `map`.