puts "What is your age?"
current_age = gets.chomp.to_i

puts "At what age would you like to retire?"
retire_age = gets.chomp.to_i

current_year = Time.now.year

years_until_retirement = retire_age - current_age

year_of_retirement = current_year + years_until_retirement.to_i

puts "It's #{current_year}. You will retire in #{year_of_retirement}."
puts "You have only #{years_until_retirement} years of work to go!"