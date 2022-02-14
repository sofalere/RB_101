puts "What is the bill?"
bill = gets.chomp.to_f

puts "What is the tip percentage?"
tip_percentage = gets.chomp.to_f

tip =  bill * (tip_percentage / 100)
total = tip.to_f + bill

puts "The tip is $#{'%.2f' % tip}."
puts "The total is $#{'%.2f' % total}."