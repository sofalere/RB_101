def divisors(number)
  1.upto(number).select do |candidate|
    number % candidate == 0
  end
end