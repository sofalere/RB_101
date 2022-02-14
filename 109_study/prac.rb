def triple_double(int1, int2)
  st1 = int1.to_s
  st2 = int2.to_s
  triple = false
  p st1.chars.select do |char|
    p triple =true if st1.scan(char * 3) == char *3
  end.to_a
end


p triple_double(451999277, 41177722899) == 1
# p triple_double(1222345, 12345) == 0
# p triple_double(12345, 12345) == 0
# p triple_double(666789, 12345667) == 1
# p triple_double(10560002, 100) == 1
# p triple_double(1112, 122) == 0