class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Car < Vehicle
end

class Truck < Vehicle
end

truck1 = Truck.new(1994)
puts truck1.year

car1 = Car.new(2006)
puts car1.year

# the subclasses Car and Truck are inheriting the behaviors from superclass
# Vehicle. So when car1 and truck1 are instantiated on lines 15 and 18, the objects
# search their own classes for an initialzie method, then check its superclass
# where it is found and the instnace variables @year are arrigned their repsective
# argument values. The getter methods are also defined used attr_reader