def halvsies(arr)
  arr.size.odd? ? half_point = (arr.size / 2) + 1 : half_point = (arr.size / 2)
  first = arr[0, half_point]
  second = arr[half_point..arr.index(arr.last)]
  [first, second]
end

p  halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p  halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p  halvsies([5]) == [[5], []]
p  halvsies([]) == [[], []]