def merge(ar1, ar2)
  (ar1 + ar2).uniq
end  

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
