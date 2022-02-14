def display(string)
  puts ">> " + string
end

def valid?(num)
  num.to_i.to_s == num
end

=begin
def sum_of_integers(array)
  sum = 0
  array.each do |num|
    sum += num
  end
  sum
end

def product_of_integers(array)
  product = 1
  array.each do |num|
    product *= num
  end
  product
end
=end

def sum_of_integers(array)
  array.inject(:+)                      #the inject method combines all elements of array using the specified operation
end                                     #the symbol :+ is the same as the block { |sum, n| sum + n } 

def product_of_integers(array)
  array.inject(:*)
end

integer = ''
loop do
  display("Please enter an integer greater than 0")
  integer = gets.chomp
  break if valid?(integer)
end


function = ''
loop do
  display("Enter 's' to compute the sum, 'p' to compute the product.")
  function = gets.chomp
  break if function == 's' || function == 'p'
end


integer_range_array = (1..integer.to_i).to_a
sum = sum_of_integers(integer_range_array)
product = product_of_integers(integer_range_array)


if function == 's' 
    display("The sum of the integers between 1 and #{integer} is #{sum}.")
elsif function == 'p'
    display ("The product of the integers between and #{integer} is #{product}.")
end


