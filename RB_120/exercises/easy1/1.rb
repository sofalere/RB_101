# Modify this class so new will optionally let you specify a fixed banner
# width at the time the Banner object is created. The message in the banner 
# should be centered within the banner of that width. Decide for yourself
# how you want to handle widths that are either too narrow or too wide.

class Banner
  attr_reader :message, :width
  
  def initialize(message, width = message.size)
    @message = message
    @width = width
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule]
    .join("\n")
  end
  
  private

  def horizontal_rule
    "+-#{'-' * width}-+"
  end

  def empty_line
    "| #{' ' * width} |"
  end

  def message_line
    "| #{message.center(width, ' ')} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner.width
puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

banner = Banner.new('')
puts banner.width
p banner.to_s
puts banner

=begin
explain the reason for the private method?

Instances of the Banner class are further encapsulated by calling the `private` modifier
before the instance methods: horizontal_rule, empty_line and message_line. This 
ensures that those methods can only be called from other instance methods of
the object, protecting them from outside changes.

What is to_s here?

The `to_s` instance method is an example of overriding. The string produced by 
executing the code in it is what will be returned if to_s is called on an 
instance of the Banner class. This comes in handy with puts, where the object
is passed as an argument to puts and to_s is called on it internally. 

What is width in `horizontal rule`?

Upon instantiation of a new Banner object two instance variables are assigned
values passed in as arguments. These attributes are both made accessible from
both outside and inside the method by the public accessor method `attr_reader`
which, when invoked, returns the value from the instance variable it shares
a name with (the name sharing is a style convention and is not necessarry). `width`
in the horizontal rule method is really a method call to the getter method
named `width`, which returns the value of the `@width` instance variable.

=end