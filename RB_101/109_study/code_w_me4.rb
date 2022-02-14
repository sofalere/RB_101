# given 2 strings strings find out if there is a substring that appears in
# both strings.
# true if there is, false if not
# only sincider substrings longer than one letter

# input: 2 strings
# output: boolean, true if both strings have atleast one matching substring

# rules:
# - one substring must match
# - not case sensitive
# - a substring is deifned as 2 or more consecutive letters
#   - as long as 2 characters are contiguous in each string == true

# ALGORITHM
# check to see if any 2 adjacent characters from the first string
# appear in the same order in the second
# - index[0] + index[1] included?
# - index[1] + index[2]
# - index[2] + index[3]

# create substrings of stinrg 1
# - set a start variable to 0
# - set a finish variable to start + 1
# - loop
# - break when the end variable is 1 less than the string size
# withing the loop check to see if the string[start] + string[end] are included 
# in stirng2
 
# def substring_test(string1, string2)
#   string1 = string1.downcase
#   string2 = string2.downcase
#   start = 0
#   finish = start + 1
#   loop do
#     break false if finish >= (string1.size - 1)
#     break true if string2.include?(string1[start] + string1[finish])
#     start += 1
# #     finish += 1
# #   end
# # end

# def substring_test(string1, string2)
#   (0..string1.size - 2).any? do |start|
#     string2.downcase.include?(string1[start].downcase + string1[start + 1].downcase)
#   end
# end




# given 2 strings find out if there is a substring that appears in
# both strings.
# true if there is, false if not
# only consider substrings longer than one letter

# input: 2 strings
# output: boolean, true if both strings have atleast one matching substring

=begin
PROBLEM
return true or false if both strings have at least one matching substring

RULES
case insensitive
once a single matching substring has been found, stop iteration
  return true

find substrings in one str (smallest str?) and for each one check if
that substring is included in the other string

to avoid making every substring, check if the current substring is in
the other word every time

ALGORITHM
-.) place both in array, downcased
-.) decide which word is smaller
      - sort_by! size
-.) create substrings
      - string[0].size.times for `start`
      - 2 to string[0].size - start time for `length`
          -return true if string[1].include?substring
-.) false
=end

def substring_test(string1, string2)
  strings = [string1.downcase, string2.downcase].sort_by { |str| str.size }

  strings[0].size.times do |start|
    2.upto(strings[0].size - start) do |length|
      substring = strings[0][start, length]
      return true if strings[1].include?(substring)
    end
  end
  
  false
end

p substring_test("Something", 'Fun') == false
p substring_test("Something", "Home") == true
p substring_test("BANANA", "banana") == true
p substring_test("banana", "BANANA") == true
p substring_test("Something", '') == false
p substring_test('', "Something") == false
p substring_test('', '') == false
p substring_test('test', 'lllt') == false
p substring_test('1234567', '541265') == true
p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true