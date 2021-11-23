=begin
define a method that takes an array and multiplies each element in that array by a specified number

rules:
  -non-mutating
  -array is integers, so is argument 
  

algorithm:
  -create an empty array to contain new modified array
  -set counter = 0
  -for the element referenced by the counter multiply by the parameter given
  -save the multiplied element into the new array
  -repeat until the counter is the size of the array
  -return the new array


=end

def multiply(numbers, multiplier)
  multiplied_array = []
  counter = 0
  
  loop do
    break if counter == numbers.size
    
    multiplied_array << numbers[counter] * multiplier
    
    counter += 1
  end
  
  multiplied_array
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 4)


