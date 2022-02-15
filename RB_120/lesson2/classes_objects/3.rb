# Now create a smart name= method that can take just a first name or a 
# full name, and knows how to set the first_name and last_name appropriately.

class Person
  
  attr_accessor :first_name, :last_name
  
  def initialize(name)
    name_parse(name)
  end
  
  def name
    "#{@first_name} #{@last_name}".strip
  end
  
  def name=(n)
    name_parse(n)
  end
  
  private
  
  def name_parse(name)
    parts = name.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts[-1] : ''
  end
  
end


p bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
p bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

p bob.name = "John Adams"
p bob.first_name            # => 'John'
p bob.last_name             # => 'Adams'