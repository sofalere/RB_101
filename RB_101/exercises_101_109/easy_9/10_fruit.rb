# rules 
#   - display the name of the fruit the amount of times specified by the 
#     number in the array
#   input = nested array
#   output = arrray

# algorithm
#   - iterate over each element in argument
#   - multiply the 1st element in the array by the 2nd element


def buy_fruit(fruits)
  fruits.each_with_object([]) do |food, result|
    result.concat(food * food.pop.to_i)
  end
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]