class Cat
  
  @@kitty_count = 0
  
  def initialize
    @@kitty_count += 1
  end
  
  def self.total
    puts @@kitty_count
  end
end



kitty1 = Cat.new
kitty2 = Cat.new

p Cat.total