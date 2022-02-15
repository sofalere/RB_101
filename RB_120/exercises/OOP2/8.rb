class Person
  # def secret=(new_secret)
  #   @secret = new_secret
  # end
  
  # def secret
  #   @secret
  # end
  attr_accessor :secret
end


person1 = Person.new
p person1.secret
p person1.secret = 'Shh.. this is a secret!'
puts person1.secret