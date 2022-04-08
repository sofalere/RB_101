class Card
  include Comparable

  attr_reader :suit, :rank

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def <=>(other)
    converted_rank <=> other.converted_rank
  end

  protected

  def converted_rank
    case rank
    when "Jack" then 11
    when "Queen" then 12
    when "King" then 13
    when "Ace" then 14
    else rank
    end
  end
end

class Deck
  attr_reader :deck
  
  def initialize
    @deck = new_deck!
  end
  
  def draw
    new_deck! if deck.empty?
    deck.pop
  end
  
  private
  
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
  
  def new_deck!
    temp_deck = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        temp_deck << Card.new(rank, suit)
      end
    end
    @deck = temp_deck.shuffle
  end
end

class PokerHand
  attr_reader :hand

  def initialize(deck)
    temp = []
    5.times { temp << deck.pop }
    @hand = temp
  end

  def print
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def royal_flush?
  end

  def straight_flush?
  end

  def four_of_a_kind?
  end

  def full_house?
  end

  def flush?
  end

  def straight?
  end

  def three_of_a_kind?
    hand.select { |card| card.suit
  end

  def two_pair?
  end

  def pair?
  end
end