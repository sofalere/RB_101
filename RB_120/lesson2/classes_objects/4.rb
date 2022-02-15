#determine if the two objects have the same name

class Person
  
  attr_accessor :first_name, :last_name
  
  def initialize(full_name)
    parse_name(full_name)
  end
  
  def name
    "#{first_name} #{last_name}".strip
  end
  
  def name=(n)
    parse_name(n)
  end
  
  def to_s
    name
  end
  
  private
  
  def parse_name(name)
    parts = name.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end
  
end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

p bob == rob

p rob.name == bob.name