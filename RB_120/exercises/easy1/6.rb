class Flight

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

# Avoid giving access to any data that isn’t required, if that data us used 
# to build other apps and for some reason you need to change it, you wont be 
# able to. Creates useless interdependence.