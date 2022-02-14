def valid?(str)
  (/[^aeiou]/ === str) && (/[A-Za-z]/ === str)
end

def double_consonants(str)
  str.chars.each_with_object('') do |char, doubled|
    valid?(char) ? doubled.concat(char * 2) : doubled.concat(char)
  end
end

p  double_consonants('String') == "SSttrrinngg"
p  double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p  double_consonants("July 4th") == "JJullyy 4tthh"
p  double_consonants('') == ""