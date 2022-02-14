# Write a method that takes an Array as an argument, and sorts that Array using 
# the bubble sort algorithm as just described. Note that your sort will be 
# "in-place"; that is, you will mutate the Array passed as an argument. 
# You may assume that the Array contains at least 2 elements.

# A bubble sort works by making multiple passes (iterations) through the Array. 
# On each pass, each pair of consecutive elements is compared. 
# If the first of the two elements is greater than the second, 
# then the two elements are swapped. This process is repeated until a 
# complete pass is made without performing any swaps; at that point, 
# the Array is completely sorted.

# input: array
# output: same array but sorted

# rules:
# - each iteration starts at index[0], next one, etc, till end
# - 1st element > 2nd, swap elements
#   indexed assignment
# -iteration stops when no swaps are made

# - create a loop runs another loop, break when calling array == return value
#   - create a second loop inside iterating up to each index number
#   - if element[index_num] > element[index_num + 1] 
#     element[inex_num +1], element[index+num] = element[inex_num], element[index_num +1]


def bubble_sort!(array)
  while no_swaps != array.size
  no_swaps = 0
  right = 0
  
    (0..array.size - 1).each do |left|
      right += 1 if left + 1 != array.size
      
      if array[left] > array[right] 
        array[left], array[right] = array[right], array[left]
        next
      end 
      no_swaps += 1
    end
  end
end

p  array = [5, 3]
  bubble_sort!(array)
p  array == [3, 5]
  
p  array = [6, 2, 7, 1, 4]
  bubble_sort!(array)
p  array == [1, 2, 4, 6, 7]
  
p  array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
  bubble_sort!(array)
p  array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)


PROBLEM
return the same array sorted in place by comparing each consecutive element

RULES
must complete a whole iteration so index[0] to index[arr.size - 1]

loop 
swapped = false
arr.size- 1 TIMES as `ind`
                compare 
                ar[ind] and arr[ind+1]
                ar[1] and arr[2]
                ....
                
                  a > b 
                TRUE swap a and b 
                  set swapped variable to true

break condiiton swapped == false

must be destructive
loop 
set swapped to false
  a <= b 
  TRUE do nothig
  FALSE swap a and b 
        set swapped variable to true
break if swapped variable == false
=end

def bubble_sort!(arr)
  loop do 
  swapped = false
  
  (arr.size - 1).times do |ind|
    if arr[ind] > arr[ind+1]
      arr[ind], arr[ind+1] = arr[ind+1], arr[ind]
      swapped = true
    end
  end
  break if swapped == false
  end

end