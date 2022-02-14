VALID_CHOICES = { 'r'  => 'rock',
                  'p'  => 'paper',
                  's'  => 'scissors',
                  'l'  => 'lizard',
                  'sp' => 'spock' }

WINNERS = { 'r'  => ['s' , 'l' ],
            'p'  => ['r' , 'sp'],
            's'  => ['p' , 'l' ],
            'l'  => ['sp', 'p' ],
            'sp' => ['r' , 's' ] }

def prompt(message)
  puts("=> #{message}")
end

def round_winner(user, computer)
  user = VALID_CHOICES.key(user)
  computer = VALID_CHOICES.key(computer)

  if WINNERS[user].include?(computer)
    'user'
  elsif WINNERS[computer].include?(user)
    'computer'
  else
    'tie'
  end
end

def print_results(winner)
  case winner
  when 'user'     then prompt 'You won!'
  when 'computer' then prompt 'You lost!'
  when 'tie'      then prompt 'Its a tie!'
  end
end

def user_choice
  choice = nil
  loop do
    prompt("Choose one: #{VALID_CHOICES.values.join(', ')}")
    prompt("Use: #{VALID_CHOICES.keys.join(', ')}")
    choice = gets.chomp.downcase
    break if VALID_CHOICES.keys.any?(choice)
    prompt("Not a valid choice.")
  end
  VALID_CHOICES[choice]
end

def display_result(user, computer, winner)
  prompt("You chose #{user.capitalize}.")
  prompt("Computer chose #{computer.capitalize}.")
  prompt("...")
  print_results(winner)
end

def winner?(points)
  (points[:user] >= 3) || (points[:computer] >= 3)
end

def add_point!(winner, points)
  if winner == 'user'
    points[:user] += 1
  elsif winner == 'computer'
    points[:computer] += 1
  end
end

def display_points(points)
  prompt("Your score is #{points[:user]},")
  prompt("The computers score is: #{points[:computer]}.")
end

def display_winner(points)
  if points[:user] > points[:computer]
    prompt("YOU'RE THE GRAND WINNER!")
  else
    prompt("The computer won.")
  end
end

def play_again?
  prompt("---")
  prompt("Do you want to play again? (Y/N)")
  play_again = gets.chomp.downcase
  play_again == 'y'
end

loop do
  points = { user: 0,
             computer: 0 }

  loop do
    computer = VALID_CHOICES.values.sample
    user = user_choice
    winner = round_winner(user, computer)

    display_result(user, computer, winner)
    add_point!(winner, points)
    display_points(points)

    break if winner?(points)
  end

  display_winner(points)
  break unless play_again?
end
