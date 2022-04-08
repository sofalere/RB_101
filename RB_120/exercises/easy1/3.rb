class Book
  attr_accessor :author, :title
  
  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)


# The author of "Snow Crash" is Neil Stephenson.
# book = "Snow Crash", by Neil Stephenson.

=begin
What does line 15 demonstrate?
The interpolated string is passed to the puts method and printed to the screen.
The `title` and `author` instance methods are called on the instance of the
`Book` class, called `book`. Both methods are getter methods as defined on line
2 by the attr_accessor. The getters return the value the instance variables
of the same name point to. Which, as defined in the initialize method, are the
two arguments passed in when the book object was instantiated.

What does line 16 demonstrate?
When using string interpolation, to_s is automaitaclly called on the object
being passed in. Here, we used method overriding to define a custom `to_s`
method on linees 9-11 for instances of the Books class. So the return value
of the newly defined to_s method is what is returned when to_s is called.
=end