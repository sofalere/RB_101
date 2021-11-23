munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}


# determined the combined age of only the male members of family
# set a combined age variable
# iterate through each family member and if they have a 'male' value put their age 
# value into the combined age variable


combined_age = 0
munsters.each_value do |details|
  combined_age += details['age'] if details['gender'] == 'male'
end
p combined_age



# combined_age = 0
# munsters.each do |family_member|
#   family_member.each do |info|
#     combined_age += info['age'].to_i if info['gender'] == 'male'
#   end
# end

# p combined_age




# males = munsters.map do |member|
#   member.select do |characterestic|
#     characterestic['gender'] == 'male'
#   end
# end

# age = 0

# males.each do |info|
#   info.map do |infoo|
#     age += infoo['age']
#   end
# end

# p age