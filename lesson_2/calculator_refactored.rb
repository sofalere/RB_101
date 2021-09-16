require "pry"

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i.to_s == num
end

def op_to_message(op)
  case op
  when "1"
    'adding'
  when "2"
    'subtracting'
  when "3"
    'multiplying'
  when "4"
    'dividing'
  end
end

prompt 'Welcome to the calculator! Please enter your name:'
name = gets.chomp

prompt "Hey there #{name}!"
prompt 'Lets calculate!'

loop do
  num1 = ''
  prompt "Whats the first number?"
  
  loop do
    num1 = gets.chomp
    if valid_number?(num1)
      break
    else
      prompt"Please enter a valid number."
    end
  end
  
  
  num2 = ''
  prompt "and the second?"
  
  loop do
    num2 = gets.chomp
    if valid_number?(num2)
      break
    else
      prompt "Please enter a valid number."
    end
  end
    
  operator_prompt = <<-YUP
  What would you like to do? 
  1.) add 
  2.) subtract 
  3.) multiply 
  4.) divide
  YUP
  
  prompt(operator_prompt)
  operation = ''
  
  loop do
    operation = gets.chomp
    if (1..4).include? operation.to_i        #book says use %w(1 2 3 4) that makes an array of strings, the operator doesnt need <.to_i>
      break
    else
      prompt("Please choose 1, 2, 3, or 4")
    end
  end
 
  
  result = case operation
           when "1"
             num1.to_i + num2.to_i
           when "2"
             num1.to_i - num2.to_i
           when "3"
             num1.to_i * num2.to_i
           when "4"
             num1.to_f / num2.to_f
           else prompt("Thats an invalid input, please put 1,2,3 or 4")
           end
  
  #op_word = case operation
   # when "1"
   #   'adding'
    #when "2"
     # 'subtracting'
    #when "3"
     # 'multiplying'
    #when "4"
     # 'dividing'
    #end
  
  prompt("#{op_to_message(operation).capitalize} your two numbers...")
  prompt("The result is #{result}!")
  
  prompt('Would you like to perform another operation? (Y to calculate some more!)')
  continue = gets.chomp
  break unless continue == 'Y'
  binding.pry
end