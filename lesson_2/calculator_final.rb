def prompt(message)
  puts "=> #{message}"
end

def calculate(op, num1, num2)
  case op
  when '1' then num1 + num2
  when '2' then num1 - num2
  when '3' then num1 * num2
  when '4' then num1 / num2
  end
end

def real_num?(num)
  num.to_i.to_s == num || num.to_f.to_s == num
end

def get_num(number_selection)
  num = ''
  loop do
    prompt("Input number #{number_selection}.")
    num = gets.chomp
    break if real_num?(num)
    prompt("Sorry not a valid number.")
  end
  num
end

def get_operation
  loop do
    prompt("What would you like to do?
      1.) add
      2.) subtract
      3.) multiply
      4.) divide")
    operation = gets.chomp.to_i
    break operation if (1..4).cover?(operation)
    prompt("invalid input")
  end
end

def op_display(op)
  case op
  when '1' then 'adding'
  when '2' then 'subtracting'
  when '3' then 'multiplying'
  when '4' then 'dividing'
  end
end

def keep_calculating?
  prompt "Want to do another calculation (y/n)?"
  answer = gets.chomp
  true if answer == 'y'
end

loop do
  prompt "Welcome to the calculator!"
  num1, num2 = [1, 2].map { |num_select| get_num(num_select).to_f }
  operation = get_operation.to_s
  result = calculate(operation, num1, num2)
  prompt "Okay, #{op_display(operation)} #{num1} and #{num2}"
  prompt "The result is: #{result}"
  break unless keep_calculating?
end
