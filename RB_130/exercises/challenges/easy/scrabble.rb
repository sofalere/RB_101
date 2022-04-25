class Scrabble
  SCRABBLE_VALS = { 1 => %w(A E I O U L N R S T),
                    2 => %w(D G),
                    3 => %w(B C M P),
                    4 => %w(F H V W Y),
                    5 => %w(K),
                    8 => %w(J X),
                    10 => %w(Q Z) }

  def initialize(word)
    @word = word
  end

  def score
    return 0 if @word.nil? || !@word.match?(/[a-z]/i)
    word = @word.upcase
    word.chars.map do |let|
      score = nil
      SCRABBLE_VALS.each do |val, let_arr|
        score = val if let_arr.include?(let)
      end
      score
    end
    .inject(&:+)
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end
