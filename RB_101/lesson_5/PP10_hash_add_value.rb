arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr.map do |set|
  incremenetd_hsh = {}
  
  set.each do |key, value|
    incremenetd_hsh[key] = value + 1
  end
  
  p incremenetd_hsh
end

p arr
