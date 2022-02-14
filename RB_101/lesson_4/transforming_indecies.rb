=begin

write a method that transforms only the elements in an array that have odd indecies

input: array
output: same object array 

explicit:
 -array contains integers
 
questions?
  -is 0 considered even? must be
 
algorithm:
  -check if an element in array is in an odd index
  -if it is double that integer and mutate the index
  -if its not go on to the next index
  -repeat those steps until all indecies have been checked
  -return modified array

=end

def modify_index!(numbers)
  counter = 0
  
  loop do
    break if numbers[counter] == numbers.size
    
    if counter.odd? 
      numbers[counter] = numbers[counter] * 2
    end
    
    counter += 1
  end
  
  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]

p modify_index!(my_numbers)