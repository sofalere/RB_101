require 'pry'
INTEGERS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
  '7' => 7, '8' => 8, '9' => 9, 
}

CHARACTERS = []
INTEGERS.each do |key, _|
  CHARACTERS << key
end

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(CHARACTERS[remainder])
    break if number == 0
  end
  result
end

# def signed_integer_to_string(number)
#   case number[0]
#   when '-' then integer_to_string(number).prepend('-')
#   when '+' then integer_to_string(number).prepend('+')
#   else integer_to_string(number)
#   end
# end

def signed_integer_to_string(number)
  case number <=> 0
  when -1 then "-#{integer_to_string(-number)}"
  when +1 then "+#{integer_to_string(number)}"
  else         integer_to_string(number)
  end
end

p  signed_integer_to_string(4321) == '+4321'
p  signed_integer_to_string(-123) == '-123'
p  signed_integer_to_string(0) == '0'

DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(int)
  string = ''
  int = int * - 1 if int < 0
  loop do
    int, remainder = int.divmod(10)
    string.prepend(DIGITS[remainder])
    break if int == 0
  end
  string
end

def signed_integer_to_string(int)
  if int > 0
    '+' + integer_to_string(int) 
  elsif int < 0
    '-' + integer_to_string(int)
  else
    integer_to_string(int)
  end
end

p  signed_integer_to_string(4321) == '+4321'
p  signed_integer_to_string(-123) == '-123'
p  signed_integer_to_string(0) == '0'