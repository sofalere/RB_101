require 'pry'

PLAYER_PIECE = 'X'
COMPUTER_PIECE = 'O'
INITIAL_PIECE = " "
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                 [1, 4, 7], [2, 5, 8], [3, 6, 9],
                 [1, 5, 9], [3, 5, 7]]

game_rules = <<-DOC

  Tic tac toe is a two player game played on a 3X3 grid.
  The goal is to be the first to get 3 of your marks (X/O) 
  in a row: vertically, horizontally, or diagonally.
  
DOC

greeting = <<-DOC
  
  Welcome to tic tac toe!

  Your mark is 'X' and the first player 
  to get to 5 wins, is the champion. 
  
  If you've never played before type 'help' for game rules.
  If you're ready press 'Enter'.
DOC

def determine_who_goes_first
  answer = ''
  loop do
    prompt "Who gets to go first? type: 'Player'/ 'Computer'"
    prompt "Press enter to let the computer choose."
    answer = gets.chomp.downcase
    break if answer == 'player' || answer == 'computer' || answer.empty?
    prompt "Not a valid choice"
  end

  if answer.empty?
    answer = ['player', 'computer'].sample
  end

  answer
end

def prompt(msg)
  puts("=> #{msg}")
end

def initialize_grid(grid)
  (1..9).each { |num| grid[num] = INITIAL_PIECE }
end

def joinor(arr, delimiter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

# rubocop:disable Metrics/AbcSize
def display_grid(grid)
  # system 'clear'
  puts ""
  puts "     |     |"
  puts "  #{grid[1]}  |  #{grid[2]}  |  #{grid[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{grid[4]}  |  #{grid[5]}  |  #{grid[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{grid[7]}  |  #{grid[8]}  |  #{grid[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def empty_squares(grid)
  empty = grid.select { |_, move| move == INITIAL_PIECE }
  empty.keys
end

def player_choice!(grid)
  player_move = ''
  loop do
    prompt("Please choose a square: #{joinor(empty_squares(grid))}")
    player_move = gets.chomp.to_i
    break if empty_squares(grid).include?(player_move)
    prompt("Sorry, not a valid choice.")
  end
  grid[player_move] = PLAYER_PIECE
end

def computer_choice!(grid)
  if computer_move = smart_move(grid, COMPUTER_PIECE)
  elsif computer_move = smart_move(grid, PLAYER_PIECE)
  elsif empty_squares(grid).include?(5)
    computer_move = 5
  else
    computer_move = empty_squares(grid).sample
  end
  grid[computer_move] = COMPUTER_PIECE
end

def smart_move(grid, piece)
  move = []
  WINNING_LINES.each do |pat|
    if grid.values_at(pat[0], pat[1]).count(piece) == 2
      move << pat[2]
    elsif grid.values_at(pat[1], pat[2]).count(piece) == 2
      move << pat[0]
    elsif grid.values_at(pat[0], pat[2]).count(piece) == 2
      move << pat[1]
    end
  end

  if (move.size == 1) && (grid[move[0]] == INITIAL_PIECE)
    return move[0]
  elsif move.size >= 2
    return move.select { |sqr| empty_squares(grid).include?(sqr) }
               .sample
  end
  nil
end

def board_full?(grid)
  empty_squares(grid).empty?
end

def someone_won?(grid)
  !!detect_winner(grid)
end

def detect_winner(grid)
  WINNING_LINES.each do |pat|
    if grid.values_at(pat[0], pat[1], pat[2]).count(COMPUTER_PIECE) == 3
      return 'Computer'
    elsif grid.values_at(pat[0], pat[1], pat[2]).count(PLAYER_PIECE) == 3
      return 'Player'
    end
  end
  nil
end

def determine_score(grid, score)
  if detect_winner(grid) == 'Player'
    score[:player] << 1
  elsif detect_winner(grid) == 'Computer'
    score[:computer] << 1
  end
end

def computer_score(score)
  score[:computer].size
end

def player_score(score)
  score[:player].size
end

def score_display(score)
  prompt("Player score: #{player_score(score)}")
  prompt("Computer score: #{computer_score(score)}")
end

def determine_champion(score)
  if player_score(score) == 5
    return 'Player'
  elsif computer_score(score) == 5
    return 'Computer'
  end
  nil
  binding.pry
end

def place_piece!(grid, current_player)
  if current_player == 'player'
    player_choice!(grid)
  elsif current_player == 'computer'
    computer_choice!(grid)
  end
end

def alternate_player(current_player)
  if current_player == 'player'
    'computer'
  elsif current_player == 'computer'
    'player'
  end
end

system "clear"

prompt(greeting)
if gets.chomp.downcase == 'help'
  prompt(game_rules)
end

loop do
  current_player = determine_who_goes_first
  prompt "#{current_player.capitalize} goes first..."

  score = { player: [],
            computer: [] }

  loop do
    start_grid = {}
    initialize_grid(start_grid)
    grid = start_grid

    loop do
      display_grid(grid)
      place_piece!(grid, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(grid) || board_full?(grid)
    end

    display_grid(grid)

    if someone_won?(grid)
      determine_score(grid, score)
      prompt("#{detect_winner(grid)} won!")
    elsif board_full?(grid)
      prompt("It's a tie!")
    end

    score_display(score)
    break if determine_champion(score)
    prompt("Press enter to continue.")
    gets.chomp
  end

  prompt("#{determine_champion(score)} is the champion!")
  prompt("Play again? (y/ n)")
  play_again = gets.chomp.downcase
  break unless play_again.start_with? 'y'
end

prompt("Thanks for playing!")
