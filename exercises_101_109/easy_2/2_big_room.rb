puts "Enter the length of the room in meters:"
length_meters = gets.chomp

SQMETERS_TO_SQFEET = 10.7639
METERS_TO_CM = 100
FEET_TO_INCHES = 12


puts "Enter the width of the room in meters:"
width_meters = gets.chomp

square_meters = length_meters.to_i * width_meters.to_i
square_feet = (square_meters.to_i * SQMETERS_TO_SQFEET).round(2)

puts "The area of the room is #{square_meters} square meters and #{square_feet} square feet."



puts "Enter the length of the room in feet:"
length_feet = gets.chomp

puts "Enter the width of the room in feet:"
width_feet = gets.chomp

square_feet_from_feet = length_feet.to_i * width_feet.to_i
square_meters_from_feet = (square_feet_from_feet.to_i / SQMETERS_TO_SQFEET).round(2)
square_centimeters = square_meters_from_feet.to_i * METERS_TO_CM
square_inches = square_feet_from_feet.to_i * FEET_TO_INCHES

puts "The area of the room is #{square_meters_from_feet} square meters, #{square_feet_from_feet} square feet, 
#{square_centimeters} square centimeters, and #{square_inches} square inches."



