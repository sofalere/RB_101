# # Write a method called age that calls a private method to calculate the age of 
# # the vehicle. Make sure the private method is not available from outside of 
# # the class. You'll need to use Ruby's built-in Time class to help.


# module Towable
#   def can_tow?
#     "Yes can tow"
#   end
# end


# class Vehicle
#   attr_accessor :color, :year, :model

#   @@total_vehicles = 0
  
#   def self.total_vehicles
#     puts @@total_vehicles
#   end
  
#   def self.gas_mileage(gallons, miles)
#     puts (miles / gallons)
#   end
  
#   def age
#     age_of_car
#   end
  
#   def initialize(year, color, model)
#     @year = year
#     @color = color
#     @model = model
#     @current_speed = 0
#     @@total_vehicles += 1
#   end
  
#   def spray_paint(new_color)
#     self.color = new_color
#   end
  
#   def speed_up(speed)
#     @current_speed += speed
#   end
  
#   def brake(speed)
#     @current_speed -= speed
#   end
  
#   def shut_down
#     @current_speed = 0
#   end
  
#   private
  
#   def age_of_car
#     Time.new.year - self.year.to_i
#   end
  
# end


# class MyCar < Vehicle
#   SIZE = 'medium'
  
#   def to_s
#     "your car is a #{model} from #{year} in #{color}"
#   end
# end

# class MyTruck < Vehicle
#   include Towable
#   SIZE = 'large'

#   def to_s
#     "your truck is a #{model} from #{year} in #{color}"
#   end
# end



# p carol = MyCar.new('2017', 'black', 'jetta')
# p truckcarol = MyTruck.new('2343', 'blue', 'GMC')
# puts carol
# p Vehicle.total_vehicles
# p truckcarol.can_tow?
# puts MyCar.ancestors
# puts MyTruck.ancestors
# puts carol.age



# # Create a class 'Student' with attributes name and grade. Do NOT make the 
# # grade getter public, so joe.grade will raise an error. 
# # Create a better_grade_than? method, that you can call like so...


# class Student
#   attr_accessor :name
  
#   def initialize(name, grade)
#     @name = name
#     @grade = grade
#   end
  
#   def better_grade_than?(other_student)
#     grade > other_student.grade
#   end
  
#   def say_hi
#     hi
#   end
  
#   protected
  
#   def grade
#     @grade
#   end
  
#   private
  
#   def hi
#     puts "hi #{name}"
#   end
# end

# joe = Student.new("Joe", 60)
# bob = Student.new("Bob", 89)
# p bob
# # p bob.grade
# p bob.better_grade_than?(joe)
# p bob.say_hi


# class NewClass
# end

# p potato = NewClass.new

# class MyDog
# 	attr_accessor :name

# 	def initialize(name)
# 		self.name = name       # self.name == individual_object.name
# 	end

# 	def self.name=(n)        # self.name=(n) == MyDog.name=(n)
	  
# 	end
# end

# p MyDog.name('dog')


class MyClass
end

pew = MyClass.new
pew2 = MyClass.new

p pew == pew2