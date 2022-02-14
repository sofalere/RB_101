require 'pry'

# def include?(arr, int)
#   bool = arr.select { |num| num == int }
#   bool.empty? ? false : true
# end

def include?(arr, int)
  !!arr.find_index(int)
end


p  include?([1,2,3,4,5], 3) == true
p  include?([1,2,3,4,5], 6) == false
p  include?([], 3) == false
p  include?([nil], nil) == true
p  include?([], nil) == false