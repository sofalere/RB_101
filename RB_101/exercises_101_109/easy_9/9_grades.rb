# algorithm
#   - set consant of letter grades
#   - determine average by adding the arguments and dividing 
#     by the amount of arguments
#   - determine if the average is within the range and print the key

LETTER_GRADES = { 90..100 => 'A',
                  80..89  => 'B',
                  70..79  => 'C',
                  60..69  => 'D',
                   0..59  => 'F'
}

def get_grade(scr1, scr2, scr3)
  average = (scr1 + scr2 + scr3) / 3
  LETTER_GRADES.select { |range, _| range === average}.values.first
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"