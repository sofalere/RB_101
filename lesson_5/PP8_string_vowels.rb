hsh = {
  first: ['the', 'quick'], 
  second: ['brown', 'fox'], 
  third: ['jumped'], 
  fourth: ['over', 'the', 'lazy', 'dog']
}

hsh.each do |item, value|
  value.join.each_char do |letter| 
    p letter if letter.match?(/[aeiou]/)
  end
end