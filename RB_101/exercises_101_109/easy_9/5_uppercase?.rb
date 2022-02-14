def uppercase?(str)
  str.upcase == str ? true : false
end

p  uppercase?('t') == false
p  uppercase?('T') == true
p  uppercase?('Four Score') == false
p  uppercase?('FOUR SCORE') == true
p  uppercase?('4SCORE!') == true
p  uppercase?('') == true