def ascii_value(string)
  value = 0
  string.chars.each { |let| value += let.ord }
  value
end

  
p  ascii_value('Four score') == 984
p  ascii_value('Launch School') == 1251
p  ascii_value('a') == 97
p  ascii_value('') == 0


# sum returns '0' if array is empty unlike inject which returned `nil`

# def ascii_value(string)
#   string.chars.map { |let| let.ord }.sum
# end