# def one?(array)
#   total = 0
#   array.each do |el|
#     total += 1 if yield(el)
#     return false if total > 1
#   end
#   total < 1 ? false : true
# end

# def one?(array)
#   seen_one = false
#   array.each do |el|
#     return false if seen_one && yield(el)
#     seen_one = true if yield(el)
#   end
#   seen_one
# end

def one?(array)
  seen_one = false
  array.each do |el|
    next unless yield(el)
    return false if seen_one
    seen_one = true
  end
  seen_one
end


p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true }           # -> false
p one?([1, 3, 5, 7]) { |value| false }          # -> false
p one?([]) { |value| true }                     # -> false