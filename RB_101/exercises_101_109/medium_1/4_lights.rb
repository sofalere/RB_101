require 'pry'
# PROBLEM

# Write a method that takes one argument, the total number of switches, 
# and returns an Array that identifies which lights are on after n repetitions

# Rules:
#   - all lights on in first round
#   - the state of the light is changed if the number of the light is the rounds
#     number or its multiples
#   - odd numbered rounds odd numbers from array
#   - even numbered rounds delete numbers from array

# EXAMPLES 
# with n = 5 lights:

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

# round 1 ON: 12345
# round 2 ON: 135   OFF: 24
# round 3 ON: 15    OFF: 234
# round 4 ON: 145   OFF: 23
# round 5 ON: 14    OFF: 235

# ALGORITHM
#   - create an empty hash populated with true objects
#   - set a `round` counter
#   - write a program for finding which numbers need to be deleted or added
#   - check to see if the round key value is on or off add or delete accordingly

def lights(num)
  lights = (1..num).each_with_object({}) { |key, hash| hash[key] = true }
  round = 2
  display_lights(lights)
  
  while round <= num
    changes = (1..num).select do |int|
      int % round == 0
    end
    
    changes.each do |ch|
      lights.each do |key, value|
        if key == ch
          lights[ch] = !value
        end
      end
    end
    display_lights(lights, round)

  round +=1
  end
end

def join(nums)
  if nums.size < 2
    nums.join(" and ")
  else
    nums.insert(-2, 'and').join(', ')
  end
end

def display_lights(lights, round = 1)
  on_lights = join(lights.select {|num, state| state == true }.keys)
  off_lights = join(lights.select {|num, state| state == false }.keys)
  if lights.values.all? { |state| state == true }
    puts "round #{round}: all lights are on"
  elsif lights.values.all? { |state| state == false }
    puts "round #{round}: all lights are off"
  else 
    puts "round #{round}: #{on_lights} are on; #{off_lights} are off" 
  end
end


