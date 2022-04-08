class Person
  attr_reader :first_name, :last_name
  
  def initialize(first_name, last_name)
    @first_name = first_name.capitalize!
    @last_name = last_name.capitalize
  end
  
  def first_name=(n)
    @first_name = n.capitalize
  end
  
  def last_name=(n)
    @last_name = n.capitalize
  end

  def to_s
    "#{first_name} #{last_name}"
  end
end

name = 'john'
person = Person.new(name, 'doe')
puts person

person.first_name = 'jane'
person.last_name = 'smith'
puts person
puts name

# John Doe
# Jane Smith