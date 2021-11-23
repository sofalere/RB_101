hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}


arry = []

hsh.each do |key, value|
  if value[:type] == 'fruit'
    arry << value[:colors].map { |color| color.capitalize }
  elsif value[:type] == 'vegetable'
    arry << value[:size].upcase
  end
end

p arry