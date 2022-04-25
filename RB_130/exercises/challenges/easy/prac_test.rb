require "minitest/autorun"

require_relative 'prac'

class TestPrac < Minitest::Test
  def test_say
    tom = Talk.new
    users = StringIO.new("hi\n")
    output = StringIO.new
    x = tom.say(input: users, output: output)
    assert_equal("hi", x)
  end
end

