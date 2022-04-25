=begin
PROBLEM given two arrays of characters, return the count of characters that are 
not the same, if the 2 arrays are different size, end at shortest one

RULES
- chars in each elelemnt must match - index sensitive
- one shorter than other, count shortest

APPROACH
- iterate over the shortest array w index, add 1 to counter any time that el
  doesnt match other arrays

=end

class DNA
  attr_reader :sequence
  
  def initialize(sequence)
    @sequence = sequence
  end

  def hamming_distance(other_sequence)
    mutations = 0
    
    sequences = [sequence.chars, other_sequence.chars].sort_by { |seq| seq.size} 
    
    sequences.first.each_with_index do |el, ind|
      mutations += 1 unless el == sequences.last[ind]
    end
    
    mutations
  end
end