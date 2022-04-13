=begin
return the element for which the block returned the largest value

RULES

APPROACH
- set index to 0
- set 'largest' to the return val of first el in block
- start loop while index < array.size
- update index
- pass element at that index into block and set to 'largest' if 
  it is larger than current 'largest'
- save 'largest_index'
- return item at largst index


=end

def max_by(array)
  return nil if array.empty?
  
  largest_val = yield(array[0])
  result = array[0]
  
  array[1..-1].each do |el|
    block_val = yield(el)
    result, largest_val = el, block_val if block_val > largest_val
  end
  
  result
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
          # 3,7,5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
          #8,-4,6
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
          #'_',"[","]"
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil