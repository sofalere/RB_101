flintstones = %w(Fred Barney Wilma Betty Beatrice BamBam Pebbles)


#using the method that first came to mind
flintstones.each_with_index do |name, index|
  if name.include? "Be" 
    puts index
    break
  end
end


#trying manual looping
counter = 0

loop do
  current_name = flintstones[counter]
  if current_name.start_with?("Be")
    puts counter
    break
  end
  
  counter += 1
  
end


#book answer, the Array#index method will return the FIRST element index
#for which the block evaluates to true
puts flintstones.index { |name| name[0,2] == "Be" }