
# DIGITS = {
#   '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
#   '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
# }

# def integer_to_string(int)
#   int.digits.reverse.map { |dig| DIGITS.rassoc(dig)[0] }.join
# end

# without using `join`:
# - call the modulo to get the remainder of 4321 
#   then 432
#   then 43
#   then 4 
# - use divmod to update the number each time

DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(int)
  string = ''
  loop do
    int, remainder = int.divmod(10)
    string.prepend(DIGITS[remainder])
    break if int == 0
  end
  string
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'