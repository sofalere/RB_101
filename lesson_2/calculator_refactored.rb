require "pry"
require "yaml"
MESSAGES = YAML.load_file('calculator_messages.yml')


def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i.to_s == num
end

def valid_float?(num)
  num.to_f.to_s == num
end

def number?(num)
  valid_number?(num) || valid_float?(num)
end

def op_to_message(op)
  word =  case op
          when "1"
            'adding'
          when "2"
            'subtracting'
          when "3"
            'multiplying'
          when "4"
            'dividing'
          end
  word
end

# def add(numb1, numb2)
#   numb1.to_f + numb2.to_f
# end

# def subtract(numb1, numb2)
#   numb1.to_f - numb2.to_f
# end

# def multiply(numb1, numb2)
#   numb1.to_f * numb2.to_f
# end

# def divide(numb1, numb2)
#   numb1.to_f / numb2.to_f
# end

def calculate(op, num1, num2)
  case op
  when '3' then num1 * num2
  when '4' then num1 / num2
  when '2' then num1 - num2
  when '1' then num1 + num2
  end
end

prompt(MESSAGES['welcome'])
name = gets.chomp.capitalize
prompt(MESSAGES['greet'])
prompt(MESSAGES['hype_up'])

loop do
  num1 = ''
  prompt(MESSAGES['ask_for_first_num'])
  
  loop do
    num1 = gets.chomp
    break if number?(num1)
    prompt(MESSAGES['invalid_number'])
  end
  
  
  num2 = ''
  prompt(MESSAGES['ask_for_second_num'])
  
  loop do
    num2 = gets.chomp
    if number?(num2)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end
    
  operator_prompt = <<-YUP
  #{(MESSAGES['operation'])} 
  1.) add 
  2.) subtract 
  3.) multiply 
  4.) divide
  YUP
  
  prompt(operator_prompt)
  operation = ''
  
  loop do
    operation = gets.chomp
    if %w[ 1 2 3 4].include?(operation)
      break
    else 
      prompt("Please choose 1, 2, 3, or 4")
    end
  end
 
  
  result = calculate(operation, num1.to_i, num2.to_i)
          # else prompt(MESSAGES['welcome'] + "please put 1,2,3 or 4")
          # end
  
  
  prompt("#{op_to_message(operation).capitalize} your two numbers...")
  prompt("The result is #{result}!")
  prompt(MESSAGES['another_operation'])  
  continue = gets.chomp
  break unless continue == 'Y'
end