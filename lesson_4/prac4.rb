def counter(string)
  puts "There are #{string.gsub(' ', '').size} in #{string}"
end

p counter("hey the're")