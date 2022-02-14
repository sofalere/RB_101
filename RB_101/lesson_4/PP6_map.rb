#amend array so that all the names are shortened to just the first three chars

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)


# flintstones.map! do |name| 
#   name[0,3]
# end

# p flintstones

p flintstones.keep_if { |x| x.start_with?("W")}
p flintstones