=begin
return all the hashes with any specific value

algorithm:
  -define a method that takes two parameters (the hash, the desired value)
  -set a counter to 0
  -take all the values of the hash and save them in a new array
  -take all the keys of the hash and save them in a new array
  -iterate over one of the array values
  -check to see if it is equal to the desired value
  -if it is save the key value pair to the new hash
  -repeat for all values in array
  -return the new hash


=end


# def general_select(produce_list, selection_criteria)
#   counter = 0
#   produce_keys = produce_list.keys
#   produce_values = produce_list.values
#   selected_produce = {}
  
#   loop do 
#     break if counter == produce_keys.size
    
#     if produce_values[counter] == selection_criteria
#       selected_produce[produce_keys[counter]] = produce_values[counter]
#     end
    
#     counter += 1
#   end
  
#   selected_produce
# end



def general_select(produce_list, selection_criteria)
  produce_keys = produce_list.keys
  counter = 0
  selected_produce = {}

  loop do
    break if counter == produce_keys.size

    current_key = produce_keys[counter]
    current_value = produce_list[current_key]

    if current_value == selection_criteria
      selected_produce[current_key] = current_value
    end

    counter += 1
  end

  selected_produce
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}


p general_select(produce, "Vegetabasd")