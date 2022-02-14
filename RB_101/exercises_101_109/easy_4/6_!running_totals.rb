# Write a method that takes an Array of numbers, and returns an Array 
# with the same number of elements, and each element has the running 
# total from the original Array.


# def running_total(array)
#   sum = 0
#   new_array = []
#   array.each do |num|
#     sum += num
#     new_array << sum
#   end
#   new_array
# end

# try with inject, map, and each with object

# inject:
# add memo to previously set empty array on each iteration
# inject iteration must end with next sum total as return value

# def running_total(array)
#   new_array = []
#   array.inject(0) do |sum, num|
#     equals = sum + num
#     new_array << equals
#     equals
#   end
#   new_array
# end

# each_with_object
# empty sum var
# add current num to sum
# concat sum to new object

# def running_total(array)
#   sum = 0
#   array.each_with_object([]) do |num, newar|
#     sum += num
#     newar << sum
#   end
# end


# map:
# sum variable, current iteration plus sum variable 
# transformed with map

# def running_total(array)
#   sum = 0
#   array.map { |num| sum += num }
# end

p  running_total([2, 5, 13]) == [2, 7, 20]
p  running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p  running_total([3]) == [3]
p  running_total([]) == []
