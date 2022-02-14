# PROBLEM
# rules:
# Scissors beats paper 
# paper beats rock
# rock crushes lizard
# lizard poisons Spock
# Spock smashes scissors
# scissors decapitates lizard
# lizard eats paper
# paper disproves Spock
# Spock vaporizes rock
# rock crushes scissors
# 
# game play:
# the user makes a choice
# the computer makes a choice
# the winner is displayed

# ALGORITHM
# user makes a choice
#   display rules
#   validate that user choice is one of the options
#     have options saved in constant
#   save choice as user move
# computer makes a choice
#   sample one of the constants save as computers choice
# determine winner
#   if the players move is 1st element AND computer move is
#   2nd the player won, reverse is also true
#   combine moves, verify, reverse, verify
# display winner
#   prompt you won or computer won based off who has the 1st element

def prompt(message)
  puts "=>#{message}"
end

rules = "Game rules: Scissors cuts paper, paper covers rock, rock crushes lizard 
  lizard poisons spock, spock smashes scissors, scissors decapitates lizard,
  lizard eats paper, paper disproves spock, spock vaporizes rock,
  and as it always has, rock crushes scissors."
  
MOVE_OPTIONS = {'s' =>'scissors', 'p' => 'paper', 'r' =>'rock',
                'l' => 'lizard', 'sp' => 'spock'}
WINNING_COMBOS = [['s', 'p'], ['p', 'r'], ['r', 'l'], ['l', 'sp'], ['sp', 's'],
                  ['s', 'l'], ['l', 'p'], ['p', 'sp'], ['sp', 'r'], ['r', 's']]

def display_options(moves)
  puts ''
  prompt "Please choose one:"
  puts ''
  moves.keys.each do |abbrev|
    prompt "#{moves[abbrev].capitalize} (#{abbrev}) "
  end
end

def get_player_move
  player_move = ''
  loop do
    display_options(MOVE_OPTIONS)
    player_move = gets.chomp
    break if MOVE_OPTIONS.key?(player_move)
    prompt "Not a valid choice, try again."
  end
  player_move
end

def get_computer_move
  MOVE_OPTIONS.keys.sample
end

def get_result(round_moves)
  if WINNING_COMBOS.include?(round_moves)
    :player
  elsif WINNING_COMBOS.include?(round_moves.reverse)
    :computer
  else
    :tie
  end
end

def display_result(winner)
  case winner
  when :player then prompt "You won!"
  when :computer then prompt "Computer won."
  when :tie then prompt "It's a tie!"
  end
end

def add_point!(result, points)
  points[result] += 1 unless result == :tie
end

def display_score(points)
  points.keys.each do |key| 
    prompt "#{key.to_s.capitalize} has #{points[key]} points."
  end
end

def display_moves(player_move, computer_move)
  prompt "You chose: #{MOVE_OPTIONS[player_move]}"
  prompt "Computer chose: #{MOVE_OPTIONS[computer_move]}"
end

def play_again?
  prompt "Play again? (y/n)"
  answer = gets.chomp
  true if answer == 'y'
end

loop do
  prompt rules
  points = { player: 0, computer: 0}
  loop do
    player_move = get_player_move
    computer_move = get_computer_move
    display_moves(player_move, computer_move)
    
    winner = get_result([player_move, computer_move])
    display_result(winner)

    add_point!(winner, points)
    display_score(points)
    
    break if points.values.any? { |score| score >= 5 }
  end

  prompt "#{points.rassoc(5)[0].to_s.capitalize} is the game winner."
  break unless play_again?
end