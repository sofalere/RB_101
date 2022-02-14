require 'pry'

# def word_cap(str)
#   str.split.map { |word| word.capitalize }.join(' ')
# end

# CAPS = { 'a': "A", 'b': 'B', 'f': 'F', 's': 'S', 't': 'T',
# 'j': 'J', 'l': 'L', 'i': 'I', 'w': 'W'}

# def word_cap(str)
#   caps = []
#   str.split.each do |word|
#     word.downcase!
#     letter = word[0].to_sym
#     word[0] = CAPS[letter] if word[0] =~ /[a-zA-Z]/
#     caps << word
#   end
#   caps.join(' ')
# end

def word_cap(str)
  caps = str.split.map do |word|
    word.downcase!
    word[0] = word[0].upcase! if word[0] =~ /[a-zA-Z]/
    word
  end
  caps.join(' ')
end


p  word_cap('four score and seven') == 'Four Score And Seven'
p  word_cap('the javaScript language') == 'The Javascript Language'
p  word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'