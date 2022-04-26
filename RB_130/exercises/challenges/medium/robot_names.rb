class Robot
  @@names = []
  
  def initialize
    name
    @@names << name
  end
  
  def name
    return @name unless @name.nil?

    loop do 
      new_name = ''
      2.times { new_name << ('A'..'Z').to_a.sample }
      3.times { new_name << ('0'..'9').to_a.sample }
      break @name = new_name unless already_used(new_name)
    end
  end
  
  def reset
    @@names.delete(name)
    @name = nil
    name
  end
  
  private
  
  def already_used(name)
    @@names.include?(name)
  end
end

p Robot.new.name