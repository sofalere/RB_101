class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{name.upcase}."
  end
end

name = 'fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

# When line 9 had the mutating upcase! method, the value pointed to by the local
# variable `name` is the same string object as the one that is assigned to the
# attribute of the fluffy object. Mutations perofrmed on that bject will be 
# visible by other vairbales that point to it.

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name


# Here, the local variable `name` is reassigned to itself incremented by 1, 
# reassignment has no affect on the value passed in to the Pet object. Even if
# we tried to perform a mutating action on the value held by the local variable
# `name` we couldnt because numbers are immutable.
