#add a new key value pair to each nester hash based on the value of the "age" key


munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}



# counter = 0

# loop do
#   family_member = munsters.values[counter]
#   current_age = family_member['age'] 
  
#     if (0..17).include?(current_age)
#       family_member['age_group'] = 'kid'
#     elsif (18..64).include?(current_age)
#       family_member['age_group'] = 'adult'
#     else
#       family_member['age_group'] = 'senior'
#     end
    
#   counter += 1
#   break if counter == munsters.keys.size
# end

# p munsters



p family_member = munsters.values
p family_member['age']

# eh = munsters.map do |key, val|
#   age = val.v          
#   age.each do |num|
#     if (0..17).include?(num)
#     end 
#   "#{key}  #{val.values}"
# end
# end

