loop do
  puts 'This is the outer loop.'

  loop do
    puts 'This is the inner loop.'
    break
  end
  break
end

puts 'This is outside all loops.'

# the above code has a loop nested within a loop. The string passed as an arugment
# to puts on line 2 will be printed first. Then, the nested loop will be 
# enetered where the `puts` prints the second string. The inner loop is broken
# out of with the `break` keyword, then the 1st loop does the same thing, and 
# finally the string outside of all loops is printed.