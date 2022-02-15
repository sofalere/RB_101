class Cat
  COLOR = 'purple'
  attr_reader :name#, :color
  
  def initialize(name)
    @name = name
    @color = COLOR
  end
  
  def greet
    "Hello! My name is #{name} and I'm a #{COLOR} cat!"
  end
  
end

kitty = Cat.new('Sophie')
p kitty.greet