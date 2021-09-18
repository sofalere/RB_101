#method that takes average of all elements in an array by adding them together and then dividing by number of elements

def average(ar)
  (ar.sum.to_f) / (ar.count.to_f)
end


p average([9, 47, 23, 95, 16, 52])
