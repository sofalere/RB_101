# Write a method that returns the number of Friday the 13ths in the year 
# given by an argument. You may assume that the year is greater than 1752 
# (when the United Kingdom adopted the modern Gregorian Calendar) and that 
# it will remain in use for the foreseeable future.

# input: integer representing a year
# output: integer representing the amount of friday the 13ths in that year

# iterate over each month of a given year and determine how many times
# the `13th` is on a friday 

require "date"

def friday_13th(year)
  (1..12).select { |month| Date.civil(year, month, 13).friday? }.count
end

p  friday_13th(2015) == 3
 p  friday_13th(1986) == 1
 p  friday_13th(2019) == 2
 

def friday_13th(year)
  (1..12).count { |month| Time.new(year, month, 13).friday? }
end