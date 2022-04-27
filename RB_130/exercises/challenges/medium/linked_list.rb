=begin
PROB
create a  linked list program whose elements may contain a range of data such 
as the numbers 1-10. 
Provide functions to reverse the linked list and converta linked list to and 
from an array.

RULES
create an Element object that has the methods:
  init  - 2 args, the element value, and the  optional NEXT elements value

  next  - returns ELement object that is next (so first one in) or nil if empty
  tail? - returns true if element is last in list
  datum - returns value

LinkedList object - no args
  size
  empty?
  push( ) - adds new Element(arg) maybe
  peek    - returns value of (head) Element?, nil if empty
  head    - returns Element that is last
  pop     - remove last
  from_a  - adds elements from back of array 
  to_a    - returns value in array form, in right order
  reverse - reverses list
=end


class SimpleLinkedList
  attr_reader :list
  
  def initialize
    @list = []
  end
  
  def reverse
    reversed = list.map(&:datum)
    SimpleLinkedList.from_a(reversed)
  end
  
  def to_a
    list.reverse.map { |el| el.datum }
  end
  
  def self.from_a(ar)
    list_obj = SimpleLinkedList.new
    return list_obj if ar == nil || ar.empty? 
    ar.reverse.each { |datum| list_obj.push(datum) }
    list_obj
  end
  
  def pop
    val = head.datum
    list.pop
    val
  end
  
  def head
    list.last
  end
  
  def peek
    empty? ? nil : list.last.datum
  end
  
  def push(datum)
    if empty?
      list << Element.new(datum)
    else
      list << Element.new(datum, head)
    end
  end
  
  def size
    list.size
  end
  
  def empty?
    list.empty?
  end
end

class Element
  attr_reader :datum, :next
  
  def initialize(datum, next_up = nil)
    @datum = datum
    @next = next_up
  end
  
  def tail?
    self.next == nil
  end
end
