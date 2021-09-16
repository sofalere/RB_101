=begin

#asks for two numbers
#asks for the type of operation to perform: add, subtract, multiply or divide
#displays the result


#input: two numbers and what they want done to it
#output: the result of the operation on the two numbers

#.gets the numbers, save to variables
#save operation to variable
#write a while loop for the operation vaariable, telling the calc what to do at which user input
#puts the result of the opertation


puts "what would you like to do? (type add, subtract, multiply, or divide)"
operation = gets.chomp


def retrieve
  gets.chomp.to_i
end

case operation

  when "add"
    puts "what would you like to add to what?"
    num1 = retrieve
    puts ""
    num2 = retrieve
    puts "#{num1} plus #{num2} equals #{num1 + num2}"
    
  when "subtract"
    puts "what would you like to subtract from what?"
    num1 = retrieve
    puts ""
    num2 = retrieve
    puts "#{num1} minus #{num2} equals #{num1 - num2}"
    
  when "multiply"
    puts "what would you like to multiply by what?"
    num1 = retrieve
    puts ""
    num2 = retrieve
    puts "#{num1} times #{num2} equals #{num1 * num2}"
    
  when "divide"
    puts "what would you like to divide by what?"
    num1 = retrieve
    puts ""
    num2 = retrieve
    puts "#{num1} divided by #{num2} equals #{num1.to_f / num2.to_f}"
    
end

=end



#book way:

puts "whats the first number?"
num1 = gets.chomp.to_i                      #book doesnt .to_i here for the division but I thought typing .to_f at the end
                                            #would do the same thing and save typing
puts "and the second?"
num2 = gets.chomp.to_i

puts "what would you like to do? 1.) add 2.) subtract 3.) multiply 4.) divide"
operation = gets.chomp

if    operation == "1"
         result = num1 + num2
elsif operation == "2"
         result = num1 - num2
elsif operation == "3"
         result = num1 * num2
elsif operation == "4"
         result = num1.to_f / num2.to_f
else puts "thats an invalid input, please put 1,2,3 or 4"
end

puts "The result is #{result}!"