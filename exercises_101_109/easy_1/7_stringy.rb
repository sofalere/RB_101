#method that takes an integer and returns 101010 and the amount of digits is the integer

def stringy(int)
  ar = []
  int.times do |int| 
              if int % 2 != 0 
                ar << 0
              else 
                ar << 1
              end
            end
  ar.join
end

p stringy(-2)