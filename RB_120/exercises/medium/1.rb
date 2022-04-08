class Machine
  def start
    flip_switch(:on)
  end

  private
  
  def to_s
    "#{switch}"
  end

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

car = Machine.new

car.start
puts car
p car.to_s