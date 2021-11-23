# wrtie a method that returns a value containing random numbers and
# letters in the pattern 8-4-4-4-12

# rules:
#   -only use lowercase letters and numbers
#   -must be represented as a string
  
# algorithm: 
#   -set an empty array 
#   -create a variable that includes a..z and 0..9
#   -fill the array with a random order of that vairable

letters_and_numbers = ('a'..'z').to_a + (0..9).to_a

letters_and_numbers.map! { |chr| chr.to_s }



# one = []

# until one.length == 8
#   current_num = letters_and_numbers.shuffle[0]
#   one << current_num
# end

# p one


letters_and_numbers.each_with_object([]) do |chars, arry|
  index = (0..31)
  p index.sort_by { |num| num.rand }
  
end

