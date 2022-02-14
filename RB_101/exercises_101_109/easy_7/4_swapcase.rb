require 'pry'
# def swapcase(str)
#   switched = str.chars.map do |let|
#     if ('A'..'Z').include?(let) 
#       let = let.downcase
#     elsif ('a'..'z').include?(let)
#       let = let.upcase
#     else
#       let
#     end
#   end
#   switched.join
# end

def swapcase(str)
  switched = str.chars.map do |let|
    if let =~ /[A-Z]/ 
      let.downcase
    elsif let =~ /[a-z]/
      let.upcase
    else
      let
    end
  end
  switched.join
end

p  swapcase('CamelCase') == 'cAMELcASE'
p  swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'