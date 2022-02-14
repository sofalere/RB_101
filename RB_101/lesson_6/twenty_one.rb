require 'pry'
require 'byebug'

ONE_SUIT = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']
HEARTS = ONE_SUIT.map { |card| [card, ' of Hearts'] }
DIAMONDS = ONE_SUIT.map { |card| [card, ' of Diamonds'] }
SPADES = ONE_SUIT.map { |card| [card, ' of Spades'] }
CLUBS = ONE_SUIT.map { |card| [card, ' of Clubs'] }

DECK = HEARTS + DIAMONDS + SPADES + CLUBS
ROYALTY = ['Jack', 'Queen', 'King']
WIN_NUMBER = 21
DEALER_STAY_NUMBER = 17

greeting = <<-DOC

  Welcome to twenty-one!
  
  Get to 21, or closer than the dealer, without
  going over(busting) to win. First player to 5
  wins is the champion, good luck!
  
  Press 'Enter' to begin...
  
DOC

def prompt(str)
  puts "=> #{str}"
end

def choose_next_card(deck)
  deck.shuffle!.pop
end

def initialize_game_set(deck)
  [choose_next_card(deck), choose_next_card(deck)]
end

def total(deck)
  cards = deck.map { |set| set[0] }
  values = cards.map do |card|
    if ROYALTY.include?(card)
      10
    elsif card == 'Ace'
      11
    else
      card.to_i
    end
  end
  game_total = values.sum

  cards.select { |card| card == 'Ace' }.count.times do
    game_total -= 10 if game_total > WIN_NUMBER
  end

  game_total
end

def display_initial(dealer, player)
  prompt("Dealer has: |#{dealer[0].join}| and |X|")
  prompt("  You have: |#{player[0].join}| and |#{player[1].join}|")
  prompt('')
end

def card_add(deck)
  display_deck = ''
  deck.each { |card| display_deck += " |#{card.join}| " }
  display_deck
end

def display_hands(dealer, player)
  prompt('')
  if dealer.size == 2 && player.size > 2
    prompt("Dealer has: |#{dealer[0].join}| and |X|")
  else
    prompt('Dealer has:' + card_add(dealer))
  end
  prompt('  You have:' + card_add(player))
  prompt('')
end

def display_card_total(player, dealer = 0)
  prompt("Dealers total is #{total(dealer)}") if dealer != 0
  prompt("Your total is #{total(player)}")
  prompt('')
end

def players_turn!(deck, player, opponent)
  loop do
    results = win_or_bust(total(player))
    break if results == :bust || results == :win21
    prompt("Would you like to hit or stay? type 'H' or 'S'")
    player_choice = gets.chomp.downcase
    break if player_choice == 's'
    player << choose_next_card(deck)
    system 'clear'
    display_hands(opponent, player)
    display_card_total(player)
  end
end

def dealers_turn!(deck, dealer, opponent)
  prompt("")
  prompt("---Dealers turn---")
  prompt("")
  display_hands(dealer, opponent)
  while total(dealer) <= DEALER_STAY_NUMBER
    dealer << choose_next_card(deck)
    system 'clear'
    display_hands(dealer, opponent)
    display_card_total(opponent, dealer)
  end
end

def win_or_bust(total)
  result = nil
  if total == WIN_NUMBER
    result = :win21
  elsif total > WIN_NUMBER
    result = :bust
  end
  result
end

def get_result(d_total = 0, p_total = 0)
  result = nil
  if (WIN_NUMBER - d_total) > (WIN_NUMBER - p_total)
    result = :player
  elsif (WIN_NUMBER - d_total) < (WIN_NUMBER - p_total)
    result = :dealer
  elsif d_total == p_total
    result = :push
  end
  result
end

def display_result(result)
  case result
  when :player then prompt("You won!")
  when :dealer then prompt("Dealer won.")
  when :push   then prompt("Push.")
  when :p_bust then prompt("Ahh you bust! Dealer won.")
  when :d_bust then prompt("Dealer bust, you won!")
  when :win21  then prompt("Twenty-one!")
  end
  nil
end

def display_score(score)
  prompt('')
  prompt("Dealer: #{score[:dealer]}")
  prompt("Player: #{score[:player]}")
  prompt('')
end

def won?(player, dealer)
  player > dealer
end

def add_point!(winner, score)
  if winner == :dealer
    score[:dealer] += 1
  elsif winner == :player
    score[:player] += 1
  end
end

def player_results(score, p_total)
  case win_or_bust(p_total)
  when :bust
    add_point!(:dealer, score)
    display_result(:p_bust)
  when :win21
    add_point!(:player, score)
    display_result(:win21)
    display_result(:player)
  end
end

def results(score, p_total, d_total)
  case win_or_bust(d_total)
  when :bust
    display_result(:d_bust)
    add_point!(:player, score)
  when :win21
    display_result(:win21)
    display_result(:dealer)
    add_point!(:dealer, score)
  else
    case (get_result(d_total, p_total))
    when :player then add_point!(:player, score)
    when :dealer then add_point!(:dealer, score)
    end
  display_result(get_result(d_total, p_total))
  end
end

system 'clear'
prompt(greeting)
gets.chomp
system 'clear'

loop do
  score = {
    dealer: 0,
    player: 0
  }

  loop do
    loop do
      deck = DECK.clone
      player = initialize_game_set(deck)
      dealer = initialize_game_set(deck)

      display_initial(dealer, player)
      players_turn!(deck, player, dealer)
      p_total = total(player)
      player_results(score, p_total)
      dealers_turn!(deck, dealer, player)
      d_total = total(dealer)

      results(score, p_total, d_total)
      break
    end

    prompt('')
    display_score(score)
    prompt('')
    break if score[:player] == 5 || score[:dealer] == 5
    prompt('Press enter to continue')
    gets.chomp
    system 'clear'
  end

  prompt won?(score[:player], score[:dealer]) ? "You're the champ!" : "The house wins..."
  prompt("Play again? (y or n)")
  play_again = gets.chomp
  break if play_again.start_with? 'y'
end
