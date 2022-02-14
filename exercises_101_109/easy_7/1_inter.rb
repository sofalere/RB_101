# def interleave(arr1, arr2)
#   new = []
#   arr1.each_with_index do |el, ind|
#     new << el << arr2[ind]
#   end
#   new
# end

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end


p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
