=begin
PROBLEM
Merge sort is a recursive sorting algorithm that works by breaking down the
array elements into nested sub-arrays, then recombining those nested sub-arrays 
in sorted order. It is best shown by example. For instance, let's merge sort 
the array [9,5,7,1]. Breaking this down into nested sub-arrays, we get:

[9, 5, 7, 1] ->
[[9, 5], [7, 1]] ->
[[[9], [5]], [[7], [1]]]

merge each pair of nested subarrays

[[[9], [5]], [[7], [1]]] ->
[[5, 9], [1, 7]] ->
[1, 5, 7, 9]

RULES
split array into 2 subarrays, then split those two into subarrays, etc
split an array into to subarrays
      split that subarray into subarrays
      split until the subarray only has 1 element


ALGORITHM
split into subarrays until each subarray only has one element
-. slice from 0..end point
    end point = array.size / 2 - 1
   slice from start point..-1
    start point = array.size / 2
    
-. push slices into one array (consecutively)
-. if first slice is equal to the array then stop 

-. init sliced array []
-. loop 
      
    [arr[0..midend]] + [arr[midstart..-1]]
    
    [[9, 5], [7, 1]]
    push into sliced array
    check if 
    
    for [9,5]                                 
    [arr[0..midend]] + [arr[midstart..-1]]
    [[9], [5]] 
    
    for [7, 1]
    [arr[0..midend]] + [arr[midstart..-1]]
    [[7], [1]]
    
    
=end

def merge_sort(array)
  2.times do
    
  array.each do
   p array = [array[0..(array.size / 2 - 1)], array[(array.size / 2 )..-1]]
  end
  
  
  end
end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == 
%w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == 
[1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]