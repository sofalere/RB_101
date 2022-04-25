=begin
PROBLEM
Write a program to determine whether a triangle is equilateral, isosceles, 
or scalene.

RULES
- For a shape to be a triangle at all, all sides must be of length > 0, 
  and the sum of the lengths of any two sides must be greater than the length 
  of the third side.
  - equilateral triangle has all three sides the same length.
  - isosceles triangle has exactly two sides of the same length.
  - scalene triangle has all sides of different lengths.


=end

class Triangle
  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise ArgumentError if invalid_triangle
  end
  
  def kind
    if @sides.min == @sides.max
      'equilateral'
    elsif @sides.uniq == @sides
      'scalene'
    else
      'isosceles'
    end
  end
  
  private
  
  def invalid_triangle
    @sides.min <= 0 ||
    @sides[0] + @sides[1] <= @sides[2] ||
    @sides[0] + @sides[2] <= @sides[1] ||
    @sides[2] + @sides[1] <= @sides[0]
  end
end
