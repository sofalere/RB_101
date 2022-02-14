num = (1..99)
num.each { |num| puts num if num.odd? }

1.upto(99) { |num| puts num if num % 2 != 0 }

puts odds = (1..99).to_a.select { |num| num.odd? }
