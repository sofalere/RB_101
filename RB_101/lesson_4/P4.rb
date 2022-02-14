x = ['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# The return value of this method call is `{"a"=>"ant", "b"=>"bear", "c"=>"cat"}`.

# The each_with_object method executes a block of code for each element 
# in a collection and provides an object argument, in this case a hash object. 
# Each element of the calling array collection is assigned to the `value` 
# argument. The second argument `hash` references the hash object, and is 
# updated at the end of each iteration.

# Within the block, defined by the `do..end` following the method invocation,
# both element reference and the mutating element assignment methods are used.
# First, a new object is returned by using the `value[0]` reference method on 
# the current value of `value`. Then, that object is permanently assigned as 
# the key of the `hash` hash to the value of `value`.