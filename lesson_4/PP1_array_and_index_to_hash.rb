=begin
Turn this array into a hash where the names are the keys and the index numbers are the values.

algorithm
  -iterate over each element extracting the index number and placing that directly into a hash


=end

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]


flint_hash = {}
flintstones.each_with_index do |name, index|
  flint_hash[name] = index
end
p flint_hash


#OR

flint_hash = flintstones.each_with_object({}) do |name, hash|
  hash[name] = flintstones.index(name)
end
p flint_hash
