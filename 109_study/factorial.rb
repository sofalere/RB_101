=begin
PROBLEM
write a method that returns the factorial of the given argument, assume the
argument is a positive number

RULES
n! = n * (n-1) * (n-2)...
each time the number is multiplied it is multiplied by one less number
the last multiplication is by 1

ALGORITHM
set a subtractor variable to 1
start a loop
set n to equal n * (n - subtractor)
add 1 to the subtractor variable until it is 1 less than n
break

=end

# def factorial(num)
#   subtractor = 1
#   factor = num
#   loop do
#     factor = factor * (num - subtractor)
#     subtractor += 1
#     break if subtractor + 1 == num
#   end
#   p factor
# end


def factorial(num)
  factors = num
  1.upto(num - 1) do |subtractor|
    p subtractor
  factors = factors * (num - subtractor)
  end
  p factors
  
end

p factorial(5)


# p sum_consecutives([1,4,4,4,0,4,3,3,1,1]) == [1,12,0,4,6,2]
# p sum_consecutives([1,1,7,7,3]) == [2,14,3]
# p sum_consecutives([-5,-5,7,7,12,0]) ==  [-10,14,12,0]


# def find_all_subarrays(array)
#   (0...array.length).each_with_object([]) do |ind1,obj|
#     (ind1...array.length).each do |ind2|
#       obj << array[ind1..ind2]
#     end
#   end
# end



# def find_all_substrings(array)
#   y=[]
#   (1...array.length).each do |num|
#     y << array.combination(num).to_a
#   end
#   y
# end


# def find_all_substrings(array)
#   array.permutation(array.length).to_a
# end


# # triple_double(num1, num2)
# # which takes numbers num1 and num2 and returns 1 if there is a straight triple of a number at any place in num1 and also a straight double of the same number in num2.

# # If this isn't the case, return 0

# # Examples

# # triple_double(451999277, 41177722899) == 1
# # # num1 has straight triple 999s and  num2 has straight double 99s

# # triple_double(1222345, 12345) == 0
# # # num1 has straight triple 2s but num2 has only a single 2

# # # triple_double(12345, 12345) == 0

# # # triple_double(666789, 12345667) == 1


# # input- number1 and a number 2 integers
# # output- 1 or a 0 (1 if there is a cons triple in num1 and that number double in the second)

# # algorithm- 

# # 1) find all triples in num1
# # 2) find all doubles in num2
# # 3) see if those match at any point

# # 1) triples / double
# #     convert the number to digits and slice it on number and select for sub == 3
# #     " " doubles   [[9,9,9],[8,8,8]].  [[9,9],[7,7]]
# # 2) map through the triples and pull out the first [9,8]
# # 3) do the same with the second [9,7]
# # 4) iterate through the first and see if second includes first and if it does return 1




# def triple_double(num1, num2)
#   num_1= num1.digits.slice_when{|x,y| x != y}.to_a.select{|sub| sub.length == 3}
#   num_2 = num2.digits.slice_when{|x,y| x != y}.to_a.select{|sub| sub.length ==2}
#   selected = num_1.map{|sub| sub[0]}
#   selected2= num_2.map{|sub| sub[0]}
#   selected.each do |num|
#     return 1 if selected2.include?num
#   end
#   0
# end
# p triple_double(451999277, 41177722899) == 1
# # # num1 has straight triple 999s and  num2 has straight double 99s

# p triple_double(1222345, 12345) == 0
# # # num1 has straight triple 2s but num2 has only a single 2

# p triple_double(12345, 12345) == 0

# p triple_double(666789, 12345667) == 1

# # Mothers arranged a dance party for the children in school. At that party, 
# there are only mothers and their children. All are having great fun on the 
# dance floor when suddenly all the lights went out. It's a dark night and no 
# one can see each other. But you were flying nearby and you can see in the 
# dark and have ability to teleport people anywhere you want.

# # Legend:

# # -Uppercase letters stands for mothers, lowercase stand for their children, 
# i.e. "A" mother's children are "aaaa".
# # -Function input: String contains only letters, uppercase letters are unique.
# # Task:
# # Place all people in alphabetical order where Mothers are followed by 
# their children, i.e. "aAbaBb" => "AaaBbb".
    
# =begin
# PROBLEM
# reorder the given string to start with the capital letter followed by the 
# same lowercase letter, followed by the 
# capital in alphabetical order


# ALGORITHM
# split the original string into characters, downcase it
# sort it [ a, a, b, b ]

# slice the sorted array into subarrays of mathcing letters
# capitalize first element in each subarray
# join the result


# =end

# def find_children(string)
#   array = string.downcase.chars.sort
#   subarrays = array.slice_when { |x, y| x != y }.to_a
#   subarrays.each { |sub| sub[0].upcase! }.join
# end

=begin
# ALGORITHM
-. downcase all letters, split into array and sort
-. 



=end

# p find_children("abBA")
# p find_children("AaaaaZazzz") == "AaaaaaZzzz"
# p find_children("CbcBcbaA") == "AaBbbCcc"
# p find_children("xXfuUuuF") == "FfUuuuXx"
# p find_children("") == ""
