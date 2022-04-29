=begin
PROBLEM
define a class that takes two args, year and month. and has a method
that returns the appropriate date for the descriptor - day

RULES
descriptors: 'first', 'second', 'third', 'fourth', 'fifth', 
              'last', and 'teenth' CASE INSENSITIVE
              
days: 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 
'Saturday', and 'Sunday'. CASE INSENSITIVE
require 'date'
=end
require 'date'

class Meetup
  attr_reader :date, :month, :year
  
  def initialize(year, month)
    @month = month
    @year = year
    @date = Date.new(year, month)
  end
  
  def day(day_str, descriptor_str)
    descriptor = convert(descriptor_str)
    @day_sym = (day_str.downcase + '?').to_sym
    dates = create_dates
    descriptor == 't' ? teenth(dates) : dates[descriptor]
  end
  
  def create_dates
    date.step(create_date).select(&@day_sym).select do |dates| 
      dates.month == month 
    end
  end
  
  def teenth(dates)
    dates.find { |date| (13..19).include?(date.day) }
  end
  
  def create_date
    next_month, next_year = (month + 1), year
    next_month, next_year = 1, year + 1 if next_month > 12
    Date.new(next_year, next_month)
  end
  
  def convert(descriptor_str)
    case descriptor_str.downcase
    when 'first' then 0
    when 'second' then 1
    when 'third' then 2
    when 'fourth' then 3
    when 'fifth' then 4
    when 'last' then -1
    when 'teenth' then 't'
    else raise ArgumentError
    end
  end
end
