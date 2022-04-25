=begin
PROB
given numbers a and b, return all the possible substrings from num a
of length b

RULES
- given a string, return an array of integers
- not subsequent
- if arg > length of string ArgumentError raised

APPROACH
slices instance method
  - length = arg given
  - confirm correct arg
  - set empty results ar []
  -iterate over 0 up to size of str - 1 for |starting_point|
    - add substrings of starting_point ..length
  - return results arr

=end

class Series
  attr_reader :numstr
  
  def initialize(numstr)
    @numstr = numstr
  end
  
  def slices(length)
    raise ArgumentError if length > numstr.size
    
    num_ar = numstr.chars.map(&:to_i)
    results = []
    0.upto(numstr.size - length) do |strt_point|
      results << num_ar[strt_point, length]
    end
    results
  end
  
  ## book method:
  
  # def slices(length)
  #   raise ArgumentError if length > numstr.size
  #   numstr.chars.map(&:to_i).each_cons(length).to_a
  # end
end

