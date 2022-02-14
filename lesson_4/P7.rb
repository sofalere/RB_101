[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# This method call will display the number `1` to the screen with a newline 
# following it. And a return value of the boolean `true`.

# The iterative `any?` method determines if the block evaluates to true for any of 
# the elements in a collection. Each element of the calling collection is 
# assigned to the `num` argument and passed in to the block one at a time. 
# Iteration stops and a boolean `true` object is returned if a blocks return 
# value evaluates to true. Within the block, the value represented by `num` is passed
# as an argument to `puts`, so that object is printed to the screen, and then
# the `odd?` method is called on the object. For the first iteration, the 
# variable `num` points to `1` so the last line of code evaluates to true. Which
# stops iteration since `any?` can guarantee the return value.