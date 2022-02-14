=begin
PROBLEM
return the index location of an integer that is between 2 sets
whos sums are equal

if none exists return -1

RULES
empty arrays are 0
  so you can compare an an entire set to an empty subset


INPUT: array of integers
OUTPUT: integer representing the index number of the digit that 
        separates the two equal sums
        
ALGORITHM
[1,2,3,4,3,2,1]   [20,10,-80,10,10,15,35]
size = 7 

1.  arr[0,0] arr[1..-1]   [1,7]    => [] [2,3,4,3,2,1]  
    arr[0,1] arr[2..-1]   [2,6]    => [1] [3,4,3,2,1]
    arr[0,2] arr[3..-1]   [3,5]    => [1,2] [4,3,2,1]
       [0,3]    [4..-1]   [4,4]    => [2,3,1]
       [0,4]    [5..-1]   [5,3]       [3,1]
       [0,5]    [6..-1]   [6,2]       [1]
       [0,6]    [7..-1]   [7,1]       []
    arr[0,7] arr[7..-1]
    

  creating subsets to then add and compare
  iterate the size of the array
  left side length is the index number of the separator
  
1. 0.upto(array.size) do |ind| iterate throug index numbers
      sub1 = arr[0, ind]
      sub2 = arr[ind + 1..-1]
      compare sub1 and sub2 sums
      if they are == return the index

2. end on returning -1 bc that means that none of the substrings 
    matched

=end

def find_even_index(arr)
  0.upto(arr.size) do |ind|
    sub1 = arr[0, ind]
    sub1.size == arr.size ? sub2 = 0 : sub2 = arr[(ind + 1)..-1].sum
    return ind if sub1.sum == sub2
  end
  -1
end


p find_even_index([1,2,3,4,3,2,1])
# p find_even_index([20,10,-80,10,10,15,35])
# p find_even_index([1,100,50,-51,1,1])
# p find_even_index([1,2,3,4,5,6])