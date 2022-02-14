[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# The return value of this method call with be a new array containing all the 
# elements in the original calling array, since every element will be 'selected'.

# The `select` method performs selection based on the truthiness of blocks 
# return value. The last line executed in the block is a string 
# (which since it is not `false` nor `nil`, has a truthy value).
# This means the return value of the block will always be 'truthy', so `select`
# will return a new array containing all the elements in the original calling 
# array, since every element will be 'selected'.
