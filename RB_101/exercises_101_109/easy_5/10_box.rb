def print_in_box(str)
puts "+#{'-'* (str.length + 1)}-+"
puts "|#{' '* (str.length + 1)} |"
puts "| #{str} |"
puts "|#{' '* (str.length + 1)} |"
puts "+#{'-' * (str.length + 1)}-+"
end

print_in_box(" ")
print_in_box("hey there hello")