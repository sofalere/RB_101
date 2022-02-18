class Transform

  def initialize(n)
    @my_data = n
  end
  
  def uppercase
    @my_data.upcase
  end
  
  def self.lowercase(n)
    n.downcase
  end
  
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')