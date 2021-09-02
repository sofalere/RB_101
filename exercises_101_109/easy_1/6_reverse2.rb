def reverse_five(string)
  if string.length > 5
    string.split.reverse.join
  end
end

p reverse_five("hey")
p reverse_five('hey there hola')