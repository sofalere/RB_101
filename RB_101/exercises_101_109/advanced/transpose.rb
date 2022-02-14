# def transpose(matrix)
#   matrix[0].zip(matrix[1], matrix[2])
# end

def transpose(matrix)
  transposed = []
  (0..2).each do |index|
    new_row = matrix.map do |subarray|
      subarray[index]
    end
   transposed << new_row 
  end
  transposed
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]