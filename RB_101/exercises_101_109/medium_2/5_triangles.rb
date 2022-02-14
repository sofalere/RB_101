# A triangle is classified as follows:


# Write a method that takes the lengths of the 3 sides of a triangle as arguments, 
# and returns a symbol :equilateral, :isosceles, :scalene, or :invalid 
# depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

# To be a valid triangle, the sum of the lengths of the two shortest sides 
# must be greater than the length of the longest side, 
# and all sides must have lengths greater than 0: 
# if either of these conditions is not satisfied, the triangle is invalid.

# input: 3 integers
# output: symbol representing what kind, if any, trinalge those lenghts would make

# valid triangle =
#   - sum of lenghts of 2 SHORTERS sides > the length of the longest side
#   - all sides must be > 0

# equilateral   All 3 sides are of equal length
# isosceles     2 sides are of equal length, while the 3rd is different
# scalene       All 3 sides are of different length

# - create and numerically sort an array of the argument FLOATS
# - comfirm that 2 smallest added is > largest
#   AND that there are no `0` values
#   - if either is not true return :invalid
#   - if both are true move on to next step
# - check to see if all elements are == :equilateral
#   - since array will be sorted you can check if the smallest and largest 
#     numebers are equal
# - check to see if the first two or the second two elements are equal
#   and the third is not :isosceles
# - check to see if no sides are equal :scalene

def triangle(side1, side2, side3)
  triangle_sides = [side1, side2, side3].sort
  return :invalid if (triangle_sides[0] + triangle_sides[1]) < triangle_sides[2] ||
                     triangle_sides.include?(0)
  return :equilateral if triangle_sides.min == triangle_sides.max
  return :scalene if triangle_sides.uniq == triangle_sides
  :isosceles
end

p  triangle(3, 3, 3) == :equilateral
p  triangle(3, 3, 1.5) == :isosceles
p  triangle(3, 4, 5) == :scalene
p  triangle(0, 3, 3) == :invalid
p  triangle(3, 1, 1) == :invalid

# A triangle is classified as follows:

# equilateral All 3 sides are of equal length
# isosceles 2 sides are of equal length, while the 3rd is different
# scalene All 3 sides are of different length
# valid triangle= the sum of the lengths of the two shortest sides must be 
    #             greater than the length of the longest side, 
    #             and all sides must have lengths greater than 0: 

# Write a method that takes the lengths of the 3 sides of a triangle as 
# arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid 
# depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

=begin
INPUT: 3 intgers or floats
OUTPUT symbol representing the type of triangle

RULES
triangle = 2 shortest sides added together > the longest side
           each legnth > 0
           
  # equilateral: All 3 sides are of equal length
  # isosceles: 2 sides are of equal length, while the 3rd is different
  # scalene: All 3 sides are of different length
  
  # invalid: a non-triangle
  
AGORITHM
place sides in array , sort
return :invalid if sorted, the first two (smallest)  added together < third

if  ar[0] == all? arr eq
if uniq == arr
iso 

=end

def triangle(side1, side2, side3)
  triangle_ar = [side1, side2, side3].sort
  return :invalid if (triangle_ar[0] + triangle_ar[1]) <= triangle_ar[2]
  return :equilateral if triangle_ar.all? { |side| side == side1 }
  return :scalene if triangle_ar.uniq == triangle_ar
  :isosceles
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
