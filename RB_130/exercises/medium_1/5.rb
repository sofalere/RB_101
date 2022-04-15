items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# gather(items) do |*items, wheat|
#   puts items.join(', ')
#   puts wheat
# end
# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

gather(items) do |fruit, *produce, wheat|
  puts fruit
  puts produce.join(', ')
  puts wheat
end

# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

gather(items) do |fruit, *produce|
  puts fruit
  puts produce.join(', ')
end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

gather(items) do |apples, corn, cabbage, wheat|
  puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
end
# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!