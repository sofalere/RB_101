def step(start, finish, increment)
  value = start
  while value <= finish
    yield(value)
    value += increment
  end
  value
end

step(1, 10, 3) { |value| puts "value = #{value}" }


# value = 1
# value = 4
# value = 7
# value = 10