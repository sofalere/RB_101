require 'minitest/autorun'
# require "minitest/reporters"
# Minitest::Reporters.use!

require_relative 'todo'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end
  
  def test_size
    assert_equal(@list.size, @todos.size)
  end
  
  def test_first
    assert_equal(@todo1, @list.first)
  end
  
  def test_last
    assert_equal(@todo3, @list.last)
  end
  
  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end
  
  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end
  
  def test_done_false?
    assert_equal(false, @list.done?)
  end
  
  # def test_done_pass?
    
  # end
  
  # def test_only_add_todos
  #   assert_raises(TypeError) do
  #     @list.add(String)
  #   end
  #   assert_raises(TypeError) { @list.add(5) }
  # end
  
  def test_shovel_add
    todo4 = Todo.new("walk the dog")
    @list << todo4
    @todos << todo4
    assert_equal(@todos, @list.to_a)
  end
  
  def test_add
    todo4 = Todo.new("walk the dog")
    @list.add(todo4)
    @todos << todo4
    
    assert_equal(@todos, @list.to_a)
  end
  
  def test_item_at
    high_index = @list.size
    assert_raises(IndexError) { @list.item_at(high_index) }
    last_index = @list.size - 1
    assert_equal(@todos[last_index], @list.item_at(last_index))
  end
  
  def test_mark_done_at
    high_index = @list.size
    assert_raises(IndexError) { @list.item_at(high_index) }
    @list.mark_done_at(1)
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end
  
  def test_mark_undone_at
    high_index = @list.size
    assert_raises(IndexError) { @list.item_at(high_index) }
    @todo1.done!
    @todo2.done!
    @todo3.done!
    
    @list.mark_undone_at(1)

    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end
  
  def test_done!
    @todo1.undone!
    @todo2.undone!
    @todo3.undone!
    assert_equal(false, @list.done?)
    @list.done!
    assert_equal(true, @list.done?)
  end
  
  def test_remove_at
    high_index = @list.size
    assert_raises(IndexError) { @list.item_at(high_index) }
    @list.remove_at(0)
    assert_equal([@todo2, @todo3], @list.to_a)
  end
  
  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end
  
  def test_marked_to_s
    output = <<~HEREDOC.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    HEREDOC

    @list.mark_done_at(1)
    assert_equal(output, @list.to_s)
  end
  
  def test_each
    result = []
    @list.each { |item| result << item }
    assert_equal(result, @list.to_a)
  end
  
  def test_each_returns_object
    return_val = @list.each { |x| nil }
    assert_equal( @list, return_val)
  end
  
  def test_select
    @todo1.done!
    new_list = TodoList.new(@list.title)
    new_list.add(@todo1)
    
    assert_equal(new_list.title, @list.title)
    assert_equal(new_list.to_s, @list.select { |todo| todo.done?}.to_s )
  end
end