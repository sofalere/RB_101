ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# p ages.values.min

# First, the `values` method implicitly returns an array of all the values from the
# hash bound to the `ages` variable. 

# Then, the selection method `min` is called on that array. `min`, internally 
# uses the elements own combined comparison operator method (spaceship operator),
# which in this case is the Integer#<=> and will compare the elements 
# numerically. 

# The return value will be the smallest element as determined by the `<=>` , 
# so the integer `10`.

p ages.select! { |y| y == "Herman" }