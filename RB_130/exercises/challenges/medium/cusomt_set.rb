=begin
PROBLEM
- create a custom set class

RULES
  CustomeSet object () can take optional array arg
  

empty?         - check is set is empty
contains?()    - return true if set includes arg
subset?(Setobj)- entirely made up elements    that are in the 'super' set
disjoint?(Setobj)  - dont share any elements, empty sets are considered disjoint
eql?      - returns true if ALL values of sets are equal, order doesnt matter
add(val)   - adds element of that value to the end of set, if value is already present does nothing
intersection(Setobj) - returns Set object with values that are shared between calling and arg Sets, even if thats an empty Set object
difference(Setobj) - 
  calling set doesnt have elements, arg does:
    return empty setobj
  calling set has elements,arg doesnt:
    return calling pbjc elements
  return new set object with elements that are in calling object but arent in arg
union(setobj) - creates a new setobj, with all elements, no repeats, from calling and arg


=end

class CustomSet
  attr_reader :set

  def initialize(set = [])
    @set = set.uniq
  end

  def union(other)
    new_set = set + other.set
    CustomSet.new(new_set)
  end

  def difference(other)
    diff = []
    set.each do |val| 
      diff << val unless other.contains?(val) 
    end
    CustomSet.new(diff)
  end

  def intersection(other)
    shared = []
    set.each do |val| 
      shared << val if other.contains?(val) 
    end
    CustomSet.new(shared)
  end

  def ==(other)
    eql?(other)
  end

  def add(val)
    set << val unless contains?(val)
    self
  end

  def eql?(other)
    set.sort == other.set.sort
  end

  def disjoint?(other)
    set.none? { |val| other.contains?(val) }
  end

  def subset?(other)
    set.all? { |val| other.contains?(val) }
  end

  def empty?
    set.empty?
  end

  def contains?(val)
    set.include?(val)
  end
end

