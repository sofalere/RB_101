x = { a: 'ant', b: 'bear' }
x.map! do |key, value|
  if value.size > 3
    value
  end
end

# This method call will return the array `[nil, "bear"]`.

# The map method performs transformation on a collection. Each key-val pair of the 
# calling hash collection is assigned to the `key` and `value` arguments, 
# respectively, and passed in to the block one at a time and ran. `map` will 
# return a new array, that has the same amount of elements as the calling 
# collection, populated with the return values of the block. The return value 
# of each iteration of  the block is the return value of the last line of code 
# executed. Which, in this case is `nil` for the first iteration, since the 
# `if` conditional on line 2
# was not met. And then `"bear"` for the second iteration since the conditioal
# was met and the last line of code to be evaluated is just `value` variable
# which points to the string `"bear"`