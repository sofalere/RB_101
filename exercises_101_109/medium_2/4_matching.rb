# Write a method that takes a string as an argument, and returns true if 
# all parentheses in the string are properly balanced, false otherwise. 
# To be properly balanced, parentheses must occur in matching '(' and ')' pairs.
# Starting with '('.

# input: string
# output: boolean
# return true if the string is properly balanced
#   properly balanced:
#       -each parenthesis is part of a set, so if theres one opening '(', there 
#        must be one closing ')'
#       -must start with opening

# confirming that there is an equal number of opening to closing parenthesis
# AND confirming that the opening parenthesis is first in the string

# - use count on string to determine amount of each ()
# - find the index number of the first opening and first closing and make sure
#   opening is first

# def balanced?(string)
#   return false if string.count('(') != string.count(')')
#   return string.chars.index('(') < string.chars.index(')') if string.include?('(')
#   true
# end



require "pry"

# def balanced?(string)
#   pairs = { parens: ['(', ')', 0], square_brac: ['[', ']', 0], 
#             curly_brac: ['{', '}', 0] }
#   singles = { double_quotes: ['"', 0], single_quotes: ["'", 0] }
  
#   string.chars.each do |character|
#     pairs.keys.each do |type|
#       pairs[type][2] += 1 if pairs[type][0] == character
#       pairs[type][2] -= 1 if pairs[type][1] == character
#     end

#     return false if pairs.values.any? { |array| array[2] < 0 }

#     singles.keys.each do |type|
#       singles[type][1] += 1 if singles[type][0] == character
#     end
#   end
  
#   pairs.values.all? { |info| info[2] == 0 } &&
#   singles.values.all? { |info| info[1].even? }
# end

# def balanced?(string)
#   pairs = { parens: ['(', ')'], square_brac: ['[', ']'], 
#             curly_brac: ['{', '}'], double_quotes: ['"', ], single_quotes: "\'" }
#   balance_score = { pairs: 0, singles: 0}
  
#   string.chars.each do |character|
#       pairs.keys.each do |type|
#         if pairs[type][0] == character
#             balance_score[:pairs] += 1
#             break
#         balance_score[:pairs] -= 1 if pairs[type][1] == character
#       end
      
#       return false if balance_score[:pairs] < 0
  
#       # singles.keys.each do |type|
#       #   # p singles[type]
#       #   p character
#       #   balance_score[:singles] += 1 if singles[type] == character
#       # end
#   end
  
#   balance_score[:pairs] == 0 && balance_score[:singles].even?
# end


def balanced?(string)
  pairs = { parens: ['(', ')'], square_brac: ['[', ']'], 
            curly_brac: ['{', '}'], double_quotes: ['"', '"'], 
            single_quotes: ["'", "'"] }
  balance_score = 0

  string.chars.each do |character|
      pairs.keys.each do |type|
        if pairs[type][0] == character
            balance_score += 1
            next
        end
        balance_score -= 1 if pairs[type][1] == character
      end

      return false if balance_score < 0
  end

  balance_score == 0 || balance_score.even?
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('What ((is))) up(') == false
p balanced?("He said, “I like turles”.") == true
p balanced?("He said, “I like turles.") == false
p balanced?("He said, I like turles”.") == false
p balanced?("He said, ‘I like turles’.") == true
p balanced?("“He said, ‘I like turles’.”") == true
