# 10.times { |num| puts (' ' * num) + "The Flintstones Rock!" }

# This demonstrates string concatenation.
# The string "The Flintstones Rock!" will be printed to the screen
# 10 times, each iteration will be prepended with a space, adding
# a space per iteration.

# puts "the value of 40 + 2 is #{4 + 2}"

# this will raise a type error exception because we're attempting
# to add an integer to a string. We could 

# limit = 15

# def fib(first_num, second_num)
#   while first_num + second_num < limit
#     sum = first_num + second_num
#     first_num = second_num
#     second_num = sum
#   end
#   sum
# end

# result = fib(0, 1)
# puts "result is #{result}"

# the above code will raise a variable error because of the ```limit```
# variable on the second line of the method definition. That is because 
# although a local variable ```limit``` is initialized, the scoping
# rules of a method definition don't allow access to variables from other 
# scopes, the only way a method could access a local variable is upon
# method invocation, with the passing of the varibale as an argument,
# or through yielding to a block.


# answer = 42

# def mess_with_it(some_number)
#   some_number += 8
# end

# new_answer = mess_with_it(answer)

# p answer - 8


# The mess_with_it method takes the local variable answer as an argument
# and reassigns it to the value of itslef plus 8. This isplays how ruby
# does seem to pass by value, the reassignment performed on line 27 is non-mutating,
# actually there is no method that can mutate the immutable integer class

# The new value is assigned to the new_answer variable on line 30 but has no affect on the original
# answer variable.

# The output of the p method call on line 32 will be the integer 34 with
# a return value of 34.


# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# def mess_with_demographics(demo_hash)
#   demo_hash.values.each do |family_member|
#     family_member["age"] += 42
#     family_member["gender"] = "other"
#   end
# end

# This demonstrates that the indexed assignment method ```#[]```
# is mutating. Reassignment is performed ```lines 57 and 58``` (where the 
# ```age``` key in the ```family_members``` hash now has a value of
# its original value plus 42, and the ```gender``` key has a value of
# ```other```). This causes new references to be formed by binding the 
# specified collection element to the new object, the collection as 
# a whole is not reassinged, meaning it is mutated. The element reassignment
# is an example of pass by value, but the collection as a whole
# is pass by reference.

# def foo(param = "no")
#   "yes"
# end

# def bar(param = "no")
#   param == "no" ? "yes" : "no"
# end

# bar(foo)


# 1.
10.times do |num|
  puts num
  puts "The Flintstones Rock!".center(num)
end

