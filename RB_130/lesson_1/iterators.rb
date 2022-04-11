# each

def each(array)
  index = 0
  while index < array.size
    yield(array[index])
    index += 1
  end
  array
end

ar = [1,2,3,4]
p each(ar) { |num| puts num * 2 }

# select

def select(array)
  index = 0
  results = []
  while index < array.size
    results << array[index] if yield(array[index])
    index += 1
  end
  results
end

ar = [1,2,3,4]
p select(ar) { |num| num.odd? }


# inject/ reduce

def reduce(array, start = nil)
  if start.nil?
    acc, index = array[0], 1
  else
    acc, index = start, 0
  end
  while index < array.size
    acc = yield(acc, array[index])
    index += 1
  end
  acc
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num } 
p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 
