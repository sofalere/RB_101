=begin
problem:
create a method that takes a year and outputs the century that year is in

explicit
  -new centuries begin with 01 and go by 100 years
  -ends in the correct letters
  
implciit 
  -a centruy is the number divided by a hundred plus one, except the 1st
  
algorithm
  -

=end

def century(year)
  century = ( year / 100 ) + 1
  century -= 1 if year % 100 == 0
  
  century.to_s + century_suffix(century)
  
end 

def century_suffix(century)
  
  return 'th' if [11, 12, 13].include?(century % 100)
  last_digit = century % 10
  
  case last_digit
  when 0 then 'th'
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  end 
end

 century_suffix(111)


p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'