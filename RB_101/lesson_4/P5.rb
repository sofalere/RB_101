hash = { a: 'ant', b: 'bear' }
hash.shift
p hash
# This method calls return value is the array `[:a, "ant"]`.

# This demonstrates a mutating method used on a hash. The `shift` method
# permanently removes the first element of a collection, in the case of a 
# hash it is a key-value pair. It then returns that value in a new array.