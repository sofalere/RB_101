=begin
define a method that doubles each element in an array and modifies the orginial array

input: an array of integers
output: the same object array but with each integer doubled

explicit rules:
  -double each number
  -mutate the array object

algorithm:
 -iterate over each element in the array
 -double the element by multiplying it by 2 or adding itself to itself
 -using element reference place the doubled integer back into the orginial array

=end


 # array.map! do |int|
  #   int = int * 2
  # end
  


def double_numbers!(array)
  counter = 0
  
  loop do     
    break if counter == array.length
    
    current_num = array[counter] 
    array[counter] = current_num * 2
    
    counter += 1
  end
  
  array 
end



my_numbers = [1, 4, 3, 7, 2, 6]

p double_numbers!(my_numbers)

p my_numbers