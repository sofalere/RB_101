class Person
  attr_reader :first, :last
  
  def name=(n)
    @first, @last = n.split
  end
  
  def name
    "#{first} #{last}"
  end
  
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name