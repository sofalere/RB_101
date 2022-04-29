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
  def initialize(year, month)
    @month = month
    @year = year
    @date_obj = Date.new(year, month)
  end

  def day(day_str, descriptor_str)
    descriptor = convert(descriptor_str)
    dates = create_dates(day_str)

    descriptor == :t ? teenth(dates) : dates[descriptor]
  end

  private

  attr_reader :date_obj, :month, :year

  def create_dates(day_str)
    day_sym = (day_str.downcase + '?').to_sym
    all = []
    date_obj.step(date_obj << -1) do |date|
       all << date if date.send(day_sym) && date.month == month
    end
    all
  end

  def teenth(dates)
    dates.find { |date| (13..19).include?(date.day) }
  end

  def convert(descriptor_str)
    case descriptor_str.downcase
    when 'first'  then 0
    when 'second' then 1
    when 'third'  then 2
    when 'fourth' then 3
    when 'fifth'  then 4
    when 'last'   then -1
    when 'teenth' then :t
    else raise ArgumentError
    end
  end
end


p Meetup.new(2016, 5).day('Wednesday', 'last')