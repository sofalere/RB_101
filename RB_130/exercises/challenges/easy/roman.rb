=begin
PROBLEM retutnr the roman numeral equivolent


RULES
  I = 1
  V = 5
  X = 10
  L = 50
  C = 100
  D = 500
  M = 1000
  
CDII = 402      100, 500,  1,  1

DLXXV = 575     500, 50,   10, 10, 5

CMXI = 911      100, 1000, 10, 1 

CLXIII = 163    100, 50,   10, 1,  1, 1

CXLI = 141      100, 10,   50, 1

APPROACH 
save values and numbers in a hash. when given a number check if it can be 
divided by 1000, then 900, and so on


=end

class RomanNumeral
  attr_accessor :num
  
  # ROMAN_NUMERALS = { "M" => 1000,
  #                   "CM" => 900,
  #                   "D" => 500,
  #                   "CD" => 400,
  #                   "C" => 100,
  #                   "XC" => 90,
  #                   "L" => 50,
  #                   "XL" => 40,
  #                   "X" => 10,
  #                   "IX" => 9,
  #                   "V" => 5,
  #                   "IV" => 4,
  #                   "I" => 1    }
  
  ROMAN_NUMERALS = 
  {
  "I" => 1,
  "IV" => 4,
  "V" => 5,
  "IX" => 9,
  "X" => 10,
  "XL" => 40,
  "L" => 50,
  "XC" => 90,
  "C" => 100,
  "CD" => 400,
  "D" => 500,
  "CM" => 900,
  "M" => 1000, }
  
  def initialize(num)
    @num = num.to_i
  end

  def to_roman
    roman = ''
    number = num
    ROMAN_NUMERALS.sort_by { |_, val| val }.reverse.each do |rom_char, rom_num|
      divisor, _ = number.divmod(rom_num)
      
      if divisor > 0
        roman << (rom_char * divisor)
        number -= (rom_num * divisor)
      end
    end
    roman
  end
end
