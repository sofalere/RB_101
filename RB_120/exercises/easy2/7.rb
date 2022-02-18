class Shelter
  attr_accessor :owners
  
  @@available_pets = []
  
  def available_pets
    @@available_pets
  end
  
  def self.add_pet_to_shelter(pet)
    @@available_pets << pet
  end
  
  def initialize
    @owners = {}
  end
  
  def remove_pet(pet)
    available_pets.delete(pet)
  end
 
  def adopt(owner, pet)
    owner.adopt_a_pet(pet)
    remove_pet(pet)
    owners[owner.name] ||= owner
  end
  
  def print_adoptions
    owners.each do |name, details|
      puts "#{name} has adopted the following pets:"
      details.pets.each { |pet| puts pet }
      puts
    end
  end
  
  def print_unadopted_pets
    puts "The Animal Shelter has the following unadopted pets:"
    available_pets.each { |pet| puts pet }
    puts
    owners.each do |_, details| 
      puts "#{details.name} has adopted #{details.number_of_pets} pets"
    end
     "There are #{available_pets.size} unadopted pets."
  end
end

class Pet
  attr_reader :breed, :name
  
  def initialize(breed, name)
    @breed = breed
    @name = name
    Shelter.add_pet_to_shelter(self)
  end

  def to_s
    "a #{breed} named #{name}"
  end
end

class Owner
  attr_accessor :name, :pets
  
  def initialize(name)
    @name = name
    @pets = []
  end
  
  def number_of_pets
    self.pets.size
  end
  
  def adopt_a_pet(pet)
    @pets << pet
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
asta         = Pet.new('dog', 'Asta')
fluffy       = Pet.new('cat', 'Fluffy')
rodger       = Pet.new('dog', 'Roger')
kat          = Pet.new('dog', 'Kat')
asta         = Pet.new('dog', 'Woof')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

shelter.available_pets
puts shelter.print_unadopted_pets
# P Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin

# B Holmes has adopted the following pets:
# a dog named Molly
# a parakeet named Sweetie Pie
# a dog named Kennedy
# a fish named Chester

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.


# The Animal Shelter has the following unadopted pets:
# a dog named Asta
# a dog named Laddie
# a cat named Fluffy
# a cat named Kat
# a cat named Ben
# a parakeet named Chatterbox
# a parakeet named Bluebell
#   ...

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.
# The Animal shelter has 7 unadopted pets.