# PROBLEM:
# design a calculator that uses:
# the loan amount (p)
# the Annual Percentage Rate (APR)
# the loan duration (n)

# to find the:
# monthly interest rate (j)
# loan duration in months
# monthly payment (m)

# formula: m = p * (j / (1 - (1 + j)**(-n)))
# monthly_payment = loan_amount * 
#                   (monthly_interest_rate / 
#                   (1 - (1 + monthly_interest_rate)**(-loan_duration) ))

# ALGORITHM
# -ask user for loan amount in float
# -ask user for APR in float
# -ask user for loan duration in float

# -find the monthly interest rate
#   -divide the annual interest rate by 12

# -find the loan duration in months 
#   -mult by 12

# -plug into formula for monthly_payment

def prompt(message)
  puts "=> #{message}"
end

prompt "What is your loan amount?"
loan_amount = gets.chomp.to_f

prompt "What is your APR?"
annual_rate = gets.chomp.to_f * 0.01

prompt "What is your loan duration in years?"
yearly_duration = gets.chomp.to_i

monthly_rate = annual_rate / 12

monthly_duration = yearly_duration * 12

monthly_payment = format('$%.2f', loan_amount * 
                  (monthly_rate / 
                  (1 - (1 + monthly_rate)**(-monthly_duration) )))
                  
prompt "Your monthly payment is #{monthly_payment}"