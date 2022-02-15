class MyCar
  # Add a class method to your MyCar class that calculates the gas mileage of any car.
  
  def self.gas_mileage(gallons, miles)
    puts (miles / gallons)
  end

  attr_accessor :color 
  attr_reader :year, :model
  
  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
  end
  
  def spray_paint(new_color)
    self.color = new_color
  end
  
  def speed_up(speed)
    @current_speed += speed
  end
  
  def brake(speed)
    @current_speed -= speed
  end
  
  def shut_down
    @current_speed = 0
  end

  def to_s
    "your car is a #{model} from #{year} in #{color}"
  end
  
end


p carol = MyCar.new('2017', 'black', 'jetta')

p carol.speed_up(40)
p carol
p carol.shut_down
p carol
p carol.year
p carol
p carol.color
p carol.spray_paint('red')
puts carol
p MyCar.gas_mileage(12, 400)
puts carol