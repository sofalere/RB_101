# input: an array
#output: a hash where the word used is the key and the value is how many times it is used

#have to sort through the array to see how many times in an array the same string is displayed
#and then populate a hash with the string as a key and the amount of display times as a value

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', 'suv'
]

def count_occurrences(array)
  occurrences = {}
  
  ar = array.map do |veh|
          veh.downcase
       end
  
  ar.uniq.each do |veh|
    occurrences[veh] = ar.count(veh)
  end
  
  occurrences.each do |veh, count|                    #whats happening here? how did this change the vehicles from a string to a symbol?
    puts "#{veh}: #{count}"
  end
  
end


count_occurrences(vehicles)