=begin

PROB convert an octal number to a decimal number

RULES
#   233 # decimal
# = 2*10^2 + 3*10^1 + 3*10^0
# = 2*100  + 3*10   + 3*1
    200    + 30     + 3

# 233 # octal
# = 2*8^2 + 3*8^1 + 3*8^0
# = 2*64  + 3*8   + 3*1
# = 128   + 24    + 3
# = 155
 - in decimal,1st 10 ^0  in ocatl 1st 8 ^0
              2nd 10 ^1           2nd 8 ^1
              3rd 10 ^2           3rd 8 ^2

octal   ten            
130  == 88         
1* 8**2
3* 8**1
0* 8**0
11   == 9

RULES
 - return 0 if contains any chars that arent numbers
 - return 0 if over 6000

APPROACH
 - init with string number
 
 define `to_decimal` 
  - return 0 if includes non numbers
  - results = 0
  - set index location to 0
  - num.string size - 1 downtto 0 times |exponent|
      - results += char at index location to_i * 8 ** exponent
      - increment index location
  - return results
=end

class Octal
  attr_reader :numstr
  
  def initialize(numstr)
    @numstr = numstr
  end
  
  def to_decimal
    # return 0 if numstr.match?(/[a-z]/i) || numstr.to_i == 8 || 
    #                     numstr == '6789'|| numstr.to_i == 9
    return 0 unless valid_octal?(numstr)
            
    results = 0
    index = 0
    
    (numstr.size - 1).downto(0) do |exponent|
      num = numstr[index].to_i
      results += num * 8**exponent
      index += 1
    end
    results
  end
  
  def valid_octal?(num)
    num.chars.all? { |n| n =~ /[0-7]/ }
  end
end

