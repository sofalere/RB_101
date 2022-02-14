['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# The return value of this method call is the integer `2`. 

# The `count` method first performs selection, based off the truthiness of the
# return value of the block. The block, as defined by the `do..end` following
# the `count` method invocation, takes each element of the calling collection 
# and assigns it to the `str` argument and passes it into the block one at a time. 
# Then the value held by `str` is used in a comparison operator method that 
# returns a boolean `true` or `false`. `count` returns an integer representing 
# the amount of times the block evaluates to true. 

# The `count` method considers the 'truthiness' of the blocks return value. 
# It returns an integer representing the amount of times the block returns a
# 'truthy' value.