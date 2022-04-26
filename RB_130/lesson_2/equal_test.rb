require "minitest/autorun"

require_relative 'car'

class CarTest < Minitest::Test
  # def setup
  #   @car = Car.new
  # end
  
  def test_val_equality
    car1 = Car.new
    car2 = Car.new
    assert_equal(car1, car2)
  end
end