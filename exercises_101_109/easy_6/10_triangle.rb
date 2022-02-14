# nested array, int number of indexes, and int number of arrays

def triangle(num)
  spaces = 1
  stars = num

  num.times do |n|
    puts ('*' * stars) + (' ' * spaces) 
    spaces += 1
    stars -= 1
  end
end

p triangle(5)