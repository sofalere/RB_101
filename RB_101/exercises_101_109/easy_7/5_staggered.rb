require 'pry'

# def staggered_case(str)
#   letters = str.downcase.chars
#   counter = 0
#   loop do
#     break if counter >= letters.size
#     letters[counter]
#     letters[counter].upcase! if letters[counter] =~ /[A-Za-z]/
#     counter += 2
#     letters[counter]
#   end
#   letters.join
# end

def staggered_case(str, need_upper = true)
  stag = ''
  str.chars do |let|
    if need_upper
      stag << let.upcase
    else
      stag << let.downcase
    end
    need_upper = !need_upper
  end
  stag
end

p  staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p  staggered_case('ALL_CAPS') == 'AlL_CaPs'
p  staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

p staggered_case('hey there hello', false)