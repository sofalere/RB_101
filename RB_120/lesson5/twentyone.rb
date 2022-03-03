=begin
twenty one is a 2 player game

- the player and the dealer get two cards, the player can see 1 of the dealers
- if the player hits, he gets another card until he busts, or stays
- if the player stays the dealers card is revealed
- if the dealers card total is less than 17, the dealer gets another card
- whoever has the total closest to 21 wins
- if theyre the same, its a tie, no one wins

Participant
-hit
-stay
-bust?
-total

Player
Dealer

Deck
-deal

Card
-ace?
=end

require 'pry'

module Verifiable
  def verified_input(valid, prompt)
    input = nil
    loop do
      input = gets.chomp.downcase
      break if valid.include?(input)
      puts "Sorry, not a valid input. #{prompt}"
    end
    input
  end
end

class Card
  attr_reader :face, :suit

  def initialize(face, suit)
    @face = face
    @suit = suit
  end

  def article
    return 'An' if face == 8 || face == 'Ace'
    'A'
  end

  def to_s
    "#{article} #{face} of #{suit}"
  end

  def ace?
    face == 'Ace'
  end

  def ten?
    ['Jack', 'Queen', 'King'].include?(face)
  end
end

class Deck
  attr_accessor :cards

  FACES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']
  SUITS = ['Hearts', 'Spades', 'Diamonds', 'Clubs']

  def reset!
    @cards = SUITS.each_with_object([]) do |suit, cards|
      FACES.each { |face| cards << Card.new(face, suit) }
    end
    cards.shuffle!
  end

  def deal_one_card
    cards.pop
  end
end

module Hand
  BLACKJACK = 21

  def add_card(card)
    hand << card
  end

  def display_hand
    puts "#{name}'s hand:"
    hand.each { |card| puts "    #{card}" }
    puts
    puts "    #{name}'s total: #{total}"
  end

  def remainder
    return 22 if bust?
    BLACKJACK - total
  end

  def beat?(opponent)
    remainder < opponent.remainder
  end

  def tie?(opponent)
    remainder == opponent.remainder
  end

  def bust?
    total > BLACKJACK
  end

  def total
    total = 0
    hand.each { |card| total += converted_value(card) }
    aces = hand.count(&:ace?)
    while total > BLACKJACK && aces > 0
      total -= 10
      aces -= 1
    end
    total
  end

  def converted_value(card)
    if card.ten?
      10
    elsif card.ace?
      11
    else
      card.face
    end
  end
end

class Participant
  include Verifiable
  include Hand

  attr_accessor :hand, :name

  def initialize
    set_name
  end

  def reset_hand!(deck)
    @hand = []
    2.times { @hand << deck.deal_one_card }
  end

  def hit!(deck)
    add_card(deck.deal_one_card)
  end
end

class Dealer < Participant
  STAY_NUM = 17

  def stay?
    total >= STAY_NUM
  end

  def display_first_hand
    puts "#{name}'s hand:"
    puts "    #{hand.first} and a hidden card."
    puts
  end

  def set_name
    @name = ['Comp', 'Dealy', "ThaBaddest"].sample
  end

  def move(deck)
    system "clear"
    until stay?
      display_hand
      hit!(deck)
    end
  end
end

class Player < Participant
  def move(deck)
    loop do
      puts "Would you like to hit or stay? (h / s)"
      break if verified_input(['h', 's'], "(h / s)") == 's'
      system "clear"
      hit!(deck)
      display_hand
      break if bust?
    end
  end

  def set_name
    puts "What's your name?"
    @name = gets.chomp.capitalize
  end
end

class TwentyOneGame
  include Verifiable

  attr_accessor :player, :dealer, :deck

  def initialize
    clear
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def play
    display_welcome_message
    loop do
      deck.reset!
      round_body
      break unless play_again?
    end
  end

  def round_body
    deal_first_hands
    show_flop
    player.move(deck)
    unless player.bust?
      dealer.move(deck)
      show_final
    end
    determine_winner
  end

  def deal_first_hands
    [player, dealer].each { |gamer| gamer.reset_hand!(deck) }
  end

  def show_flop
    clear
    dealer.display_first_hand
    player.display_hand
    puts
  end

  def determine_winner
    bust_message if someone_bust?
    if player.beat?(dealer)
      puts "You won!"
    elsif player.tie?(dealer)
      puts "Push!"
    else
      puts "Dealer won!"
    end
  end

  def play_again?
    puts "Play again?"
    verified_input(['y', 'n'], ('y / n')) == 'y'
  end

  def show_final
    player.display_hand
    puts
    dealer.display_hand
    puts
  end

  def someone_bust?
    player.bust? || dealer.bust?
  end

  def bust_message
    buster = player.bust? ? player.name : dealer.name
    puts
    puts "#{buster} bust!"
    puts
  end

  def display_welcome_message
    clear
    puts
    puts "WELCOME TO TWENTY ONE"
    puts
    puts "Press enter to start"
    gets
  end

  def clear
    system "clear"
  end
end

game = TwentyOneGame.new
game.play
