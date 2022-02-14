require 'pry'

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight(time)
  hours, minutes = time.split(':').map(&:to_i)
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

def before_midnight(time)
  delta_minutes = MINUTES_PER_DAY- after_midnight(time)
  delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
  delta_minutes
end

# MY FIRST VERSION:

# def time_to_mins(time)
#   mins = 0
#   time = time.chars
#   time.delete_at(2)
  
#   time.each_with_index do |num, ind|
#     case ind
#     when 0 then mins += num.to_i * 10 * 60
#     when 1 then mins += num.to_i * 60
#     when 2 then mins += num.to_i * 10
#     when 3 then mins += num.to_i
#     end
#   end
  
#   mins
# end

# def after_midnight(time)
#   mins = time_to_mins(time) 
#   mins = 0 if time_to_mins(time) == 1440
#   mins
# end

# def before_midnight(time)
#   mins = 1440 - time_to_mins(time)
#   mins = 0 if time_to_mins(time) == 0
#   mins
# end
  
p  after_midnight('00:00') == 0
p  before_midnight('00:00') == 0
p  after_midnight('12:34') == 754
p  before_midnight('12:34') == 686
p  after_midnight('24:00') == 0
p  before_midnight('24:00') == 0