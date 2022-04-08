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

# The Deck class should provide a 
# draw method to deal one card. The Deck should be shuffled when it 
# is initialized and, if it runs out of cards, it should reset itself 
# by generating a new set of 52 shuffled cards.



deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.