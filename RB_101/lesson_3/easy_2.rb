### 1.

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# p ages.keys.include?("Spot")
# ages.key?("Spot")
# ages.has_key?("Spot")

### 2.
# munsters_description = "The Munsters are creepy in a good way."
# p munsters_description.capitalize

### 3.
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
# additional_ages = { "Marilyn" => 22, "Spot" => 237 }
# p ages.merge(additional_ages)
# p ages

### 4.
# advice = "Few things in life are as important as house training your pet dinosaur."
# p advice.include?('dino')
# p advice.match?('dino')

### 5.
# flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
# p flintstoness = %W( Fred Barney Wilma Betty BamBam Pebbles)
# p flintstones == flintstoness

# ### 6.
# flintstones = %W( Fred Barney Wilma Betty BamBam Pebbles)
# p flintstones << 'Dino'
# p flintstones.push("DINOO")
# p flintstones.prepend("DINO")
# p flintstones.unshift("DINOOO")
# p flintstones + ["dino"]
# p flintstones.concat(['diNo'])

### 8.
# advice = "Few things in life are as important as house training your pet dinosaur."
# p advice.slice("Few things in life are as important as")
# p advice

### 9.
# statement = "The Flintstones Rock!"
# p statement.count('t')

### 10.
# title = "Flintstone Family Members"
# p title.center(40)