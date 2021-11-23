# => {"apple"=>"Fruit", "pear"=>"Fruit"}
=begin
# Problem:
#   write a method that selects and prints the key-value pairs whose value is 'Fruit'

create a loop that iterates over the hash, selecting only those key value pairs that have the value 'fruit'
  -check if a pair has the value 'fruit'
    . create empty hash
    . place all the keys into an array
    . set counter to 0
    . iterate over each element in array using it as index reference for the orginal hash
    . if the return of the element reference is 'fruit' add the key-value pair to the new hash
  -place that pair into a new hash
  -print the new hash


# input: Hash
# output: Hash populated with only those that have the value "fruit"


=end


# def select_fruit(produce_list)
#   produce_keys = produce_list.keys
#   counter = 0
#   selected_fruits = {}

#   loop do
#     # this has to be at the top in case produce_list is empty hash
#     break if counter == produce_keys.size

#     current_key = produce_keys[counter]
#     current_value = produce_list[current_key]

#     if current_value == 'Fruit'
#       selected_fruits[current_key] = current_value
#     end

#     counter += 1
#   end

#   selected_fruits
# end


def select_fruit(hash_name)
  
  fruit_pairs = {}
  counter = 0
  specific_food = hash_name.keys
  
  loop do    
    break if counter == specific_food.length

    current_food = specific_food[counter]
    current_value = hash_name[current_food]
    
    if current_value == 'Fruit'
      fruit_pairs[current_food] = current_value
    end
    
    counter += 1
  end
  
  fruit_pairs
end


produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p select_fruit(produce) 