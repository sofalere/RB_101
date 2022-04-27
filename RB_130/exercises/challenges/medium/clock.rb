=begin
PROB
Create a clock that is independent of date.

RULES
- should be able to add minutes to and subtract minutes 
    from the time represented by a given clock object
- Two clock objects that represent the same time should be 
    equal to each other

APPROACH
-
+
==
to_s

at() 1 or 2 args
- define at method to take 1 arg and then a default arg 00
- format(‘%02d:%02d’, hours, minutes) 
=end

class Clock
  def initialize(hours, mins)
    @hours = hours
    @mins = mins
  end
  
  def self.at(hours, mins = 00)
    Clock.new(hours, mins)
  end
  
  def +(more_mins)
    hours = self.hours
    mins = self.mins
    total_mins = mins + more_mins
    if total_mins >= 60 
      divisor, remainder = total_mins.divmod(60)
      hours += divisor
      mins = remainder
      while hours >= 24
        hours -= 24
      end
    else
      mins = total_mins
    end
    Clock.at(hours, mins)
  end
  
  def -(less_mins)
    hours = self.hours
    mins = self.mins
    total_mins = mins - less_mins
    if total_mins < 0
      divisor, remainder = (total_mins.abs. + 60).divmod(60)
      hours -= divisor
      mins = 60 - remainder
      while hours <= 0
        hours += 24
      end
    else
      mins = total_mins
    end
    Clock.at(hours, mins)
  end
  
  def ==(other)
    hours.equal?(other.hours) &&
    mins.equal?(other.mins)
  end
  
  def to_s
    '%02d:%02d' % [hours, mins]
  end
  
  protected
    
  attr_reader :hours, :mins
end

# clock1 = Clock.at(15, 37)
# clock2 = Clock.at(15, 36)
# p clock1
# p clock2 + 45
