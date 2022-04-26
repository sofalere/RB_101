class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
    description == otherTodo.description &&
    done == otherTodo.done
  end
end

class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(new_todo)
    raise TypeError, "Can only add Todo objects" if new_todo.class != Todo
    todos << new_todo
    self
  end
  
  alias_method :<<, :add

  def size
    todos.size
  end

  def first
    todos[0]
  end

  def last
    todos[-1]
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def to_a
    todos
  end

  def to_s
    text = "---- Today's Todos ----\n"
    text << todos.map(&:to_s).join("\n")
    text
  end
  
  def done?
    todos.all? { |todo| todo.done? }
  end

  def done!
    todos.each { |todo| todo.done! }
  end
  
  def item_at(ind)
    raise IndexError if ind > todos.size - 1
    todos[ind]
  end

  def mark_done_at(ind)
    item_at(ind).done!
  end

  def mark_undone_at(ind)
    item_at(ind).undone!
  end
  
  def remove_at(ind)
    todos.delete(item_at(ind))
  end
  
  def each
    todos.each { |todo| yield(todo) }
    self
  end
  
  def select
    new_list = TodoList.new(title)
    each { |todo| new_list << todo if yield(todo) }
    new_list
  end
  
  def each
    todos.each { |todo| yield(todo) }
    self
  end
  
  def select
    new_list = TodoList.new(title)
    each { |todo| new_list << todo if yield(todo) }
    new_list
  end

  def find_by_title(string)
    select { |todo| todo.title == string }.first
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(string)
    find_by_title(string) && match.done!
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end
end



todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")


list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
# list.add(1)                     # raises TypeError with message "Can only add Todo objects"

p list.size                       # returns 3

p list.first                      # returns todo1, which is the first item in the list

p list.last                       # returns todo3, which is the last item in the list

p list.to_a                      # returns an array of all items in the list

p list.done?                     # returns true if all todos in the list are done, otherwise false

#p list.item_at                   # raises ArgumentError

p list.item_at(1)                 # returns 2nd item in list (zero based index)
# p list.item_at(100)             # raises IndexError

# list.mark_done_at               # raises ArgumentError
p list.mark_done_at(1)            # marks the 2nd item as done
# list.mark_done_at(100)          # raises IndexError

# list.mark_undone_at             # raises ArgumentError
p list.mark_undone_at(1)          # marks the 2nd item as not done,
# list.mark_undone_at(100)        # raises IndexError

p list.done!                      # marks all items as done

# list.shift                      # removes and returns the first item in list

# list.pop                        # removes and returns the last item in list

# list.remove_at                  # raises ArgumentError

# list.remove_at(1)               # removes and returns the 2nd item
# list.remove_at(100)             # raises IndexError

list.to_s                      # returns string representation of the list

# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym
list.mark_undone_at(1)
puts list

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)
puts
list.each do |todo|
  puts todo                   # calls Todo#to_s
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

results = list.select { |todo| todo.done? }    
puts results.inspect