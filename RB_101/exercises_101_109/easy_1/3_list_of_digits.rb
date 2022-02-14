# input: digits
#output: an array of the digits

#write a method that turns the digits into a string, splits them, and places them into an array

def digit_list(dig)
  arr = dig.to_s.split(//)
  p arr.map { |num| num.to_i }
end

digit_list(124325)


digit_list(4)
puts digit_list(4) == [4]
puts digit_list(35233) == [3,5,2,3,3]

=begin
book answer:

def digit_list(num)         
  num.to_s.chars.map(&:to_i)                
end

BREAKDOWN

num.to_s                convert the number to a string so that the .chars method can me called
.chars                  method returns an ARRAY of characters
.map                    creates a new array
(&:to_i)                SYNTAX SUGAR shorthad for array.map { |thing| thing.to_i }


=end