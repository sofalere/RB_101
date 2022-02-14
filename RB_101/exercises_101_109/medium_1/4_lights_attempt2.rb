# You have a bank of switches before you, numbered from 1 to n. 
# Each switch is connected to exactly one light that is initially off. 
# You walk down the row of switches and toggle every one of them. 
# You go back to the beginning, and on this second pass, 
# you toggle switches 2, 4, 6, and so on. On the third pass, 
# you go back again to the beginning and toggle switches 3, 6, 9, and so on. 
# You repeat this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches, 
# and returns an Array that identifies which lights are on after n repetitions.

# Example with n = 5 lights:

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

# input: integer specifying number of switches you have
# output: array of `on` lights
# rules:
# - 1 to n switches
# - 1st round all are 'on' 
# - when a switch is 'toggled' its state is reversed
# - the round number is directly proportional to the numbers of switches to be 
#   toggled
#   - round 1 = every 1
#   - round 2 = every 2nd (2,4 6,...)
#   - round 3 = every 3rd (3,6,9..)
#   - round 4 = every 4th (4,8,12..)
#   sequence where the starting number is addded to itself 

# round 1:            1 2 3 4 5 on
# round 2: 2 4   off; 1 3 5  on
# round 3: 2 3 4 off; 1 5    on
# round 4: 2 3   off; 1 4 5  on
# round 5: 2 3 5 off; 1 4    on

# ALGORITHM
# - create a hash keys 1-n, values all true
# - iterate through numbers 2-n `range..each`
#   - create a `round` varible that equals the number of the iteration
#   - loop over that number add 2 each time
#   - reverse hash values of the key that equals the `round` variable
#     - conditional where if value is true => false, vice versa
#   - break when `round` is > than `n`
# - iterate over hash 
require "pry"


def lights(lights_amount)
  results = (1..lights_amount).each_with_object({}) do |number, hash|
    hash[number] = true
  end
  (2..lights_amount).each do |round|
    factor = round
    until factor > lights_amount
      results[factor] = (results[factor] ? false : true)
      factor += round
    end
  end
  results.select { |_, state| state }.keys
end

def display_lights(lights_amount)
  lights_on = lights(lights_amount)
  on, off = (1..lights_amount).partition { |num| lights_on.include?(num) }
  puts "Lights #{joinor(on)} are on and lights #{joinor(off)} are off."
end

def joinor(lights)
  if lights.size <= 1
    lights[0].to_s
  elsif lights.size == 2
    lights.join("and ")
  else
    lights.join(", ").insert(-2, ' and ')
  end
end

p display_lights(5) == [1, 4]
p display_lights(10) == [1, 4, 9]

