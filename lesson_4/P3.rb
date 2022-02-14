x = [1, 2, 3].reject do |num|
  puts num
end

# The integers `1` `2` and `3` will be displayed on the standard ouput, separated by
# newlines. The return value of this method call will be a new array containing 
# all the elements of the original calling array.

# The `reject` method performs selection based on the 'falseyness' of the return 
# value of the block.  If the blocks return value is 'falsey' (so objects `false` or `nil`) 
# the corresponding element will be added to the new array collection and returned. 

# Here, within the block defined by the `do..end` following the `reject` method 
# invocation, the value held by the `num` variable is passed to `puts` as an 
# argument. `puts` prints that value to the screen and, crucically in this case,
# returns `nil`. Since that is the last line of code evaluated in the block, the 
# blocks return value will always be 'falsey', so all element are selected.