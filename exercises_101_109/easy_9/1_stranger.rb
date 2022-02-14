def greetings(name, info)
  name = name.join(' ')
  status = info[:title] + " " + info[:occupation]
  puts "Hello, #{name}! Nice to have a #{status} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.