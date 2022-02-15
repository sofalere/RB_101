class Cat
  attr_reader :name
  
  def self.generic_greeting
    "Hello! I'm a cat!"
  end

  def initialize(name)
    @name = name
  end
  
  def personal_greeting
    "Hello! My name is #{name}!"
  end
  
end

kitty = Cat.new('Sophie')

p Cat.generic_greeting
p kitty.personal_greeting