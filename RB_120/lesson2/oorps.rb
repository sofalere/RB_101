module Verifiable
  def verified_input(valid = ['y', 'n'], prompt = 'y or n', for_name = false)
    input = ''
    loop do
      input = gets.chomp.downcase
      break if
        for_name ? input.match?(valid) : valid.include?(input)
      puts "Sorry enter #{prompt}"
    end
    input
  end
end

module History
  attr_reader :history

  def init_history
    @history = []
  end

  def display_history
    puts
    puts "#{name} made the following moves:"
    puts
    history.each_with_index { |mv, ind| puts "   Round #{ind + 1}: #{mv.name}" }
  end

  def save_move
    history << move.type
  end

  private

  attr_writer :history
end

module Points
  attr_reader :points

  WINNING_SCORE = 5

  def init_points
    @points = 0
  end

  def add_point!
    self.points += 1
  end

  def won?
    points >= WINNING_SCORE
  end

  private

  attr_writer :points
end

class User
  include Verifiable
  include History
  include Points

  attr_accessor :move, :name

  def initialize
    set_round_tracking!
    set_name
  end

  def set_round_tracking!
    init_points
    init_history
  end

  def display_move
    puts
    puts "#{name} chose #{move}."
  end

  def to_s
    name
  end
end

class Human < User
  def choice
    puts
    puts "Choose one: rock(r) paper(p) scissors(s) lizard(l) spock(sp)"
    mv = verified_input((Move::OPTIONS), Move::OPTIONS.join(' / ').to_s)
    self.move = Move.new(mv)

    display_move
    save_move
  end

  private

  def set_name
    puts "What's your name?"
    self.name = verified_input((/[a-zA-Z0-9]/), 'a valid name', true).capitalize
  end

  def initialize
    super
  end
end

class Computer < User
  def choice
    self.move = name.choice(history)
    display_move
    save_move
  end

  private

  def set_name
    self.name = [R2D2.new, Chappie.new, Sonny.new].sample
  end

  def initialize
    super
  end
end

module Skipable
  def skip(word)
    mv = Move::OPTIONS.sample
    until mv != word
      mv = Move::OPTIONS.sample
    end
    mv
  end
end

class R2D2 < Computer
  def initialize
    @name = 'R2D2'
  end

  def choice(history)
    return Move.new('r') if history.size.even?
    Move.new(Move::OPTIONS.sample)
  end
end

class Sonny < Computer
  include Skipable

  def initialize
    @name = 'Sonny'
  end

  def choice(_)
    mv = skip('p')
    Move.new(mv)
  end
end

class Chappie < Computer
  include Skipable

  def initialize
    @name = 'Chappie'
  end

  def choice(history)
    return Move.new(Move::OPTIONS.sample) if history.empty?
    last = history.last.alias
    return Move.new(last) if history.size.odd?
    Move.new(skip(last))
  end
end

class Move
  attr_accessor :type
  attr_reader :name, :alias

  OPTIONS = %w(r p s l sp)

  def to_s
    type.name
  end

  def >(other_move)
    type.wins_against.include?(other_move.type.class)
  end

  def initialize(move)
    [Rock.new, Paper.new, Scissors.new, Lizard.new, Spock.new].any? do |obj|
      @type = obj if obj.alias == move
    end
  end

  protected

  attr_reader :wins_against
end

class Paper < Move
  def initialize
    @name = 'paper'
    @alias = 'p'
    @wins_against = [Rock, Spock]
  end
end

class Rock < Move
  def initialize
    @name = 'rock'
    @alias = 'r'
    @wins_against = [Lizard, Scissors]
  end
end

class Scissors < Move
  def initialize
    @name = 'scissors'
    @alias = 's'
    @wins_against = [Paper, Lizard]
  end
end

class Lizard < Move
  def initialize
    @name = 'lizard'
    @alias = 'l'
    @wins_against = [Paper, Spock]
  end
end

class Spock < Move
  def initialize
    @name = 'spock'
    @alias = 'sp'
    @wins_against = [Rock, Scissors]
  end
end

class RPSGame
  include Verifiable

  def initialize
    system("clear")
    @human = Human.new
    @computer = Computer.new
  end

  def play
    display_welcome_message
    loop do
      game_body
      break unless play_again?
    end
    display_goodbye_message
  end

  private

  attr_accessor :human, :computer

  def game_body
    loop do
      display_competitors
      human.choice
      computer.choice
      display_winner
      break display_game_winner, reset_scores! if game_end?
    end
  end

  def centered(str, pad = ' ', width = 60)
    str.center(width, pad)
  end

  def display_welcome_message
    system "clear"
    puts
    puts centered("Welcome to RPSLSP #{human.name}!", '~')
    puts
    puts centered("press enter to continue")
    gets
  end

  def display_competitors
    system "clear"
    puts
    puts centered("#{human.name} vs. #{computer.name}")
    puts
    display_points
  end

  def reset_scores!
    view_history?
    [human, computer].each(&:set_round_tracking!)
  end

  def determine_winner
    if computer.move > human.move
      computer.add_point!
      :computer
    elsif human.move > computer.move
      human.add_point!
      :human
    end
  end

  def display_winner
    winner = determine_winner
    puts
    case winner
    when :computer then puts centered("#{computer.name} won!")
    when :human then puts centered("#{human.name} won!")
    else puts centered("It's a tie!")
    end
    puts
    puts "enter to continue"
    gets
  end

  def display_points
    puts
    puts "#{human.name} has #{human.points} points."
    puts "#{computer.name} has #{computer.points} points."
    puts
  end

  def game_end?
    human.won? || computer.won?
  end

  def display_game_winner
    system "clear"
    display_points
    if computer.points > human.points
      puts "#{computer.name} won it all, with #{computer.points}!!"
    else
      puts "#{human.name}, with #{human.points}, you're the ultimate champ!!!"
    end
  end

  def view_history?
    puts
    puts "Enter 'y' to view round history, 'n' to continue without."
    return unless verified_input == 'y'
    system "clear"
    [human, computer].each(&:display_history)
  end

  def play_again?
    puts
    puts "Would you like to play again? (y/n)"
    verified_input == 'y'
  end

  def display_goodbye_message
    puts
    puts "See ya!"
  end
end

RPSGame.new.play
