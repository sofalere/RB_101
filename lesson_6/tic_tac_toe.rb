=begin

tic tac toe:
  A two player game played on a 3X3 grid. Each player alternates marking an "x" or "o" respectively until one player has three of his letter
  in a row, a collumn, or diagonally. If all 9 squares are selected and neither player has hit 3 it is a tie.

sequence of gameplay:
  1. display 3X3 grid
  2. user chooses square
  3. computer chooses square
  4. if winner, display winner
  5. if whole board full, display tie
  6. if neither repeat steps 1, 2, 3, 4, 5 until 4 or 5 are true
  7. ask if player wants to play again
  
  
Problem:

display a 3X3 grid:
  1. create a nested array with 3 subarrays, each sub-array will represent a row
  2. populate with numbers 1-9
  3. iterate over array so that one row prints per line 
      -create a method for it using each and p?


user marks square:
  1. prompt the user to select a number that mathes the location of the square they want to choose
  2. validate that it is a real number and hasnt already been used
      -any? method
  3. iterate through nested array to replace the number the user chose with an X


computer marks square:
  1. generate a random number from the numbers available in nested array
  2. replace the number in the nested array with an O


check for winner:
  1. if every character in any row is the same, someone won
  2. if every character in the same index of every row is the same, someone won
  3. if every character going up or down an index while also going up or down a row is the same, someone won
  


check for tie:
  1. if none of the sub-arrays are populated with anything but X's and O's and there is no winner, its a tie
  
=end

# require "pry"

# def prompt(message)
#   puts "==>#{message}"
# end

# def display_grid(grid)
#   grid.each { |row| p row }
# end


# game_grid = [[1,"X",3],[4,"X",6],[7,8,9]]

# prompt("Welcome to tic tac toe!")
# display_grid(game_grid)

# # loop do
#   prompt("Please select a number corresponding to the square you choose.")
  
#   user_mark = gets.chomp.to_i
#   game_grid.map! do |row|
#     row.map! do |element|
#       if element == user_mark
#         element = 'X'
#       else
#         element
#       end
#     end
#   end
  
#   prompt("Nice!")
#   display_grid(game_grid)
  
 
  
#   winner = game_grid.select do |row|
#     collumn = []
    
#     if 
#       row.all? { |element| element == "X" || element == "O" }
    
#     elsif 
#       counter = 0
       
#         loop do
#           collumn << row[counter]
#           counter += 1
#           break if counter == row.size
#           collumn
#         end
#       collumn.all? { |element| element == "X" || element == "O" }
      
#     end
    
#   end
  
#   p winner
  
  
#   computer_mark_options = game_grid.flatten.shuffle.select do |element| 
#     element != 'X' && element != 'O'
#   end
  
#   computer_mark = computer_mark_options.first
  
#   game_grid.map! do |row|
#     row.map! do |element|
#       if element == computer_mark
#         element = 'O'
#       else
#         element
#       end
#     end
#   end
#   prompt("And the computer chose...")
#   display_grid(game_grid)
  
  
  


  
# # end


