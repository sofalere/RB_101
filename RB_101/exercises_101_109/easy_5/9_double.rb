require 'pry'

def crunch(str)
  crunched = []
  str.chars.each do |let|
    crunched << let if crunched.last != let
  end
  crunched.join
end

p  crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p  crunch('4444abcabccba') == '4abcabcba'
p  crunch('ggggggggggggggg') == 'g'
p  crunch('a') == 'a'
p  crunch('') == ''