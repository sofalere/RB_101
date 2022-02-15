class Person
  attr_accessor :last_name, :first_name
  
  def initialize(name)
    parts = name.split
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts[-1] : ''
  end
  
  def name
    first_name + ' ' + last_name
  end
  
end


p bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
p bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'