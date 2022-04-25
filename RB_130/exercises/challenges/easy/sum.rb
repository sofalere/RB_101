=begin
Write a program that, given a natural number and a set of 
one or more other numbers, can find the sum of all the 
multiples of the numbers in the set that are less than the 
first number. If the set of numbers is not given, use a default set 
of 3 and 5.


RULES
  - take any number of args upon INIT
  - only add number once

APPROACH
  - INIT results
  - for each num from 2 to the NUM - 1 |multiple|
      check if multiple % ANY of the set numbers == 0
      if TRUE
        add to results
  - return results 

=end

class SumOfMultiples
  attr_reader :set
  
  def initialize(*set)
    @set = set.empty? ? [3, 5] : set
  end
  
  def self.to(high)
    SumOfMultiples.new.to(high)
  end
  
  def to(high)
    results = 0
    2.upto(high - 1) do |multiple|
      results += multiple if set.any? { |num| multiple % num == 0 }
    end
    results
  end
end

