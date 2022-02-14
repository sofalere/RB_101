# 4 elemet array
# 0 up to 1
# 3 down to 2
# [0] [3], [1] [2]

# 5
# 0 up to 2
# 4 down to 2
# [0] [4], [1] [3], [2] [2]

def reverse!(list)
  last = list.size - 1
  0.upto((list.size - 1) / 2 ) do |first|
    list[first], list[last] = list[last], list[first]
    last -= 1
  end
  list
end




list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == []




# a method that takes an array, changes the index location of each object
# without reassinging the array objecy lets try a, b = b, a
# mutating the values of an array individually doesnt affect the array object 
# itself. need to set 2 counters one from the beginning, one from back

require 'pry' 

def reverse!(list)
  index1 = 0
  index2 = -1
  
  loop do 
    break if index1 >= (list.size / 2)
    list[index1], list[index2] = list[index2], list[index1]
    index1 += 1
    index2 -= 1
  end
  list
end 
  
p  list = [1,2,3,4]
p  result = reverse!(list)
p  result == [4, 3, 2, 1] # true
p  list == [4, 3, 2, 1] # true
p  list.object_id == result.object_id # true
  
p  list = %w(a b e d c)
p  reverse!(list) == ["c", "d", "e", "b", "a"] # true
p  list == ["c", "d", "e", "b", "a"] # true
  
p  list = ['abc']
p  reverse!(list) == ["abc"] # true
p  list == ["abc"] # true
  
p  list = []
p  reverse!(list) == [] # true
p  list == [] # true