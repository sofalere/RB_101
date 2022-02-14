# problem:
# method that returns the string with every character doubled
#   rules:
#     - each character, including non-alphanumeric chars and spaces is doubled
#     - returns empty string if empty string supplied

# algorithm:
#     - initialize empty string
#     - separate each character in string
#     - iterate through each one, doubling it
#     - set those doubled characters to empty string
    
def repeater(str)
  str.chars.each_with_object('') do |char, doubled|
    doubled.concat(char * 2)
  end
end

  
p  repeater('Hello') == "HHeelllloo"
p  repeater("Good job!") == "GGoooodd  jjoobb!!"
p  repeater('') == ''