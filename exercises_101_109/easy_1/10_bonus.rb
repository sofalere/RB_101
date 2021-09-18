def calculate_bonus(int, bool)
  bonus = 0
  bonus = int/2 if bool 
  bonus
end

p calculate_bonus(2000, false)
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000


#book answer

def calc_bonus(salary, bonus)
  bonus ? (salary / 2) : 0
end

puts calc_bonus(2800, true) == 1400
puts calc_bonus(1000, false) == 0