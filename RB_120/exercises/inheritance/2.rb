class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  
  def initialize(year)
    super
    start_engine
  end
  
  def start_engine
    puts 'Ready to go!'
  end
end

truck1 = Truck.new(1994)
puts truck1.year


# when truck1 is instantiated the `initialzie` method of `Truck` is ran, passed
# the `1994` argument as parameter `year`. The `super` keyword has ruby go up
# the method chain to the superclass`Vehicle` to look for the method of the
# same name as where it was called from, it finds `initilize`, runs it, implicitly
# passsing in the argument given to Trucks init, and then returns to the first
# init method that puts out the string