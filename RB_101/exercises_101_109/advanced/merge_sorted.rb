# PROBLEM
# take two sorted arrays and combine them into a sorted array without using
# `sort`

# INPUT 2 arrays
# OUTPUT 1 array

# ALGORITHM
# 1. combine two arrays into one
# 2. loop until sorted
#   2. iterate over index numbers
#   3. if arr[ind] > arr[ind + 1] 
#   4. flip them

  
# 1.) sorted?
#       iterate over 0 to size - 1 as checkindex w all
#       check if merged[checkindex] <= merged[checkindex + 1]
  
# def sorted?(array)
#   (0..array.size - 2).all? { |ind| array[ind] <= array[ind + 1] }
# end
  
# def merge(arr1, arr2)
#   arr = arr1 + arr2
  
#   until sorted?(arr)
#     (0..arr.size - 2).each do |ind| 
#       if arr[ind] > arr[ind + 1] 
#         arr[ind], arr[ind + 1] = arr[ind + 1], arr[ind]
#       end
#     end
#   end
#   p arr1 
#   p arr2
#   arr
# end

=begin
Write a method that takes two sorted Arrays as arguments, and 
returns a new Array that contains all elements from both arguments in sorted 
order. Build one element at a time

RULES
2 key things: something happens if a =< b, something else if a > b
                        sorted << a                     sorted << b
                        move on to a2 (break)           move on to b[1]  
                                                        check a vs b[1]...
                                                        
ALGORITHM
-. init a `sorted` empty array
-. init `index` to 0
-. iterate over arr1 [1,5,9] |num1|
    while num1 > arr2[index] && index < arr2.size
      sorted << arr2[index]
      index += 1
    end
    sorted << num1
    
=end

def merge(arr1, arr2)
  sorted = []
  index = 0
  arr1.each do |num1|
    while index < arr2.size && num1 > arr2[index]
      sorted << arr2[index]
      index += 1
    end
    sorted << num1
  end
  sorted.concat(arr2[index..-1])
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]