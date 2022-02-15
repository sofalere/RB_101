class Person
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
end



p bob = Person.new('bob')
p bob.name                  # => 'bob'
p bob.name = 'Robert'
p bob.name                  # => 'Robert'
