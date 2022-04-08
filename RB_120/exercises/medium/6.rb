class GuessingGame
  HIGH = 100
  LOW = 1
  ROUNDS = 7
  
  attr_reader :results
  attr_accessor :remaining, :guess, :num_to_guess
  
  def initialize
    @remaining = ROUNDS
    @guess = nil
  end
  
  def reset_num_to_guess
    @num_to_guess = rand(LOW..HIGH)
  end
  
  def play
    reset_num_to_guess
    ROUNDS.times do
      display_remaining
      make_guess
      break display_results if determine_results == :equal
      display_results
    end
  end
  
  def display_remaining
    puts
    puts "You have #{remaining} guesses remaining."
  end
  
  def make_guess
    p guess
    p num_to_guess
    loop do
      puts "Enter a number between #{LOW} and #{HIGH}."
      guess = gets.chomp.to_i
      break self.guess = guess if (LOW..HIGH).include?(guess)
      puts "Sorry, enter a valid number."
    end
    self.remaining -= 1
  end
  
  def determine_results
    @results = if guess == num_to_guess
                :equal
               elsif guess > num_to_guess
                :too_high
               else
                :too_low
               end
  end
  
  def display_results
    puts  case results
          when :equal then "That's the number!"
          when :too_high then "Your guess is too high."
          when :too_low then "Your guess is too low."
          end
  end
end

game = GuessingGame.new
game.play

=begin
You have 7 guesses remaining.
Enter a number between 1 and 100: 104
Invalid guess. Enter a number between 1 and 100: 50
Your guess is too low.

You have 6 guesses remaining.
Enter a number between 1 and 100: 75
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 85
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 0
Invalid guess. Enter a number between 1 and 100: 80

You have 3 guesses remaining.
Enter a number between 1 and 100: 81
That's the number!

You won!

You have 7 guesses remaining.
Enter a number between 1 and 100: 50
Your guess is too high.

You have 6 guesses remaining.
Enter a number between 1 and 100: 25
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 37
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 31
Your guess is too low.

You have 3 guesses remaining.
Enter a number between 1 and 100: 34
Your guess is too high.

You have 2 guesses remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have 1 guesses remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have no more guesses. You lost!
=end