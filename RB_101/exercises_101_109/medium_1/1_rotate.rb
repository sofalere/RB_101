# write a method that rotates an array by moving the first element to the 
# end of the array without modifiying the original

# input: array
# output: array 
# rules:  - elemenent at index location `0` is at the last index location now
#         - all elements are shifted one index to the left except for first
#         - a single element array is unchanged
#         - original array is unhanged

# ALGORITHM
# option 1
#   - duplicate array object
#   - remove the first element
#   - add that element to the end
#   - return array

# def rotate_array(array)
#   working_array = array.map { |element| element.dup }
#   shifted_element = working_array.shift
#   working_array << shifted_element
# end

# option 2
#   - use non-mutating element reference to return a new array
#   - add elements from [-1, 1] + [0]

def rotate_string(string)
  rotate_array(string.chars).join
end

def rotate_integer(int)
  rotate_array(int.to_s.chars).join
end

def rotate_array(array)
  array[1..-1] + [array[0]]
end
p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

p x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x #== [1, 2, 3, 4]                 # => true

y = 'abcdefgh'
p rotate_string(y)
p y

z = 1005
p rotate_integer(z)
p z

c = 009
p c