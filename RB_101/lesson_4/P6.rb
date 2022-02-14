['ant', 'bear', 'caterpillar'].pop.size

# These method calls will return the value `11`.

# This demonstrates mehtod chaining. The first method to be evaluated is `pop`,
# which is a mutating method that permanently removes the last element of a 
# collection and returns that element. 

# Then, the `size` method is called on the return value of the `pop` method
# invocation, which as we determined is the string `"caterpillar"`. String#size 
# returns a new integer object representing how many characters are in the calling object.