puts "Whats your friends name?"
name = gets.chomp.capitalize
name = "Teddy" if name.empty? 

puts "Today, #{name} is #{rand(20...200)} years old!"