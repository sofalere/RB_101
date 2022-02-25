module Verifiable
  def verified_input(valid, prompt = nil, for_name = false)
    input = nil
    loop do
      input = gets.chomp.downcase
      input = input.to_i if input.to_i.to_s == input
      break if for_name ? input.match(valid) : valid.include?(input)
      puts "Sorry not a valid entry. #{prompt}"
    end
    input
  end
end

class Square
  attr_accessor :marker

  def initialize(marker)
    @marker = marker
  end

  def to_s
    marker.to_s
  end

  def []=(location, marker)
    squares[location].marker = marker
  end

  def unmarked?
    (1..9).include?(marker)
  end
end

class Board < Square
  attr_reader :squares

  def initialize
    @squares = {}
    reset!
  end

  def reset!
    (1..9).each { |key| @squares[key] = Square.new(key) }
  end

  def unmarked_keys
    squares.select { |_, square| square.unmarked? }.keys
  end

  def display_unmarked
    size = unmarked_keys.size
    last_two = "#{unmarked_keys[-2]} or #{unmarked_keys[-1]}"
    case size
    when 1 then unmarked_keys.join
    when 2 then last_two
    else "#{unmarked_keys[0..size - 3].join(', ')}, #{last_two}"
    end
  end
  
  def random_unmarked_square
    squares[5].unmarked? ? 5 : unmarked_keys.sample
  end

  def defense_neccessary?(lines = WINNING_LINES)
    lines.any? do |line|
      two_equal_marks?(line) && line.any? { |key| squares[key].unmarked? }
    end
  end

  def offense_neccessary?(comp_marker, lines = WINNING_LINES)
    lines.any? do |line|
      line.count { |key| squares[key].marker == comp_marker } == 2 &&
        line.any? { |key| squares[key].unmarked? }
    end
  end

  def offense_possible?(comp_marker, lines = WINNING_LINES)
    lines.any? do |line|
      line.count { |key| squares[key].unmarked? } == 2 &&
        line.any? { |key| squares[key].marker == comp_marker }
    end
  end

  def at_risk_square(marker = nil)
    square = nil
    WINNING_LINES.any? do |line|
      square = select_unmarked_space(line) if
                              marker && offense_neccessary?(marker, [line]) ||
                              marker.nil? && defense_neccessary?([line])
    end
    square
  end

  def offense_square(marker)
    offense_sqr = nil
    WINNING_LINES.any? do |line|
      if offense_possible?(marker, [line])
        offense_sqr = select_unmarked_space(line)
      end
    end
    offense_sqr
  end

  def winning_marker
    winning_marker = nil
    WINNING_LINES.any? do |lines|
      marks_on_lines = lines.map { |key| squares[key].marker.to_s }
      winning_marker = marks_on_lines.first if matching?(marks_on_lines)
    end
    winning_marker
  end

  def someone_won_round?
    !!winning_marker
  end

  def draw
    puts '+-----+-----+-----+'
    puts '|     |     |     |'
    puts "|  #{squares[1]}  |  #{squares[2]}  |  #{squares[3]}  |"
    puts '|     |     |     |'
    puts '+-----+-----+-----+'
    puts '|     |     |     |'
    puts "|  #{squares[4]}  |  #{squares[5]}  |  #{squares[6]}  |"
    puts '|     |     |     |'
    puts '+-----+-----+-----+'
    puts '|     |     |     |'
    puts "|  #{squares[7]}  |  #{squares[8]}  |  #{squares[9]}  |"
    puts '|     |     |     |'
    puts '+-----+-----+-----+'
  end

  def full?
    unmarked_keys.empty?
  end

  private

  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8],
                   [3, 6, 9], [1, 5, 9], [3, 5, 7]]

  def select_unmarked_space(line)
    line.select { |key| squares[key].unmarked? }.first
  end

  def matching?(input)
    input.sort!
    input.min == input.max
  end

  def two_equal_marks?(line)
    line.any? do |_|
      marks_on_lines = line.map { |key| squares[key].marker }
      marks_on_lines.any? { |mark| marks_on_lines.count(mark) == 2 }
    end
  end
end

class User
  attr_accessor :name, :marker, :points
  def initialize
    set_name
  end

  def to_s
    name
  end

  def add_point!
    self.points += 1
  end

  def reset_points!
    self.points = 0
  end
end

class Player < User
  include Verifiable
  def initialize
    super
  end

  def choose_marker
    system "clear"
    puts
    puts "#{name}, enter the marker you'd like for this round: O / X"
    puts
    @marker = verified_input(['o', 'x'], "(o / x)").upcase
  end

  def mark(board)
    puts "Which square would you like to put your (#{marker})?"
    location = verified_input(board.unmarked_keys, board.display_unmarked)
    board[location] = marker
  end

  private

  def set_name
    puts "Whats your name?"
    self.name = verified_input((/[a-zA-Z0-9]/), nil, true).capitalize
  end
end

class Computer < User
  attr_accessor :opponent_marker

  def initialize
    super
  end

  def assign_opposite_marker(player)
    @opponent_marker = player.marker
    self.marker = opponent_marker == 'X' ? 'O' : 'X'
  end

  def mark(board)
    board[next_move(board)] = marker
  end

  private

  def set_name
    @name = ["Compie", "LilComp", "BoneBitsnHarmony"].sample
  end
  
  def next_move(board)
    if board.offense_neccessary?(marker)
      board.at_risk_square(marker)
    elsif board.defense_neccessary?
      board.at_risk_square
    elsif board.offense_possible?(marker)
      board.offense_square(marker)
    else
      board.random_unmarked_square
    end
  end
end

class TTTGame
  def play
    display_welcome_message
    loop do
      reset_game!
      game_body
      break unless play_again?
    end
    display_goodbye_message
  end

  private

  include Verifiable

  attr_reader :board, :player, :computer
  attr_accessor :current_player, :first_to_play

  DESIRED_ROUNDS = 3

  def initialize
    clear
    @board = Board.new
    @player = Player.new
    @computer = Computer.new
  end
  
  def centered(str)
    str.center(60)
  end

  def display_welcome_message
    puts centered("Welcome to tic tac toe! First player to 5 wins!")
    puts
    puts centered("#{player.name} vs. #{computer.name}")
    puts 
    puts "press enter to continue"
    gets
  end

  def game_body
    loop do
      round_body
      display_board
      display_winner_add_point
      break if someone_won_game?
      reset_round!
    end
    display_game_winner
  end

  def round_body
    loop do
      clear_screen_and_display_board
      switch_current_player
      current_player_defenses
      break if board.full? || board.someone_won_round?
    end
  end

  def switch_current_player
    self.current_player = (current_player == player ? computer : player)
  end

  def current_player_defenses
    current_player.mark(board)
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def who_goes_first
    puts
    puts "Would you like to go first this game? (y / n)"
    @first_to_play = if verified_input(['y', 'n'], "(y or n)") == 'n'
                       computer
                     else
                       player
                     end
  end

  def reset_round_first_player
    self.current_player = first_to_play == computer ? player : computer
  end

  def display_board
    puts
    board.draw
    puts
  end

  def determine_winner
    return current_player.name if current_player.marker == board.winning_marker
  end

  def display_game_winner
    clear
    display_points
    puts centered("#{current_player} won the game!")
  end

  def display_winner_add_point
    clear_screen_and_display_board
    if determine_winner
      current_player.add_point!
      puts centered("#{determine_winner} won!!")
    else
      puts centered("It's a tie!")
    end
    display_points
  end

  def someone_won_game?
    current_player.points >= DESIRED_ROUNDS
  end

  def display_points
    puts
    puts "#{player} has #{player.points}!"
    puts "#{computer} has #{computer.points}!"
    puts
  end

  def play_again?
    puts
    puts "Would you like to play again? (y / n)"
    input = verified_input(['y', 'n'], "(y or n)")
    input == 'y'
  end

  def clear
    system "clear"
  end

  def gamers_marker_reset
    player.choose_marker
    computer.assign_opposite_marker(player)
  end

  def reset_round!
    puts "Press enter to continue"
    gets
    clear
    puts
    puts "Let's play again!"
    puts
    board.reset!
    reset_round_first_player
    gamers_marker_reset
  end

  def reset_game!
    clear
    who_goes_first
    reset_round_first_player
    gamers_marker_reset
    board.reset!
    player.reset_points!
    computer.reset_points!
  end

  def display_goodbye_message
    puts "See ya! Thanks for playing!"
  end
end

TTTGame.new.play
