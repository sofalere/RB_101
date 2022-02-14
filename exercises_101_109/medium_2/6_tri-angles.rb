# A triangle is classified as follows:

# right: One angle of the triangle is a right angle (90 degrees)
# acute: All 3 angles of the triangle are less than 90 degrees
# obtuse: One angle is greater than 90 degrees

# To be a valid triangle
#   - the sum of the angles must be exactly 180 degrees, 
#   - all angles must be greater than 0

# Write a method that takes the 3 angles of a triangle as arguments, 
# and returns a symbol :right, :acute, :obtuse, or :invalid depending on 
# whether the triangle is a right, acute, obtuse, or invalid triangle.

# You may assume integer valued angles so you don't have to worry about 
# floating point errors. You may also assume that the arguments are specified in 
# degrees.

# input: 3 arguments of triangle angles
# output: a symbol

# if not return :invalid
#   - the sum of the angles must be exactly 180 degrees, 
#   - all angles must be greater than 0
# if 1 angle == 90 :right
# if all angles < 90 :acute
# if one angle > 90: obtuse

def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]
  return :invalid if angles.inject(&:+) != 180 || angles.include?(0)
  return :right if angles.include?(90)
  return :acute if angles.all? { |angle| angle < 90 }
  :obtuse
end


p  triangle(60, 70, 50) == :acute
p  triangle(30, 90, 60) == :right
p  triangle(120, 50, 10) == :obtuse
p  triangle(0, 90, 90) == :invalid
p  triangle(50, 50, 50) == :invalid


# PROBLEM
# return symbol that describes that triangle that the degrees given produces

# INPUT 2 degree integers
# OUTPUT symbol

# RULES
# right One angle of the triangle is a right angle (90 degrees)
# acute All 3 angles of the triangle are less than 90 degrees
# obtuse One angle is greater than 90 degrees.

# To be a valid triangle, the sum of the angles must be exactly 180 degrees, 
# and all angles must be greater than 0

# ALGORITHM
# -.) place in array
# -.) validate triangle sum must be 180, no 0s
#     if not return :invalid
# -.) iterate over array all? < 90 :acute
# -.) inlcudes? 90 :right
# -.) :obtuse

=end


def triangle(ang1, ang2, ang3)
  degrees = [ang1, ang2, ang3]
  return :invalid if degrees.sum != 180 || degrees.any? { |angle| angle == 0 }
  return :acute if degrees.all? { |angle| angle < 90 }
  return :right if degrees.include?(90)
  :obtuse
end
