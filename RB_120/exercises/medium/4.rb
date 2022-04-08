=begin
define a class that executes a circular queue

rules
first in, first out logic
starts empty with a set length
if full overwrites the first in elements

approach
initialize an array that is the set size. starting at index 0, when something
is enqueued, place something at index and add 1 to index for next turn, if 
index is == size, set index to 0. 



0, 1, 2, 3 => 0
x, 1, 2, 3 => 0 
x, x, 2, 3 => 0
x, x, x, x => 0 0
y, x, x, x => 1 1
y, y, x, x => 2
y, y, y, x => 3
y, y, y, y => 0
z, y, y, y => 1

need a counter variable for the reader, one that waits until all are full
and one more move, to add 1 to the reader, add 1 to reader until wheel size,
then back to 0 and so on

=end



class CircularQueue
  attr_accessor :queue, :writer, :size, :marked, :oldest

  def initialize(size)
    @queue = Array.new(size)
    @size = size
    @writer = size - 1
    @oldest = 0
  end
  
  def reset_writer
    return self.writer = 0 if writer == size - 1
    self.writer += 1
  end
  
  def enqueue(num)
    p queue
    reset_writer
    queue[writer] = num
  end
  
  def dequeue
    change_oldest
    queue[oldest]
  end
  
  def to_s
    queue.to_s
  end
  
  def change_oldest
    self.oldest = self.writer if !queue.include?(nil)
  end
end

queue = CircularQueue.new(3)
puts queue
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue
p queue.dequeue
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil