def prompt(message)
  puts "=>#{message}"
end

def real_name?(name)
  name =~ /[a-zA-Z]/
end
  
def real_number?(num)
  num.to_f.to_s == num || num.to_i.to_s == num && num.to_i > 0
end

def display_incorrect_warning
  puts "Please enter a valid input:"
end

def display_input_back(type, value)
  puts "=>Your #{type} is #{value}."
end

def ask_for_input(type)
  puts "=>What is your #{type}?"
end

def payment_calc(loan_amount, monthly_apr, loan_duration)
  loan_amount * (monthly_apr / (1 - (1 + monthly_apr)**(-loan_duration)))
end

  
greeting = <<-YUP
Welcome to your loan calculator! 
  I'm here to help figure out your monthly payment.
  Whats your name?
YUP
  
prompt greeting
  
name = ''
loop do
  name = gets.chomp.capitalize
  break if real_name?(name)
  display_incorrect_warning
end

prompt "Nice to meet you #{name}, let's get started."
  

loop do  
  amount_type = "loan amount"  
  
  ask_for_input(amount_type)
 
  loan_amount = ''
  loop do
    loan_amount = gets.chomp
    break if real_number?(loan_amount)
    display_incorrect_warning
  end
  
  display_input_back(amount_type, loan_amount)

  apr_type = "APR"
  ask_for_input(apr_type)
  prompt "Example: 5 if 5% or 2.5 if 2.5%"
  
  apr = ''
  loop do
    apr = gets.chomp
    break if real_number?(apr)
    display_incorrect_warning
  end
  
  display_input_back(apr_type, apr)
  
  duration_type = "duration of loan in years"
  ask_for_input(duration_type)
  
  duration_years = ''
  loop do
    duration_years = gets.chomp
    break if real_number?(duration_years)
    display_incorrect_warning
  end
  
  
  display_input_back(duration_type, duration_years)
  prompt "Thank you. I'll get to calculating..."
  
  apr_percentage = apr.to_f / 100
  monthly_apr = apr_percentage / 12
  duration_months = duration_years.to_f * 12.0
  loan_amount = loan_amount.to_f
  
  monthly_payment = payment_calc(loan_amount, monthly_apr, duration_months)
  
  prompt "Your monthly payment is $#{monthly_payment.round(2)}."
  prompt "Another calculation? (Y/N)"
  answer = gets.chomp
  break unless answer == "Y"
end

prompt "Thank you for using the loan calculator, have a nice day #{name}!"