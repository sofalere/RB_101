ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }


youths = ages.select { |key, value| value < 100 }

p youths

# book modifies existing array using either .select!
# or .keep_if

ages.keep_if { |_,val| val < 100 }

p ages