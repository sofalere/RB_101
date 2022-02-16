class Person
  attr_writer :age

  def older_than?(other)
    age > other.age
  end
  
  protected
  
  def age
    @age
  end
end

person1 = Person.new
person1.age = 27

person2 = Person.new
person2.age = 26

puts person1.older_than?(person2)