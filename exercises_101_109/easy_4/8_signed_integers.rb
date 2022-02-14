require 'pry'
INTEGERS = {
  '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
  '7' => 7, '8' => 8, '9' => 9, '0' => 0
}

def string_to_integer(str)
  digits = str.chars.map { |num| INTEGERS[num] }
  nums = 0
  
  digits.each { |digit| nums = 10 * nums + digit }
  nums
end

# def string_to_signed_integer(str)
#   if
#     str.start_with?('-') 
#     nstr = str.chars.delete_if { |num| num == '-' }.join
#     string_to_integer(nstr) * -1
#   elsif
#     str.start_with?('+') 
#     nstr = str.chars.delete_if { |num| num == '+' }.join
#     string_to_integer(nstr)
#   else
#     string_to_integer(str)
#   end
# end

# def string_to_signed_integer(str)
#   if str.start_with?('-')
#     string_to_integer(str[1..str.chars.length]) * -1
#   elsif str.start_with?('+')
#     string_to_integer(str[1..str.chars.length])
#   else
#     string_to_integer(str)
#   end
# end

def string_to_signed_integer(str)
  signed = string_to_integer(str[1..-1])
  
  case str[0]
  when '-' then -signed
  when '+' then signed
  else string_to_integer(str)
  end
end
p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

# def string_to_integer(string_array)
#   digit_array = string_array.map { |char| DIGITS[char] }
#   total = 0
#   digit_array.each { |digit| total = total * 10 + digit }
#   total
# end

# def string_to_signed_integer(string)
#   string_array = string.chars
#   if !DIGITS.include?(string_array.first)
#     sign = string_array.shift
#     total = string_to_integer(string_array)
#     sign == '-' ? total * - 1 : total
#   else
#     string_to_integer(string_array)
#   end
# end

# BOOK anaswer:

def string_to_integer(string)
  digit_array = string.chars.map { |char| DIGITS[char] }
  total = 0
  digit_array.each { |digit| total = total * 10 + digit }
  total
end

def string_to_signed_integer(string)
  signed_string = string_to_integer(string[1..-1])
  
  case string[0]
  when '-' then -signed_string
  when '+' then signed_string
  else string_to_integer(string)
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100