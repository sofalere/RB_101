def leading_substrings(string)
  strings = []
  0.upto(string.size - 1) do |num|
    strings << string[0..num]
  end
  strings
end

def substrings(string)
  results = []
  0.upto(string.size) do |num|
    results.concat(leading_substrings(string[num..-1]))
  end
  results
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

def leading_substrings(string)
  (0..string.size - 1).map { |range_end| string[0..range_end] }
end
  

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

def substrings(string)
  substrings = []
  string.size.times do |start_range|
    substrings.concat(leading_substrings(string[start_range..-1]))
  end
  substrings
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

