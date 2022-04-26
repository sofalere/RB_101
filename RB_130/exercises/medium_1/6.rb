def convert_to_base_8(n)
  n.to_s(8).to_i 
end

base8_proc = method(:convert_to_base_8).to_proc



# p [8, 10, 12, 14, 16, 33].map(&base8_proc)

#same as:
# base8_proc = proc { |n| n.to_s(8).to_i }
# def go(ar, procy)
#   ar.each { |x|p procy.call(x) }
# end
# ar = [8, 10, 12, 14, 16, 33]
# go(ar, base8_proc)