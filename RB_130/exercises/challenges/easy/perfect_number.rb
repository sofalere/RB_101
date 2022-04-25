=begin
PROB
Write a program that can tell whether a number is perfect, abundant, 
or deficient.

RULES
- based on a comparison between the number and the sum of its positive divisors 
  (the numbers that can be evenly divided into the target number with no 
    remainder, excluding the number itself). 
    positive divisors of 15 == 1, 3, and 5

- Perfect numbers have an Aliquot sum that is equal to the original number.
- Abundant numbers have an Aliquot sum that is greater than the original number.
- Deficient numbers have an Aliquot sum that is less than the original number.


APPROACH
  define aliquot_sum()
    - find its positive divisors and add them
      - create results arr []
      - range from 1 to the number, if num % iterator == 0, add to results
      - add items in results
    
  define classify() 
    - to take num and return classifying string based off aluqot sum, 
    - if == to num 'perfect'
      if > num 'abundant'
      if < num 'deficient'
      
  raise StandardError if init arg is < 1
=end

class PerfectNumber

  def self.classify(num)
    raise StandardError if num < 1
    aliquot = aliquot_sum(num)

    if aliquot == num 
      'perfect'
    elsif aliquot > num 
      'abundant'
    else 
      'deficient'
    end
  end
  
  class << self
  
    private

    def self.aliquot_sum(num)
      (1..num - 1).select { |divisor| num % divisor == 0 }.inject(:+)
    end
  end
end
