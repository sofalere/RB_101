require 'pry'

# def remove_vowels(ar)
#   ar.map do |word|
#     word.chars.delete_if { |let| %(aeiouAEIOU).include?(let) }.join
#   end
# end

def remove_vowels(strings)
  strings.map { |string| string.delete('aeiouAEIOU') }
end

# could've used the string#delte method instead of breaking the string into 
# another array and then joining it back

p  remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p  remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p  remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']