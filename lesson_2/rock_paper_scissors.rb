VALID_CHOICES = %W[rock paper scissors]

def won_or_lost(user_1, user_2)
  (user_1 == 'rock'     && user_2 == 'scissors') ||
  (user_1 == 'paper'    && user_2 == 'rock')     ||
  (user_1 == 'scissors' && user_2 == 'paper')
end

def display_results(user_1, user_2)
  if won_or_lost(user_1, user_2)
    prompt("You won!")
  elsif won_or_lost(user_2, user_1)
    prompt("You lost!")
  else
    prompt("Its a tie!")
  end
end

def prompt(message)
  puts("=> #{message}")
end

def user_choice
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp
    break if VALID_CHOICES.include?(choice)
    prompt("Sorry, cannot play '#{choice}'")
  end
  choice
end

loop do
  choice = user_choice
  computer_choice = VALID_CHOICES.sample
  
  prompt("You chose #{choice}...Computer chose #{computer_choice}")
  prompt("...")
  display_results(choice, computer_choice)
  
  prompt("Do you want to play again? (Y/N)")
  play_again = gets.chomp
  break if play_again.downcase != 'y'
end